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
    }
}