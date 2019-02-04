using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Accounting_Software
{
    public partial class UserCreationPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Button_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                if (fieldsEmpty())
                {
                    throw new Exception("Fields are empty");
                }
                sqlConnection.Open();

                string insert = "INSERT INTO UserTable ([User ID], FirstName, LastName, Role, Active, Username, Password) VALUES (@UserID, @FirstName, @LastName, @Role, @Active, @Username, @Password)";
                SqlCommand sqlCommand = new SqlCommand(insert, sqlConnection);

                Random randy = new Random();
                int userID = randy.Next(1000, 10000);

                sqlCommand.Parameters.AddWithValue("@UserID", userID);
                sqlCommand.Parameters.AddWithValue("@FirstName", input_FirstName.Text);
                sqlCommand.Parameters.AddWithValue("@LastName", input_LastName.Text);
                sqlCommand.Parameters.AddWithValue("@Role", dropdown_Role.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Active", dropdown_Active.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Username", input_UserName.Text);
                sqlCommand.Parameters.AddWithValue("@Password", input_Password.Text);
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception exception)
            {
                Response.Write(exception);
            }
            finally {
                sqlConnection.Close();
            }
            button_Submit.Text = "howdy";
        }

        private Boolean fieldsEmpty()
        {
            if (input_FirstName.Text.Equals(null) || input_FirstName.Text.Equals(""))
                return true;
            if (input_LastName.Text.Equals(null) || input_LastName.Text.Equals(""))
                return true;
            if (input_UserName.Text.Equals(null) || input_UserName.Text.Equals(""))
                return true;
            if (input_Password.Text.Equals(null) || input_Password.Text.Equals(""))
                return true;

            return false;
        }
    }
}