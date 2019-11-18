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
            if ((string)(Session["Authority"]) == "true")
            {
                Response.Write("<script>alert('No authority to access this page!')</script>");
                Response.Redirect("Login.aspx");
            }

            rblTier.SelectedIndex = 0;
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
                    "WHERE name = @name"
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@name", tbTitle.Text.Trim());
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
                    System.Diagnostics.Debug.WriteLine("Error1");

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
                    System.Diagnostics.Debug.WriteLine("Error2");
                    System.Diagnostics.Debug.WriteLine(rblTier.SelectedIndex.ToString());
                    System.Diagnostics.Debug.WriteLine((string)(Session["UserID"]));

                    cmd.Parameters.AddWithValue("@name", tbTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@level", rblTier.SelectedIndex.ToString());
                    cmd.Parameters.AddWithValue("@currentUserName", (string)(Session["UserID"]));

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