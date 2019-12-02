using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    using BCrypt = BCrypt.Net.BCrypt;
    public partial class RecoverPassoword : System.Web.UI.Page
    {
        string key = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if within 24 hours after a request and userId is correct 
            key = Request.QueryString["ky"];
            if (key == "")
            {
                lbMessage.Text = "Access Error!";
                return;
            }

            tbUserID.Attributes.Add("placeholder", "Input StudentID");
            tbPassword.Attributes.Add("placeholder", "Input new Password");
            tbConfirm.Attributes.Add("placeholder", "Input Confirm Password");
            tbUserID.Attributes.Add("maxlength", "8");
            tbPassword.Attributes.Add("maxlength", "8");
            tbConfirm.Attributes.Add("maxlength", "8");
            tbPassword.Attributes["type"] = "password";
            tbConfirm.Attributes["type"] = "password";

        }

        protected void btnChangePW_Click(object sender, EventArgs e)
        {
            string userId = tbUserID.Text.Trim();
            bool correctUserId = BCrypt.Verify(userId, key);
            if (correctUserId != true)
            {
                lbMessage.Text = "Input a correct StudentID!";
                return;
            }
            // check if the valid time
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT max(request_date) FROM password_recovery " +
                    "WHERE user_id = @userId"
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", userId);
                con.Open();

                try
                {
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            if (rdr.GetValue(0).ToString() == "") {
                                lbMessage.Text = "This request has been expired!\n Please request again.";
                                return;
                            }
                            DateTime requestDt = DateTime.Parse(rdr.GetValue(0).ToString());
                            int result = DateTime.Compare(requestDt, DateTime.Now);
                            System.Diagnostics.Debug.WriteLine("here3");
                            // check time
                            // 24 hours is 86,400 second 
                            if (result < -86400)
                            {
                                lbMessage.Text = "This request has been expired!\n Please request again.";
                                deleteRecord(userId);
                                return;
                            }
                            //OK
                            deleteRecord(userId);
                        }
                        else
                        {
                            // No user Id exists
                            lbMessage.Text = "This request has been expired!\n Please request again.";
                            return;
                        }
                    }
                    // update password
                    cmd = new SqlCommand("" +
                                "UPDATE users SET password = @password, updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                                "WHERE id = @userId ", con);

                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@password", BCrypt.HashPassword(tbPassword.Text.Trim(), BCrypt.GenerateSalt()));
                    cmd.Parameters.AddWithValue("@activeUser", "admin");

                    if (cmd.ExecuteNonQuery() != 1)
                    {
                        lbMessage.Text = "Changing password was failed!";
                        return;
                    }
                    else
                    {
                        lbMessage.Text = "Password was changed!";
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    // Move to an Error page
                    Response.Redirect("SystemError.aspx");
                }
            }
        }

        private void deleteRecord(string userId) {
            // delete record from password recovery
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "DELETE FROM password_recovery " +
                    "WHERE user_id = @userId", con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", userId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}