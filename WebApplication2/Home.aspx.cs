using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string getFnameCmd = "select Fname from UserInfo where Email = '" + Session["Email"] + "'";
                SqlCommand getFname = new SqlCommand(getFnameCmd, conn);
                SqlDataReader reader = getFname.ExecuteReader();
                if (reader.Read())
                {
                    Label_UserName.Text = reader.GetValue(0).ToString();
                }
                else
                {
                    Response.Write("Error: Unable to get Fname");
                }

                conn.Close();
            }
        }

        protected void Button1_Click(Object sender, EventArgs e)
        {
            Session["result"] = Search_target.Text;
            Response.Redirect("Result.aspx");
        }
    }
}