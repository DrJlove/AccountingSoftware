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
            sqlConnection.Open();
            string insert = "INSERT into UserTable ('User ID', 'FirstName', 'LastName', 'Role', 'Active', 'Username', 'Password') VALUES (@UserID, @FirstName, @LastName, @Role, @Active, @Username, @Password);";
            SqlCommand sqlCommand = new SqlCommand(insert, sqlConnection);

            //Random randy = new Random();
            //int userID = randy.Next(1000, 10000);
            try
            {
                sqlCommand.Parameters.AddWithValue("@UserID", "123456");
                sqlCommand.Parameters.AddWithValue("@FirstName", input_FirstName.Text);
                sqlCommand.Parameters.AddWithValue("@LastName", input_LastName.Text);
                sqlCommand.Parameters.AddWithValue("@Role", dropdown_Role.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Active", "Yes");
                sqlCommand.Parameters.AddWithValue("@Username", input_UserName.Text);
                sqlCommand.Parameters.AddWithValue("@Password", input_Password.Text);
                sqlCommand.ExecuteNonQuery();
                sqlConnection.Close();
            }
            catch (Exception exception) {
                Response.Write(exception);
            }
            button_Submit.Text = "howdy";
        }
    }
}