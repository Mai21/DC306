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
            // count current issues
            //
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT status, count(*) FROM issues WHERE status IN (1,2) GROUP BY status"
                    , con);
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                System.Diagnostics.Debug.WriteLine(rdr.GetValue(0).ToString() + ":" + rdr.GetValue(1).ToString());
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
                    //lbErrMessage.Text = "System Error!";
                    return;
                }
            }
        }

        protected void btnGoTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issues.aspx");
        }
    }
}