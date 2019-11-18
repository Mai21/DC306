using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITS
{
    public partial class DashBoardSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lbResultUserID.Text = (string)(Session["UserID"]);
            //lbResultFirstName.Text = (string)(Session["FirstName"]);
            //lbResultLastName.Text = (string)(Session["LastName"]);
            //lbResultEmail.Text = (string)(Session["Email"]);
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}