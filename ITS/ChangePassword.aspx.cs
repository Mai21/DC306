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
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }

            if ((string)(Session["TargetUserID"]) == "") {
                // error, go back to UserMaintenance
                Response.Redirect("UserMaintenance.aspx");
            }
            tbUserID.Text = (string)(Session["TargetUserID"]);
            tbPassword.Attributes.Add("placeholder", "Input new Password");
            tbConfirm.Attributes.Add("placeholder", "Input Confirm Password");
            tbPassword.Attributes.Add("maxlength", "8");
            tbConfirm.Attributes.Add("maxlength", "8");
            tbPassword.Attributes["type"] = "password";
            tbConfirm.Attributes["type"] = "password";
        }

        protected void btnChangePW_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Globals.connstr))
                {
                    SqlCommand cmd = new SqlCommand("" +
                        "UPDATE users SET password = @password, updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                        "WHERE id = @userId ", con);

                    cmd.Parameters.AddWithValue("@userId", tbUserID.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", BCrypt.HashPassword(tbPassword.Text.Trim(), BCrypt.GenerateSalt()));
                    cmd.Parameters.AddWithValue("@activeUser", "admin");

                    con.Open();
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
            }
            catch (Exception ex)
            {
                // System Error
                Console.WriteLine(ex.Message);
                // Move to an Error page
                lbMessage.Text = "System Error!";
                return;
            }
        }
    }
}