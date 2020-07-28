using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checking();
            
        }

        /*protected void checking()
        {
            //Check Fname
            if (first_name.Text == " ")
            {
                Label_FnameEXp.Text = "*";
            }
            else if (first_name.Text != " ")
            {
                Label_FnameEXp.ForeColor = System.Drawing.Color.Green;
                Label_FnameEXp.Text = "OK";
            }
            else
            {
                Label_FnameEXp.ForeColor = System.Drawing.Color.Red;
                Label_FnameEXp.Text = "Date of Birth Require";
            }

            //Check Lname
            if (last_name.Text == " ")
            {
                Label_LnameExp.Text = "*";
            }
            else if (last_name.Text != " ")
            {
                Label_LnameExp.ForeColor = System.Drawing.Color.Green;
                Label_LnameExp.Text = "OK";
            }
            else
            {
                Label_LnameExp.ForeColor = System.Drawing.Color.Red;
                Label_LnameExp.Text = "Date of Birth Require";
            }

            //Check DOB
            if (date_of_birth.Text == " ")
            {
                Label_DOBExp.Text = "*  (DD/MM/YYYY)";
            }
            else if (date_of_birth.Text != " ")
            {
                Label_DOBExp.ForeColor = System.Drawing.Color.Green;
                Label_DOBExp.Text = "OK";
            }
            else
            {
                Label_DOBExp.ForeColor = System.Drawing.Color.Red;
                Label_DOBExp.Text = "Date of Birth Require (DD/MM/YYYY)";
            }

            //Check Phone
            if (telephone.Text == " ")
            {
                Label_TelExp.Text = "*";
            }
            else if (telephone.Text != " ")
            {
                Label_TelExp.ForeColor = System.Drawing.Color.Green;
                Label_TelExp.Text = "OK";
            }
            else
            {
                Label_TelExp.ForeColor = System.Drawing.Color.Red;
                Label_TelExp.Text = "Phone Require";
            }


            //Check Email
            if (email.Text == " ")
            {
                Label_EmailExp.Text = "*";
            }
            else if (email.Text != " ")
            {
                Label_EmailExp.ForeColor = System.Drawing.Color.Green;
                Label_EmailExp.Text = "OK";
            }
            else
            {
                Label_EmailExp.ForeColor = System.Drawing.Color.Red;
                Label_EmailExp.Text = "Email Require";
            }

            //Check Password
            if (password.Text == " ")
            {
                Label_PasswordExp.Text = "*";
            }
            else if (password.Text.Length > 6)
            {
                Label_PasswordExp.ForeColor = System.Drawing.Color.Green;
                Label_PasswordExp.Text = "OK";
            }
            else
            {
                Label_PasswordExp.ForeColor = System.Drawing.Color.Red;
                Label_PasswordExp.Text = "Password must longer then 6";
            }

            //Check Re-passwpord
            if (Repassword.Text == " ")
            {
                Label_RepasswordExp.Text = "*";
            }
            else if (Repassword.Text == password.Text && password.Text != " ")
            {
                Label_RepasswordExp.ForeColor = System.Drawing.Color.Green;
                Label_RepasswordExp.Text = "OK";
            }
            else
            {
                Label_RepasswordExp.ForeColor = System.Drawing.Color.Red;
                Label_RepasswordExp.Text = "Password not match";
            }
        }*/
        

       

  

        protected void Button_Click_Submit(Object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string checkUser = "Select count(*) from UserInfo where Email = '" + email.Text + "'";
                SqlCommand cmdCheck = new SqlCommand(checkUser, conn);
                int temp = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

                if (temp != 1)
                {
                    string insertQuery = "insert into UserInfo (Fname, Lname, DOB, Tel, Gender, Email, Password) values (@fname, @lname, @dob, @tel, @gender, @email, @password)";
                    SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                    cmdInsert.Parameters.AddWithValue("@fname", first_name.Text);
                    cmdInsert.Parameters.AddWithValue("@lname", last_name.Text);
                    cmdInsert.Parameters.AddWithValue("@dob", date_of_birth.Text);
                    cmdInsert.Parameters.AddWithValue("@tel", telephone.Text);
                    cmdInsert.Parameters.AddWithValue("@gender", gender.Text);
                    cmdInsert.Parameters.AddWithValue("@email", email.Text);
                    cmdInsert.Parameters.AddWithValue("@password", password.Text);
                    cmdInsert.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Register sucessfully!!');window.location ='Login.aspx';", true);
                }
                else
                {
                    errorMessageHidden.Value = "User already exist.";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                errorMessageHidden.Value = "Error: " + ex.ToString();
            }
        }
    }
}