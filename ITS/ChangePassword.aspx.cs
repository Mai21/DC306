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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            /* change password*/
            string targetUserId = "";
            // admin or not
            if ((string)(Session["Authority"]) == "True")
            {
                targetUserId = (string)(Session["TargetUserID"]);
            }
            else 
            {
                targetUserId = (string)(Session["UserID"]);
            }


            

            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id, password " +
                    "FROM users " +
                    "WHERE id = @userId"
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", targetUserId);
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            // check password
                            bool correctPassword = BCrypt.Verify(txtCurrentPassword.Text.Trim(), rdr.GetValue(1).ToString());
                            if (correctPassword != true)
                            {
                                lbErrMessageCurrentPassword.Text = "Current Password is wrong";
                                return;
                            }
                        }
                        else
                        {
                            // No employee Id exists
                            lbMessage.Text = "Session Error";
                            return;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    lbMessage.Text = "System Error!";
                    return;
                }



            }

            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "UPDATE users SET password = @password, updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                    "WHERE id = @userId ", con);

                cmd.Parameters.AddWithValue("@userId", targetUserId);
                cmd.Parameters.AddWithValue("@password", BCrypt.HashPassword(txtPassword.Text.Trim(), BCrypt.GenerateSalt()));
                cmd.Parameters.AddWithValue("@activeUser", "admin");

                con.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    lbMessage.Text = "Password was reset!";
                }
            }
        }
    }
}