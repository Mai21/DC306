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
            txtboxDesc.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Insert new ticket issue
            using (SqlConnection conn = new SqlConnection(Globals.connstr))

            {
                conn.Open();

                try
                {
                    SqlCommand cmd = new SqlCommand("" +
                     "Insert into issues(" +
                     "user_id, title_id, description, status, " +
                     "created_user, created_date, updated_user, updated_date) " +
                     "values(@userId, 1, 'Creat new ticket,1," +
                     "@userId,CURRENT_TIMESTAMP,@userId,CURRENT_TIMESTAMP)", conn);

                    cmd.Parameters.AddWithValue("@title_id", IssueList.Text);

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "Successfully Submitted New Issue Ticket"; 
                        return;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    lblMessage.Text = "Unsuccessfully submitted ticket, please try again!";
                    return;
                }
            }
        }
    
            
        }
    }
