using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Button_Click(Object sender, EventArgs e)
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

                    Response.Write("User does not exist.");
                }
                else
                {
                    string validate = "Select count(*) from UserInfo where Email = @email and Password = @password";
                    SqlCommand cmdValidate = new SqlCommand(validate, conn);
                    cmdValidate.Parameters.AddWithValue("@email", email.Text);
                    cmdValidate.Parameters.AddWithValue("@password", password.Text);
                    int count = Convert.ToInt32(cmdValidate.ExecuteScalar().ToString());
                    if (count == 1)
                    {
                        Session["Email"] = email.Text;
                        Session["UID"] = GetId();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Response.Write("Password does not match");
                    }
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        private int GetId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkUser = "Select UID from UserInfo where Email = '" + email.Text + "'";
            SqlCommand cmdCheck = new SqlCommand(checkUser, conn);
            int id = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            return id;
        }
    }
}