using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounting_Software
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Username"].ToString() == "")
            {
                button_Logout.Visible = false;
            }
            else
            {
                button_Logout.Visible = true;                
            }
        }

        protected void buttonLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Welcome.aspx");
            button_Logout.Visible = false;
        }
    }
}