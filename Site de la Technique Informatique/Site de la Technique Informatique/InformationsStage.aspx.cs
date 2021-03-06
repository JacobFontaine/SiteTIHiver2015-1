﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Site_de_la_Technique_Informatique
{
    public partial class Stages : ErrorHandling
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Set attributes <body>
            HtmlControl body = Master.FindControl("pageBody") as HtmlControl;
            body.Attributes.Add("data-spy", "scroll");
            body.Attributes.Add("data-target", ".scrolltarget");
            body.Attributes.Add("data-offset", "20");
            body.Attributes.Add("style", "position:relative; overflow:auto;");
            #endregion
        }
    }
}