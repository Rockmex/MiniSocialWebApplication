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
                        Label_Email.Text = reader["Email"].ToString();
                        Label_Phone.Text = reader["Tel"].ToString();
                        Label_Password.Text = reader["Password"].ToString();
                    }
                    else
                    {
                        Response.Write("Error: Unable to get User info");
                    }

                    conn.Close();
                }
            }
        }

        protected void Button1_Click(Object sender, EventArgs e)
        {
            Response.Redirect("E1.aspx");
        }

        protected void Button2_Click(Object sender, EventArgs e)
        {
            Response.Redirect("E2.aspx");
        }

        protected void Button3_Click(Object sender, EventArgs e)
        {
            Response.Redirect("E3.aspx");
        }

        protected void Button4_Click(Object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }
    }
}