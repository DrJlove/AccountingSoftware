using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounting_Software
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_CreateUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCreationPortal.aspx");
        }
    }
}