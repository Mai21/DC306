using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ITS
{
    public class CommonUtil
    {
        public enum RECORDSTATUS
        {
            VALID = 0,
            INVALID = 1
        }

        public enum AUTHLEVEL
        {
            ADMIN = 0,
            GENERAL = 1
        }

        public enum ISSUSTATUS
        {
            DRAFT = 0,
            PENDING = 1,
            INSPECTING = 2,
            SOLVED = 3,
            SPECIAL = 4
        }

        public enum TIERLEVEL 
        { 
            Tier1 = 0,
            Tier2 = 1
        }
    }
}