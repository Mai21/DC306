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
                            sendMail(tbEmail.Text.Trim(), rdr.GetValue(0).ToString());
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

        private void sendMail(string email, string userId)
        {
            //mail 
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("tuamacademynz@gmail.com");
            mail.To.Add(email);
            mail.Subject = "This mail is send from asp.net application";
            mail.Body = "Passoword Recovery Request was sent from your email address.\n" +
                "Please access to the link below in 24 hours." +
                "\n" +
                "\n" +
                "https://localhost:44391/RecoverPassoword.aspx?ky=" + BCrypt.HashPassword(userId, BCrypt.GenerateSalt()) +
                "\n" +
                "\n";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("tuamacademynz@gmail.com", "cieynrdgygnjkdbo");
            smtp.Send(mail);
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
 