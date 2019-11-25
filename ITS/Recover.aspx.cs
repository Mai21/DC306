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
            tbUserID.Attributes.Add("placeholder", "Input UserID eg.190001CH");
            tbUserID.Attributes.Add("maxlength", "8");

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Register as a new issue
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                con.Open();

                try
                {
                    // insert recovery request wtih title ID:1 
                    SqlCommand cmd = new SqlCommand("" +
                        "Insert into issues(" +
                        "user_id, title_id, description, status, " +
                        "created_user, created_date, updated_user, updated_date) " +
                        "values(@userId, 1, 'Password RecoveryRequest',1," +
                        "@userId,CURRENT_TIMESTAMP,@userId,CURRENT_TIMESTAMP)", con);

                    cmd.Parameters.AddWithValue("@userId", tbUserID.Text);

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "The request was successful! \n Please wait for a contact from Technical Support";
                        sendMail();
                        return;
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




            /* Check the existance of email */


            /* Reset Password */
            /*using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "UPDATE users SET password = @password, updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                    "WHERE e_mail = @email ", con);

                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", BCrypt.HashPassword("password", BCrypt.GenerateSalt()));
                cmd.Parameters.AddWithValue("@activeUser", "admin");

                con.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    lbMessage.Text = "Password was reset!";
                }
            }*/

        }

        private void sendMail()
        {
            //mail 
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("tuamacademynz@gmail.com");
            mail.To.Add("pippuriric@gmail.com");
            mail.Subject = "This mail is send from asp.net application";
            mail.Body = "This is Email Body Text";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("tuamacademynz@gmail.com", "cieynrdgygnjkdbo");
            smtp.Send(mail);
        }
    }
}
 