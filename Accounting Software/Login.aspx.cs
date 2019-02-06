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
            labelLoginError.Visible = false;
        }

        protected void button_Login_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                if (fieldsEmpty() == false)
                {
                    //throw new Exception("Fields are empty");
                    return;
                }
                sqlConnection.Open();

                string checkRole = "SELECT Role FROM UserTable WHERE Username like @Username and Password = @Password;";
                SqlCommand sqlCommand = new SqlCommand(checkRole, sqlConnection);

                sqlCommand.Parameters.AddWithValue("@Username", textbox_Username.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@Password", textbox_Password.Text.Trim());

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                da.Fill(ds);
                sqlConnection.Close();

                bool loginSuccessful = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));

                if (!loginSuccessful) {
                    //throw new Exception("Invalid Username and Password");
                    labelLoginError.Visible = true;
                    labelLoginError.Text = GetErrorMessage(4);
                }
                    
                    

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
            bool filled = true;

            if (textbox_Username.Text.Equals("") && textbox_Password.Text.Equals("") || textbox_Username.Text.Equals(null) && textbox_Password.Text.Equals(null))
            {
                labelLoginError.Visible = true;
                labelLoginError.Text = GetErrorMessage(3);
                filled = false;
                return filled;
            }

            if (textbox_Username.Text.Equals(null) || textbox_Username.Text.Equals("")) {
                labelLoginError.Visible = true;
                labelLoginError.Text = GetErrorMessage(1);
                filled = false;
                return filled;
            }

            if (textbox_Password.Text.Equals(null) || textbox_Password.Text.Equals("")) {
                labelLoginError.Visible = true;
                labelLoginError.Text = GetErrorMessage(2);
                filled = false;
                return filled;
            }            

            return filled;
        }

        private void redirectOnRole(string role)
        {
            Session["UserRole"] = role;
            Session["Username"] = textbox_Username.Text.Trim();
            Response.Redirect("Welcome.aspx");
        }

        private string GetErrorMessage(int id)
        {

            string error = "";
            SqlConnection sqlCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            sqlCon.Open();

            string query = "SELECT Description FROM ErrorTable WHERE ErrorID = '" + id + "'";
            SqlCommand conData = new SqlCommand(query, sqlCon);
            SqlDataReader myReader;

            myReader = conData.ExecuteReader();

            while (myReader.Read())
            {
                error = myReader.GetString(0);
            }

            myReader.Close();
            sqlCon.Close();
            return error;
        }


        protected void button_ResetPassword_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                if (textbox_Username.Text.Equals(null) || textbox_Username.Text.Equals(""))
                    throw new Exception("Username is empty.");

                sqlConnection.Open();
                string getUser = "UPDATE UserTable SET Password=@Password WHERE Username=@Username;";
                SqlCommand sqlCommand = new SqlCommand(getUser, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@Username", textbox_Username.Text);
                sqlCommand.Parameters.AddWithValue("@Password", textbox_PasswordReset.Text);
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception exception)
            {
                Response.Write(exception);
            }
        }
    }
}