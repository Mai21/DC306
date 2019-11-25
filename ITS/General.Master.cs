using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITS
{
    public partial class General : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if the technical support accessed, placeholder will be UserID 
            if (Request.QueryString["sp"] == "ts")
            {
                btnGoAdmin.Visible = false;
            }
        }

        protected void btnGoAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?sp=ts");
        }
    }
}