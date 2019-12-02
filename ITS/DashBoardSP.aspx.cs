using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    public partial class DashBoardSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // out of authoriy not allowed to access
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }

            //SQL connection
            SqlConnection con = new SqlConnection(Globals.connstr);

            // count current issues
            SqlCommand cmd = new SqlCommand(
                "SELECT status, count(*) FROM issues WHERE status IN (1,2) GROUP BY status", con);
            try
            {
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        while (rdr.Read())
                        {
                            if (int.Parse(rdr.GetValue(0).ToString()) == 1)
                            {
                                lbPendingNumber.Text = rdr.GetValue(1).ToString();
                            }
                            else if (int.Parse(rdr.GetValue(0).ToString()) == 2) {
                                lbInspectingNumber.Text = rdr.GetValue(1).ToString();
                            }
                        }
                    }
                }

                // count new issues added after last login
                cmd = new SqlCommand("" +
                    "SELECT count(*) FROM issues WHERE created_date > " +
                    "(SELECT max(last_login_date) FROM user_login_histories WHERE user_id = @userId " +
                    "AND last_login_date< (SELECT max(last_login_date) FROM user_login_histories WHERE user_id = @userId))"
                , con);
                cmd.Parameters.AddWithValue("@userId", "admin");

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        lbNewIssueNumber.Text = rdr.GetValue(0).ToString();
                    }
                }

                // if it's empty, set 0
                if (lbPendingNumber.Text.Length == 0) {
                    lbPendingNumber.Text = "0";
                }
                if (lbInspectingNumber.Text.Length == 0)
                {
                    lbInspectingNumber.Text = "0";
                }
                if (lbNewIssueNumber.Text.Length == 0)
                {
                    lbNewIssueNumber.Text = "0";
                }

            }
            catch (Exception ex)
            {
                // System Error
                Console.WriteLine(ex.Message);
                // Move to an Error page
                Response.Redirect("SystemError.aspx");
            }
            finally {
                con.Close();
            }
            
        }

        protected void btnGoTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issues.aspx");
        }
    }
}