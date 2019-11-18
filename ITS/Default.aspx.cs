using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lbResultUserID.Text = (string)(Session["UserID"]);
            lbFirstName.Text = (string)(Session["FirstName"]);
            //lbResultLastName.Text = (string)(Session["LastName"]);
            //lbResultEmail.Text = (string)(Session["Email"]);

            // get a current issue
            // Connect SQL 
            /*using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id, title_id, status, created_date " +
                    "FROM issues " +
                    "WHERE user_id = @userId " +
                    "ORDER status ASC "
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@userId", (string)(Session["UserID"]));
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
                                //lbErrMessageUserID.Text = "This StudentID is Invalid";
                                return;
                            }
                            // check password
                            /bool correctPassword = BCrypt.Verify(txtPassword.Text.Trim(), rdr.GetValue(6).ToString());
                            if (correctPassword == true)
                            {
                                Session["UserID"] = txtUserID.Text.Trim();
                                Session["FirstName"] = rdr.GetValue(1).ToString();
                                Session["LastName"] = rdr.GetValue(2).ToString();
                                Session["Authority"] = rdr.GetValue(4).ToString();
                                Session["Email"] = rdr.GetValue(3).ToString();
                                //Session["Password"] = rdr.GetValue(6).ToString();

                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                lbErrMessagePassword.Text = "Password is not correct";
                                //Response.Redirect("DashBoadSP.aspx");
                            }
                        }
                        else
                        {
                            // No employee Id exists
                            lbErrMessageUserID.Text = "Student ID is not registered";
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
            }*/
        }
    }
}