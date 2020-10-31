using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button_Click_Update(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string checkUser = "Select count(*) from UserInfo where Email = '" + Session["Email"] + "' AND password = '" + old_password.Text + "'";
                SqlCommand cmdCheck = new SqlCommand(checkUser, conn);
                int match = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

                if (match == 1)
                {
                    string updateInfocmd = "update UserInfo SET Password = @password where Email = '" + Session["Email"] + "'";
                    SqlCommand UpdateInfo = new SqlCommand(updateInfocmd, conn);

                    UpdateInfo.Parameters.AddWithValue("@password", new_password.Text);

                    UpdateInfo.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updated sucessfully!!');window.location ='Personal.aspx';", true);
                }
                else
                {
                    errorMessageHidden.Value = "Error: Old Password not match";
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                errorMessageHidden.Value = "Update Error:" + ex.ToString();
            }
        }

        protected void Button_Click_Back(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }
    }
}