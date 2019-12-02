using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace ITS
{
    using BCrypt = BCrypt.Net.BCrypt;
    public class CommonUtil
    {

        public enum RECORDSTATUS
        {
            VALID = 0,
            INVALID = 1
        }

        public enum AUTHLEVEL
        {
            ADMIN = 0,
            STUDENT = 1
        }

        public enum ISSUSTATUS
        {
            DRAFT = 0,
            PENDING = 1,
            INSPECTING = 2,
            SOLVED = 3,
            SPECIAL = 4
        }

        public enum TIERLEVEL 
        { 
            Tier1 = 0,
            Tier2 = 1
        }


        public static void sendMail(string email, string userId, bool isRecover)
        {
            //mail 
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("tuamacademynz@gmail.com");
            mail.To.Add(email);
            mail.Subject = "This mail is send from asp.net application";
            if (isRecover)
            {
                mail.Body = "Passoword Recovery Request was sent from your email address.\n" +
                    "Please access to the link below in 24 hours." +
                    "\n" +
                    "\n" +
                    "https://localhost:44391/RecoverPassoword.aspx?ky=" + BCrypt.HashPassword(userId, BCrypt.GenerateSalt()) +
                    "\n" +
                    "\n";
            }
            else {
                mail.Body = "New Ticket is created. Please wait for the contact from Technical Support";
            }
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("tuamacademynz@gmail.com", "cieynrdgygnjkdbo");
            smtp.Send(mail);
        }
    }
}