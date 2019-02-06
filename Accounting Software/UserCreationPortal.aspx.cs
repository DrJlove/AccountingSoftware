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
            label_UserAdded.Visible = false;
        }

        protected void submit_Button_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                if (fieldsEmpty() == false)
                {
                    label_UserAdded.ForeColor = System.Drawing.Color.Red;
                    label_UserAdded.Text = GetErrorMessage(5);
                    label_UserAdded.Visible = true;
                    //throw new Exception("Fields are empty");                    
                    return;
                }

                bool IsPasswordSufficient = CheckPassword();
                if (!IsPasswordSufficient) {
                    return;
                }

                sqlConnection.Open();

                string insert = "INSERT INTO UserTable (User_ID, FirstName, LastName, Role, Active, Username, Password, Email) VALUES (@UserID, @FirstName, @LastName, @Role, @Active, @Username, @Password, @Email)";
                SqlCommand sqlCommand = new SqlCommand(insert, sqlConnection);

                Random randy = new Random();
                int userID = randy.Next(1000, 10000);

                bool Active;
                if (Checkbox_Active.Checked == true)
                {
                    Active = true;
                }
                else {
                    Active = false;
                }

                sqlCommand.Parameters.AddWithValue("@UserID", userID);
                sqlCommand.Parameters.AddWithValue("@FirstName", input_FirstName.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@LastName", input_LastName.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@Role", dropdown_Role.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Active", Active);
                sqlCommand.Parameters.AddWithValue("@Username", input_UserName.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@Password", input_Password.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@Email", input_Email.Text.Trim());
                sqlCommand.ExecuteNonQuery();

                input_FirstName.Text = "";
                input_LastName.Text = "";
                input_UserName.Text = "";
                input_Password.Text = "";
                input_Email.Text = "";
                Checkbox_Active.Checked = false;

                label_UserAdded.ForeColor = System.Drawing.Color.Black;
                label_UserAdded.Text = "User Added Successfully.";
                label_UserAdded.Visible = true;
                label_FormatPassword.Visible = false;
                label_FormatEmail.Visible = false;
            }
            catch (Exception exception)
            {
                Response.Write(exception);
            }
            finally {
                sqlConnection.Close();
                
            }
        }

        private Boolean fieldsEmpty()
        {
            bool filled = true;

            if (input_FirstName.Text.Equals(null) || input_FirstName.Text.Equals(""))
                filled = false;
            if (input_LastName.Text.Equals(null) || input_LastName.Text.Equals(""))
                filled = false;
            if (input_UserName.Text.Equals(null) || input_UserName.Text.Equals(""))
                filled = false;
            if (input_Password.Text.Equals(null) || input_Password.Text.Equals(""))
                filled = false;
            if (input_Email.Text.Equals(null) || input_Email.Text.Equals(""))
                filled = false;

            return filled;
        }

        private Boolean CheckPassword()
        {
            bool Sufficient = true;

            string pass = input_Password.Text;

            if (pass.Length <= 3) {
                Sufficient = false;
                label_FormatPassword.Text = GetErrorMessage(6);
                return Sufficient;
            }

            //string specialChar = @"\|!#$%&/()=?»«@£§€{}.-;'<>_,";
            //foreach (var item in specialChar)
            //{
            //    if (pass.Contains(item))
            //    {
            //        //It has a special character
            //    }
            //    else {
            //        Sufficient = false;
            //        label_FormatPassword.Text = GetErrorMessage(8);
            //        return Sufficient;
            //    }
            //}

            bool hasUpperCaseLetter = false;
            bool hasLowerCaseLetter = false;
            bool hasDecimalDigit = false;

            foreach (char c in pass)
            {
                if (char.IsUpper(c)) hasUpperCaseLetter = true;
                else if (char.IsLower(c)) hasLowerCaseLetter = true;
                else if (char.IsDigit(c)) hasDecimalDigit = true;
            }
            bool isValid = hasUpperCaseLetter && hasLowerCaseLetter && hasDecimalDigit;

            if (isValid == false) {
                Sufficient = false;
                label_FormatPassword.Text = GetErrorMessage(7);
                return Sufficient;
            }


            return Sufficient;
        }

        private string GetErrorMessage(int id) {

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

        protected void button_Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("Welcome.aspx");
        }

        protected void button_ClearNewUser_Click(object sender, EventArgs e)
        {
            input_FirstName.Text = "";
            input_LastName.Text = "";
            input_UserName.Text = "";
            input_Password.Text = "";
            input_Email.Text = "";
            Checkbox_Active.Checked = false;
            dropdown_Role.Text = "Admin";
        }
    }
}