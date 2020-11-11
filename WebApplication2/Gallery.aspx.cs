using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    /* Dispaly Images Part*/
                    DisplayImg();
                }
            }
        }

        public void DisplayImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT imageID FROM ImageDB WHERE UId = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            SqlDataReader dr = com.ExecuteReader();
            Datalist_Images.DataSource = dr;
            Datalist_Images.DataBind();
        }


        protected void Button_Click_Back(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }

    }
}