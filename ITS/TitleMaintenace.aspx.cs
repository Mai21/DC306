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

            // reload
            if (Request.QueryString["pm"] == "1")
            {
                lbMessage.Text = "New Title was added!";
            }
            else if (Request.QueryString["pm"] == "2") 
            {
                lbMessage.Text = "Update was successful!";
            }

            if (!IsPostBack) {
                if (rblTier.SelectedIndex == -1)
                {
                    rblTier.SelectedIndex = 0;
                }
                else
                {
                    // button name 
                    btnExecute.Text = "Update";
                }
            }

            tbTitle.Attributes.Add("placeholder", "Input a Title");
            tbTitle.Attributes.Add("maxlength", "100");
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            // check update or insert 



            // check duplication
            // Connect SQL 
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT name " +
                    "FROM titles " +
                    "WHERE name = @name" + (btnExecute.Text != "Add"? " and id <> @id":"")
                    "WHERE name = @name" + (!isAdd ? " and id <> @id":"")
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@name", tbTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@id", hdTitleId.Value.Trim());
                cmd.Parameters.AddWithValue("@id", hfTitleId.Value.Trim());
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        
                        if (rdr.HasRows)
                        {
                            // Existing
                            lbMessage.Text = "This title is already existing";
                            return;
                            
                        }
                    }

                    if (isAdd) {
                        System.Diagnostics.Debug.WriteLine("add") ;
                        cmd = new SqlCommand("" +
                        "INSERT INTO titles(name, tier_level," +
                        "created_date, created_user, updated_date, updated_user) " +
                        "OUTPUT INSERTED.id " +
                        "values(@name, @level, CURRENT_TIMESTAMP, @currentUserName, CURRENT_TIMESTAMP, @currentUserName)", con);
                    }
                    else {
                        System.Diagnostics.Debug.WriteLine("update");
                        cmd = new SqlCommand("" +
                            "UPDATE titles " +
                            "SET name = @name, " +
                            "tier_level = @level, " +
                            "updated_date = CURRENT_TIMESTAMP, updated_user = @currentUserName " +
                            "OUTPUT INSERTED.id " +
                            "WHERE id = @id", con);
                    }

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
                        // Success
                        // get id inserted and show the list
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
    }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}