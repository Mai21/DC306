using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ITS
{
    public class CommonUtil
    {
        public enum RECORD_STATUS
        {
            VALID = 1,
            INVALID = 2
        }

        public enum AUTHLEVEL
        {
            ADMIN = 1,
            MANAGER = 2,
            GENERAL = 3
        }
    }
}