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
            if ((string)(Session["UserID"]) == "") {
                // error, go back to UserMaintenance
                Response.Redirect("Login.aspx");
            }
            tbUserID.Text = (string)(Session["UserID"]);
            tbCurrentPassword.Attributes.Add("placeholder", "Input current Password");
            tbPassword.Attributes.Add("placeholder", "Input new Password");
            tbConfirm.Attributes.Add("placeholder", "Input Confirm Password");
            tbCurrentPassword.Attributes.Add("maxlength", "8");
            tbPassword.Attributes.Add("maxlength", "8");
            tbConfirm.Attributes.Add("maxlength", "8");
            tbPassword.Attributes["type"] = "password";
            tbConfirm.Attributes["type"] = "password";
        }

        protected void btnChangePW_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                con.Open();

                // check current password 
                SqlCommand cmd = new SqlCommand(
                "SELECT id,password " +
                "FROM users " +
                "WHERE id = @userId"
                , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", tbUserID.Text.Trim());
                try
                {
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows)
                        {
                            System.Diagnostics.Debug.WriteLine("True0?");
                            if (rdr.Read())
                            {
                                // check password
                                bool correctPassword = BCrypt.Verify(tbCurrentPassword.Text.Trim(), rdr.GetValue(1).ToString());
                                if (correctPassword != true)
                                {
                                    lbMessage.Text = "Current password is wrong";
                                    return;
                                }
                            }
                        }
                        else
                        {
                            lbMessage.Text = "Session Timeout";
                            Response.Redirect("Login.aspx");
                        }
                    }

                    cmd = new SqlCommand("" +
                    "UPDATE users SET password = @password, updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                    "WHERE id = @userId ", con);

                    cmd.Parameters.AddWithValue("@userId", tbUserID.Text.Trim());
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
    }
}