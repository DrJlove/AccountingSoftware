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
    public partial class AdminControlPage : System.Web.UI.Page
    {

        SqlConnection sqlCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            AddUserButton.Visible = false;
            UpdateUserButton.Enabled = false;

            ChangesLabel.Visible = false;
            if (UserDropDownList.Items.Count == 0)
            {
                string query = "SELECT * FROM UserTable";
                SqlCommand conData = new SqlCommand(query, sqlCon);
                SqlDataReader myReader;

                sqlCon.Open();
                myReader = conData.ExecuteReader();

                while (myReader.Read())
                {
                    string User = myReader.GetString(1);
                    UserDropDownList.Items.Add(User);
                }
                sqlCon.Close();
            }

        }

        protected void LoadUserButton_Click(object sender, EventArgs e)
        {
            string query2 = "SELECT * FROM UserTable WHERE FirstName ='" + UserDropDownList.Text + "';";
            SqlCommand conData = new SqlCommand(query2, sqlCon);
            SqlDataReader myReader2;

            sqlCon.Open();
            myReader2 = conData.ExecuteReader();

            while (myReader2.Read())
            {
                UserIDTextbox.Text = myReader2.GetString(0).ToString(); //Gets User ID
                FirstnameTextbox.Text = myReader2.GetString(1).ToString(); //Gets First name
                LastnameTextbox.Text = myReader2.GetString(2).ToString(); //Gets Last name
                RoleDropDown.Text = myReader2.GetString(3).ToString(); //Gets Role
                bool value = myReader2.GetBoolean(4); //Gets Active
                if (value == true)
                {
                    ActiveCheckBox.Checked = true;
                }
                else
                {
                    ActiveCheckBox.Checked = false;
                }
                UsernameTextbox.Text = myReader2.GetString(5).ToString(); //Gets Username
                PasswordTextbox.Text = myReader2.GetString(6).ToString(); //Gets User Password
                EmailTextbox.Text = myReader2.GetString(8).ToString(); //Gets Email

            }
            sqlCon.Close();
            UserIDTextbox.Enabled = false;
            UpdateUserButton.Enabled = true;
        }

        protected void ClearFieldsButton_Click(object sender, EventArgs e)
        {
            ClearFields();
            ChangesLabel.Visible = false;
        }

        private void ClearFields (){
            UserIDTextbox.Text = "";
            FirstnameTextbox.Text = "";
            LastnameTextbox.Text = "";
            RoleDropDown.Text = "";
            ActiveCheckBox.Checked = false;
            UsernameTextbox.Text = "";
            PasswordTextbox.Text = "";
            EmailTextbox.Text = "";
            RoleDropDown.Text = "Accountant";
            UserIDTextbox.Enabled = true;
        }

        protected void AddUserButton_Click(object sender, EventArgs e)
        {
        //    bool val;
        //    if (ActiveCheckBox.Checked)
        //    {
        //        val = true;
        //    }
        //    else
        //    {
        //        val = false;
        //    }
        //    string ins = "INSERT INTO [UserTable](User_ID, FirstName, LastName, Role, Active, Username, Password) values('" + UserIDTextbox.Text + "', '" + FirstnameTextbox.Text + "', '" + LastnameTextbox.Text + "', '" + RoleDropDown.Text + "', '" + val + "', '" + UsernameTextbox.Text + "', '" + PasswordTextbox.Text + "')";
        //    SqlCommand connect = new SqlCommand(ins, sqlCon);
        //    sqlCon.Open();
        //    connect.ExecuteNonQuery();
        //    sqlCon.Close();

        //    ClearFields();

        //    ChangesLabel.Visible = true;
        }

        protected void UpdateUserButton_Click(object sender, EventArgs e)
        {
            if (UserIDTextbox.Text != "")
            {

                bool val2;
                if (ActiveCheckBox.Checked)
                {
                    val2 = true;
                }
                else
                {
                    val2 = false;
                }

                string Upd = "UPDATE UserTable SET FirstName=@firstname, LastName=@lastname, Role=@role, Active=@active, Username=@username, Password=@password, Email=@email WHERE User_ID='" + UserIDTextbox.Text + "';";
                sqlCon.Open();
                SqlCommand sqlUpdate = new SqlCommand(Upd, sqlCon);
                sqlUpdate.Parameters.AddWithValue("@firstname", FirstnameTextbox.Text.Trim());
                sqlUpdate.Parameters.AddWithValue("@lastname", LastnameTextbox.Text.Trim());
                sqlUpdate.Parameters.AddWithValue("@role", RoleDropDown.Text);
                sqlUpdate.Parameters.AddWithValue("@active", val2);
                sqlUpdate.Parameters.AddWithValue("@username", UsernameTextbox.Text.Trim());
                sqlUpdate.Parameters.AddWithValue("@password", PasswordTextbox.Text.Trim());
                sqlUpdate.Parameters.AddWithValue("@email", EmailTextbox.Text.Trim());

                sqlUpdate.ExecuteNonQuery();

                sqlCon.Close();
                ClearFields();
                ChangesLabel.Visible = true;


            }
        }

        protected void button_ReturnFromModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Welcome.aspx");
        }
    }

}