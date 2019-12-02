using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    public partial class IssueDetail : System.Web.UI.Page
    {
        // issue status
        int status = 0;
        // issue id
        string issueId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            // out of authoriy not allowed to access
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }

            if ((string)(Session["TargetIssueID"]) == "")
            {
                // error! no target issue id set in the session
                Response.Redirect("Issues.aspx");
            }
            else {
                issueId = (string)(Session["TargetIssueID"]);
            }

            //Dictionary Bind
            var listDic = new Dictionary<string, int>();

            // add id, name to dropdownlist 
            foreach (CommonUtil.ISSUSTATUS val in Enum.GetValues(typeof(CommonUtil.ISSUSTATUS)))
            {
                listDic.Add(val.ToString(), int.Parse(Convert.ToInt32(val).ToString()));
            }

            this.dlStatusList.DataSource = listDic;
            this.dlStatusList.DataTextField = "Key";
            this.dlStatusList.DataValueField = "Value";
            this.dlStatusList.DataBind();

            // get the issue from database and set 
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT i.id, u.first_name, u.last_name, i.user_id, t.name AS title_name," +
                    "i.description, i.status, i.updated_date " +
                    "FROM issues AS i INNER JOIN users AS u ON i.user_id = u.id " +
                    "INNER JOIN titles AS t ON i.title_id = t.id " +
                    "WHERE i.id = @issueId"
                    , con);

                // Set a parameter
                cmd.Parameters.AddWithValue("@issueId", issueId);
                try
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            lbId.Text = rdr.GetValue(0).ToString();
                            lbFirstName.Text = rdr.GetValue(1).ToString();
                            lbLastName.Text = rdr.GetValue(2).ToString();
                            lbUserID.Text = rdr.GetValue(3).ToString();
                            lbTitle.Text = rdr.GetValue(4).ToString();
                            tbDescriptionOriginal.Text = rdr.GetValue(5).ToString();
                            lbLastUpdateDate.Text = rdr.GetValue(7).ToString();
                            dlStatusList.SelectedIndex = (int)rdr.GetValue(6);
                            status = (int)rdr.GetValue(6);
                            System.Diagnostics.Debug.WriteLine("1" + status);

                            // if status is solved, it can not be updated. 
                            if ((int)rdr.GetValue(6) == (int)CommonUtil.ISSUSTATUS.SOLVED)
                            {
                                tbDescriptionAdd.Enabled = false;
                                dlStatusList.Enabled = false;
                                btnUpdate.Enabled = false;
                            }
                        }
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (tbDescriptionAdd.Text.Length == 0 && dlStatusList.SelectedIndex == status) {
                // no change
                lbMessage.Text = "No change!";
                return;
            }
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                con.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("" +
                        "UPDATE issues " +
                        "SET status = @status" +
                        (tbDescriptionAdd.Text.Length == 0 ? "" :
                        ", description = CONCAT(description, @addDescription) ") +
                        ",updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                        "WHERE id = @issueId ", con);

                    cmd.Parameters.AddWithValue("@issueId", issueId);
                    cmd.Parameters.AddWithValue("@status", dlStatusList.SelectedIndex);
                    cmd.Parameters.AddWithValue("@addDescription", "\n" + tbDescriptionAdd.Text);

                    cmd.Parameters.AddWithValue("@activeUser", "admin");
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lbMessage.Text = "Update was successful!";
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
    }
}