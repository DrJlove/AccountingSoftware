using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounting_Software
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void button_Login_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                if (fieldsEmpty())
                {
                    throw new Exception("Fields are empty");
                }
                sqlConnection.Open();

                string checkRole = "SELECT Role FROM UserTable WHERE Username like @Username and Password = @Password;";
                SqlCommand sqlCommand = new SqlCommand(checkRole, sqlConnection);

                sqlCommand.Parameters.AddWithValue("@Username", textbox_Username.Text);
                sqlCommand.Parameters.AddWithValue("@Password", textbox_Password.Text);

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                da.Fill(ds);
                sqlConnection.Close();

                bool loginSuccessful = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));

                if (!loginSuccessful)
                    throw new Exception("Invalid Username and Password");

                string role = Convert.ToString(ds.Tables[0].Rows[0]["Role"]);

                sqlConnection.Close();
                redirectOnRole(role);
            }
            catch (Exception exception)
            {
                Response.Write(exception);
            }
        }

        private Boolean fieldsEmpty()
        {
            if (textbox_Username.Text.Equals(null) || textbox_Username.Text.Equals(""))
                return true;
            if (textbox_Password.Text.Equals(null) || textbox_Password.Text.Equals(""))
                return true;

            return false;
        }

        private void redirectOnRole(string role)
        {
            switch (role)
            {
                case "Admin":
                    Response.Redirect("UserCreationPortal.aspx");
                    break;
                default:
                    button_Login.Text = role;
                    break;
            }
        }
    }
}