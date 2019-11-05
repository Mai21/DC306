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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPassword.Attributes.Add("placeholder", "Password");
            txtUserID.Attributes.Add("placeholder", "UserID");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            /* Login Process*/
            // Connect SQL 
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id, first_name, last_name, e_mail, " +
                    "authorization_level_id, availability, password " +
                    "FROM users " +
                    "WHERE id = @userId"
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", txtUserID.Text.Trim());
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            // Check user status
                            if ((int)rdr.GetValue(5) == (int)CommonUtil.RECORD_STATUS.INVALID)
                            {
                                // Invalid ID
                                lbErrMessage.Text = "This UserID is Invalid";
                                return;
                            }
                            // check password
                            bool correctPassword = BCrypt.Verify(txtPassword.Text.Trim(), rdr.GetValue(6).ToString());
                            if (correctPassword == true)
                            {
                                Session["UserID"] = txtUserID.Text.Trim();
                                Session["FirstName"] = rdr.GetValue(1).ToString();
                                Session["LastName"] = rdr.GetValue(2).ToString();
                                Session["Authority"] = rdr.GetValue(4).ToString();
                                Session["Email"] = rdr.GetValue(3).ToString();
                                Session["Password"] = rdr.GetValue(6).ToString();

                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                lbErrMessage.Text = "Password is not correct";
                                //Response.Redirect("DashBoadSP.aspx");
                            }
                        }
                        else
                        {
                            // No employee Id exists
                            lbErrMessage.Text = "UserName is not registered";
                            return;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    lbErrMessage.Text = "System Error!";
                    return;
                }
            }
        }
    }
}