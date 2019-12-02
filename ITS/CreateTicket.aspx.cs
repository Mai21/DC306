using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace ITS
{
    public partial class CreateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Dictionary Bind
            var listDic = new Dictionary<string, int>();

            // select data from titles table
            // Connect SQL 
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id, name " +
                    "FROM titles ", con);
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                // add id, name to dropdownlist 
                                listDic.Add(rdr.GetValue(1).ToString(), int.Parse(rdr.GetValue(0).ToString()));
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // System Error
                    Console.WriteLine(ex.Message);
                    // Move to an Error page
                    return;
                }
            }

            this.IssueList.DataSource = listDic;
            this.IssueList.DataTextField = "Key";
            this.IssueList.DataValueField = "Value";
            this.IssueList.DataBind();

        }

        protected void btnClear_Click1(object sender, EventArgs e)
        {
            {
                 
            object refUrl = ViewState["CreateTicket.aspx"];
                if (refUrl != null)
                    Response.Redirect((string)refUrl);
            }
            txtboxDesc.Text = string.Empty;
        }
    

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

           
            {
                //Insert new ticket issue
                using (SqlConnection conn = new SqlConnection(Globals.connstr))
                {
                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("" +
                         "Insert into issues(" +
                         "user_id, title_id, description, status, " +
                         "created_user, created_date, updated_user, updated_date) " +
                         "values(@user_id, @title_id, '@description',1," + "@user_id,CURRENT_TIMESTAMP,@user_id,CURRENT_TIMESTAMP)", conn);

                        cmd.Parameters.AddWithValue("@user_id", (string)(Session["UserID"]));
                        cmd.Parameters.AddWithValue("@title_id", IssueList.SelectedIndex);
                               
                  
                    
                       cmd.Parameters.Add(new SqlParameter("@decription", string.IsNullOrEmpty(txtboxDesc.Text) ? (object)DBNull.Value : txtboxDesc.Text));
                        
                        
                        
                        cmd.Parameters.AddWithValue("@desciption", txtboxDesc.Text);

                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            lblMessage.Text = "Successfully Submitted New Issue Ticket";
                            return;
                        }
                    else if (cmd.ExecuteNonQuery() !=1)
                            
                        {
                            lblMessage.Text = "Empty description. Please describe the issue.";
                            return;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Failed to file your issue ticket! Error: " + ex.Message;
                        /*
                        Console.WriteLine(ex.Message);
                        lblMessage.Text = "Failed to file your issue ticket, please try again!";
                        return;
                        */
                    }
                    finally
                    {
                        conn.Close();
                    }

                }

            }
        }


    }
}
