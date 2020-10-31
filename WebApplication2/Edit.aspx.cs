using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();

                    string getInfoCmd = "select [Email],[Tel],[Password] from UserInfo where Email = '" + Session["Email"] + "'";
                    SqlCommand getInfo = new SqlCommand(getInfoCmd, conn);
                    SqlDataReader reader = getInfo.ExecuteReader();

                    if (reader.Read())
                    {
                        Label_ShowEmail.Text = reader["Email"].ToString();
                        Label_ShowPhone.Text = reader["Tel"].ToString();
                        //Label_ShowPass.Text = reader["Password"].ToString();
                    }
                    else
                    {
                        Response.Write("Error: Unable to get User info");
                    }

                    conn.Close();
                }
            }
        }

        protected void Button_Click_EditEmail(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Email.aspx");
        }

        protected void Button_Click_EditPhone(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Phone.aspx");
        }

        protected void Button_Click_EditPassword(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Password.aspx");
        }

        protected void Button_Click_Back(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }
    }
}