using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;

namespace ITS
{
    public class Globals
    {
        public static string connstr =
            ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    }
}