using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace ITS
{
    using BCrypt = BCrypt.Net.BCrypt;
    public partial class Recover : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbEmail.Attributes.Add("placeholder", "Input Email");
            tbEmail.Attributes.Add("maxlength", "100");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // send a email
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id FROM users " +
                    "WHERE e_mail = @email"
                    , con);
                // Set a parameter
                cmd.Parameters.AddWithValue("@email", tbEmail.Text.Trim());

                con.Open();
                
                try
                {
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            // mail
                            CommonUtil.sendMail(tbEmail.Text.Trim(), rdr.GetValue(0).ToString(), true);
                            insertRecovery(rdr.GetValue(0).ToString());

                            lbMessage.Text = "Email will be sent your registered email address.";
                        }
                        else
                        {
                            // No user Id exists
                            lbMessage.Text = "This email is not registered";
                            return;
                        }

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

        private void insertRecovery(string userId) {
            // insert data to recover table
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "INSERT INTO password_recovery(user_id, request_date) " +
                    "VALUES(@userId, CURRENT_TIMESTAMP)", con);

                cmd.Parameters.AddWithValue("@userId", userId);

                con.Open();

                if (cmd.ExecuteNonQuery() != 1)
                {
                    Response.Redirect("SystemError.aspx");
                }
            }
         }
    }
}
 