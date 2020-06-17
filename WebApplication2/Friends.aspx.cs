using System;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button444_Click(Object sender, EventArgs e)
        {
            //Response.Redirect("Edit.aspx");
            Response.Write("Success");
        }
    }
}