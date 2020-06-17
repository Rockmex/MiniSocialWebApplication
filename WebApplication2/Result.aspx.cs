using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication2
{
    public partial class WebForm13 : System.Web.UI.Page
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
                    if (Count() == 0)
                    {
                        GridView1.Visible = false;
                        Label_display.Text = "No such result.";
                    }
                    else
                    {
                        ShowResult();
                        Label_display.Text = "We Found " + Count() + " results.";
                    }
                }
            }
        }

        protected void Button1_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                Session["FID"] = e.CommandArgument;
                Response.Redirect("Friends.aspx");
            }
        }

        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string searchCmd = "SELECT UID, Fname, Lname FROM UserInfo WHERE Fname LIKE'" + Session["Result"] + "%' OR Lname LIKE'" + Session["Result"] + "%'";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                //Session["CurrentTable"] = dataTable;
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
        }

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM UserInfo WHERE Fname LIKE'" + Session["Result"] + "%' OR Lname LIKE'" + Session["Result"] + "%'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

        }
    }
}