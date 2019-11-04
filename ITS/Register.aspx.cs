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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserID.Attributes.Add("placeholder", "eg.190001CH");
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            /* create process*/
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand("" +
                    "Insert into users(id, first_name, last_name, e_mail, authorization_level_id, availability, password, created_user, created_date, updated_user, updated_date) " +
                    "values(@userId, @firstName, @lastName,@email,@authLevel,@availability,@password,@activeUser,CURRENT_TIMESTAMP,@activeUser,CURRENT_TIMESTAMP)", con);

                cmd.Parameters.AddWithValue("@userId", txtUserID.Text);
                cmd.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);

                string passwordHash = BCrypt.HashPassword(txtPassword.Text.Trim(), BCrypt.GenerateSalt());
                cmd.Parameters.AddWithValue("@password", passwordHash);
                cmd.Parameters.AddWithValue("@availability", "0");
                cmd.Parameters.AddWithValue("@authLevel", "0");
                cmd.Parameters.AddWithValue("@activeUser", "admin");

                con.Open();

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lbMessage.Text = "New User is added!";
                }
            }
        }
    }
}