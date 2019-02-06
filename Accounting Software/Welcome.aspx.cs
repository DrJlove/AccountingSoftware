using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Accounting_Software
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Username"].ToString() == "")
                {
                label_Welcome.Text = "Welcome to Objective Accounting";
                button_CreateUser.Visible = false;
                button_EditUser.Visible = false;
            }
            else {
                string u = GetFirstName(Session["Username"].ToString());
                string currentRole = Session["UserRole"].ToString();
                System.Diagnostics.Debug.WriteLine(currentRole);
                label_Welcome.Text = "Welcome to Objective Accounting, " + u;
                LoginPageButton.Visible = false;
                if (currentRole == "Admin") {

                    button_CreateUser.Visible = true;
                    button_EditUser.Visible = true;
                }
            }
        }

        protected void button_CreateUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCreation.aspx");
        }

        protected void button_EditUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminControlPage.aspx");
        }

        protected void LoginPageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


        private string GetFirstName(string user)
        {

            string Firstname = "";
            SqlConnection sqlCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            sqlCon.Open();

            string query = "SELECT FirstName FROM UserTable WHERE Username = '" + user + "'";
            SqlCommand conData = new SqlCommand(query, sqlCon);
            SqlDataReader myReader;

            myReader = conData.ExecuteReader();

            while (myReader.Read())
            {
                Firstname = myReader.GetString(0);
            }

            myReader.Close();
            sqlCon.Close();
            return Firstname;
        }
    }
}