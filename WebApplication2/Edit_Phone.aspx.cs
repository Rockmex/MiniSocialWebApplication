using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button_Click_Update(Object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();


                string updateInfocmd = "update UserInfo SET Tel = @Tel where Email = '" + Session["Email"] + "'";
                SqlCommand UpdateInfo = new SqlCommand(updateInfocmd, conn);
                UpdateInfo.Parameters.AddWithValue("@Tel", new_phone.Text);

                UpdateInfo.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","alert('Updated sucessfully!!');window.location ='Personal.aspx';",true);

                conn.Close();
            }
            catch (Exception ex)
            {
                errorMessageHidden.Value = "Update Error:" + ex.ToString();
            }
        }

        protected void Button_Click_Back(Object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }
    }
}