using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace ITS
{
    public partial class Archive : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private string connstr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ITSConnectionString"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connstr);
            cmd = new SqlCommand("Insert into issues (title_id, description) Values (@title_id, @description)", conn);
            
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}
   