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

        }

/*        protected void Button_Click_Submit(object sender, EventArgs e)
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
    */}
}