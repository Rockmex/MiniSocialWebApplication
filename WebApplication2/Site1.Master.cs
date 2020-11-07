using System;
using System.Configuration;
using System.Data.SqlClient;


namespace WebApplication2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                LogOut_Button.Visible = false;
            }
            ShowUser();
            DisplayPersonalImg();
        }

        protected void Button_Click_LogOut(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Button_Click_Search(object sender, EventArgs e)
        {
            Session["result"] = Search_target.Text;
            Response.Redirect("Result.aspx");
        }

        private void ShowUser()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string getFnameCmd = "select Fname, Lname from UserInfo where Email = '" + Session["Email"] + "'";
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

        public void DisplayPersonalImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
        }
    }
}