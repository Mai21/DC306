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
        // Default setting
        bool isAdmin = false;
        string userType = "Student ID";

        protected void Page_Load(object sender, EventArgs e)
        {
            // add setting of hidden to passowrd box 
            tbPassword.Attributes["type"] = "password";
            
            tbPassword.Attributes.Add("placeholder", "Password");
            tbPassword.Attributes.Add("maxlength", "8");

            // if the technical support accessed, placeholder will be UserID 
            if (Request.QueryString["sp"] == "ts")
            {
                userType = "User ID";
                isAdmin = true;
            }
            tbUserID.Attributes.Add("placeholder", userType);

            // max length
            tbUserID.Attributes.Add("maxlength", "8");
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
                cmd.Parameters.AddWithValue("@userId", tbUserID.Text.Trim());
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            // Check user status
                            if ((int)rdr.GetValue(5) == (int)CommonUtil.RECORDSTATUS.INVALID)
                            {
                                // Invalid ID
                                lbErrMessageUserID.Text = userType + " is Invalid";
                                return;
                            }
                            // check password
                            bool correctPassword = BCrypt.Verify(tbPassword.Text.Trim(), rdr.GetValue(6).ToString());
                            if (correctPassword == true)
                            {
                                Session["UserID"] = tbUserID.Text.Trim();
                                Session["FirstName"] = rdr.GetValue(1).ToString();
                                Session["LastName"] = rdr.GetValue(2).ToString();
                                Session["Authority"] = rdr.GetValue(4).ToString();
                                Session["Email"] = rdr.GetValue(3).ToString();
                                //Session["Password"] = rdr.GetValue(6).ToString();
                            }
                            else
                            {
                                lbErrMessagePassword.Text = "Password is not correct";
                                return;
                            }
                        }
                        else
                        {
                            // No user Id exists
                            lbErrMessageUserID.Text = userType + " is not registered";
                            return;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    // Move to an Error page
                    //lbErrMessage.Text = "System Error!";
                    return;
                }
            }
            // Insert User Last Login Date
            insertLastLogin(tbUserID.Text.Trim());
            
            // Depends on the user type, dashboad is different
            if (isAdmin)
            {
                Response.Redirect("DashBoadSP.aspx");
            }
            else 
            {
                Response.Redirect("Default.aspx");
            }
            
        }

        // Insert User Last Login
        private void insertLastLogin(String userId) {
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "Insert into user_login_histories(user_id, last_login_date) " +
                    "values(@userId, CURRENT_TIMESTAMP)", con);

                cmd.Parameters.AddWithValue("@userId", tbUserID.Text);

                con.Open();

                if (cmd.ExecuteNonQuery() != 1)
                {
                    // Go to System Error Page
                }
            }
        }
    }
}