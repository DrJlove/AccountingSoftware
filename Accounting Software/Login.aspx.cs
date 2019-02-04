using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Accounting_Software
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection sqlCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLabel.Visible = false;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string query = "SELECT COUNT(1) FROM UserTable WHERE Username=@username AND Password=@password";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCon.Open();
            sqlCmd.Parameters.AddWithValue("@username", UsernameTxt.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@password", PasswordTxt.Text.Trim());
            int count = Convert.ToInt32(sqlCmd.ExecuteScalar().ToString());
            sqlCon.Close();

            if (count == 1)
            { //Means the credentials do exist
                Session["username"] = UsernameTxt.Text.Trim();
                Response.Redirect("AdminControlPage.aspx");
            }

        }



    }
}