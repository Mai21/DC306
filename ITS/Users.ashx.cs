using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ITS
{
    /// <summary>
    /// Summary description for Users
    /// </summary>
    public class Users : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            User user = new User("Keisuke", "Oyama", "000001");

            System.Web.Script.Serialization.JavaScriptSerializer serializer
                = new System.Web.Script.Serialization.JavaScriptSerializer();

            context.Response.Write(serializer.Serialize(user));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public class User
        {
            public User(
                string firstName,
                string lastName,
                string userId)
            {
                FirstName = firstName;
                LastName = lastName;
                UserID = userId;
            }

            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string UserID { get; set; }
        }
    }
}