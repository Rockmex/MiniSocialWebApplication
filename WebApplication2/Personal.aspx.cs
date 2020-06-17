using System;

namespace WebApplication2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(Object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }


    }
}