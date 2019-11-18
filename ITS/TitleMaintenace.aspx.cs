using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITS
{
    public partial class TitleMaintenace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rblTier.SelectedIndex = 0;
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {

        }
    }
}