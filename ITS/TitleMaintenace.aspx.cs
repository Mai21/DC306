using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    public partial class TitleMaintenace : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check the authority
            // System.Diagnostics.Debug.WriteLine((string)(Session["Authority"]));

            // out of authoriy not allowed to access
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }

            // reload
            if (Request.QueryString["pm"] == "1")
            {
                lbErrMessageTitle.Text = "New Title was added!";
            }
            else if (Request.QueryString["pm"] == "2") 
            {
                lbErrMessageTitle.Text = "Update was successful!";
            }

            if (!IsPostBack) {
                if (rblTier.SelectedIndex == -1)
                {
                    rblTier.SelectedIndex = 0;
                }
                /*else
                {
                    // button name 
                    btnExecute.Text = "Update";
                }*/
            }

            tbTitle.Attributes.Add("placeholder", "Input a Title");
            tbTitle.Attributes.Add("maxlength", "100");
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            // check duplication
            // Connect SQL 
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT name " +
                    "FROM titles " +
                    "WHERE name = @name" + (btnExecute.Text != "Add"? " and id <> @id":"")
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@name", tbTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@id", hdTitleId.Value.Trim());
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        
                        if (rdr.HasRows)
                        {
                            // Existing
                            lbErrMessageTitle.Text = "This title is already existing";
                            return;
                            
                        }
                    }

                    if (btnExecute.Text == "Add") {
                        cmd = new SqlCommand("" +
                        "INSERT INTO titles(name, tier_level," +
                        "created_date, created_user, updated_date, updated_user) " +
                        "OUTPUT INSERTED.id " +
                        "values(@name, @level, CURRENT_TIMESTAMP, @currentUserName, CURRENT_TIMESTAMP, @currentUserName)", con);
                    }
                    else {
                        cmd = new SqlCommand("" +
                            "UPDATE titles " +
                            "SET name = @name, " +
                            "tier_level = @level, " +
                            "updated_date = CURRENT_TIMESTAMP, updated_user = @currentUserName " +
                            "OUTPUT INSERTED.id " +
                            "WHERE id = @id", con);
                    }

                    cmd.Parameters.AddWithValue("@id", hdTitleId.Value.Trim());
                    cmd.Parameters.AddWithValue("@name", tbTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@level", rblTier.SelectedIndex.ToString());
                    cmd.Parameters.AddWithValue("@currentUserName", (string)(Session["UserID"]));

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        //lbErrMessageTitle.Text = "New User is added!";
                        Response.Redirect(Request.Url.OriginalString + "?pm=1");
                    }
                    
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        if (btnExecute.Text == "Add")
                        {
                            Response.Redirect(Request.QueryString["pm"] == null ?
                            Request.Url.OriginalString + "?pm=1" :
                            Request.Url.OriginalString.Substring(1, Request.Url.OriginalString.IndexOf("?")) + "?pm=1");
                        }
                        else 
                        {
                            Response.Redirect(Request.QueryString["pm"] == null ?
                            Request.Url.OriginalString + "?pm=2" :
                            Request.Url.OriginalString.Substring(1, Request.Url.OriginalString.IndexOf("?")) + "?pm=2");
                        }

                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    // Move to an Error page
                    lbErrMessageTitle.Text = "System Error!";
                    return;
                }
            }
    }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}