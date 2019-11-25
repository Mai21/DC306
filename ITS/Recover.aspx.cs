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
                        "@activeUser,CURRENT_TIMESTAMP,@activeUser,CURRENT_TIMESTAMP)", con);

                    cmd.Parameters.AddWithValue("@userId", tbUserID.Text);
                    cmd.Parameters.AddWithValue("@activeUser", "admin");

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "The request was successful! Please wait for a contact from Technical Support";
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
            }
            /* mail 
             
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("indigo.shadow.smiles@gmail.com");
            mail.To.Add("pippuriric@gmail.com");
            mail.Subject = "This mail is send from asp.net application";
            mail.Body = "This is Email Body Text";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("indigo.shadow.smiles@gmail.com", "kepwdtpzvylyqljj");
            smtp.Send(mail);

            /*mail.To.Add("pippuriric@gmail.com");
            mail.From = new MailAddress("indigo.shadow.smiles@gmail.com", "Email head", System.Text.Encoding.UTF8);
            mail.Subject = "This mail is send from asp.net application";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "This is Email Body Text";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential("indigo.shadow.smiles@gmail.com", "6720723mai");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
            }*/
        }
    }
}