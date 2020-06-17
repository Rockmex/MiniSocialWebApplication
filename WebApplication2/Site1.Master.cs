using System;

namespace WebApplication2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(Object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}