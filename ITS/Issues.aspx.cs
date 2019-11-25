using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITS
{
    public partial class Issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // out of authoriy not allowed to access
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            Session["TargetIssueID"] = hfTargetId.Value.Trim();
            Response.Redirect("IssueDetail.aspx");
        }
    }
}