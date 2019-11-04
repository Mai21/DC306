using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ITS
{
    using BCrypt = BCrypt.Net.BCrypt;
    public partial class LoginSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                                //lbErrMessageUserID.Text = "This UserID is Invalid";
                                return;
                            }
                            // check password
                            //int salt = 14;
                            string passwordHash = BCrypt.HashPassword(txtPassword.Text.Trim(), BCrypt.GenerateSalt());
                            //lbErrMessageUserID.Text = ":" + passwordHash + ":";



                            //Console.WriteLine(passwordHash);
                            //lbErrMessage.Text = ":" + rdr.GetValue(6).ToString() + ":";
                            bool correctPassword = BCrypt.Verify(txtPassword.Text.Trim(), rdr.GetValue(6).ToString());
                            if (correctPassword == true)
                            {
                                Session["UserID"] = txtUserID.Text.Trim();
                                Session["FirstName"] = rdr.GetValue(1).ToString();
                                Session["LastName"] = rdr.GetValue(2).ToString();
                                Session["Authority"] = rdr.GetValue(4).ToString();
                                Session["Email"] = rdr.GetValue(3).ToString();
                                Session["Password"] = rdr.GetValue(6).ToString();

                                Response.Redirect("DashBoadSP.aspx");
                            }
                            else
                            {
                                //lbErrMessage.Text = passwordHash;

                                //Response.Redirect("DashBoadSP.aspx");
                            }

                            //}
                            //else
                            //{
                            // Password is wrong
                            //    MessageBox.Show("Password is wrong");
                            //    return;
                            //}
                        }
                        else
                        {
                            // No employee Id exists
                            // lbErrMessageUserID.Text = "UserName is not registered";
                            return;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    //lbErrMessage.Text = "System Error!";
                    return;
                }
            }
        }
    }
}