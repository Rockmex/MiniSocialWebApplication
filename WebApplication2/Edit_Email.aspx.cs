using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm9 : System.Web.UI.Page
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


                string updateInfocmd = "update UserInfo SET Email = @email where Email = '" + Session["Email"] + "'";
                SqlCommand UpdateInfo = new SqlCommand(updateInfocmd, conn);
                UpdateInfo.Parameters.AddWithValue("@email", new_email.Text);

                UpdateInfo.ExecuteNonQuery();
                Session["Email"] = new_email.Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updated sucessfully!!');window.location ='Personal.aspx';", true);

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