using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Chat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                if (Session["FID"] == null)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    if (Count() == 0)
                    {
                        GridView_Chat.Visible = false;
                        Label_display.Text = "This is your first time chatting. Please write something.";
                    }
                    else
                    {
                        ShowResult();
                    }
                }
            }
        }

        protected void Button_Click_Send(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string insertQuery = "insert into ChatLog (SenderId, Message, ReceiverId,Time) values ('" + Session["UID"] + "', @Msg,'" + Session["FID"] + "', getdate())";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                cmdInsert.Parameters.AddWithValue("@Msg", MessageBox.Text);

                cmdInsert.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Chat.aspx");
        }

        protected void Button_Click_Delete(object sender, CommandEventArgs e)
        {
            Session["MID"] = e.CommandArgument;

            if (e.CommandArgument != null)
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();

                    string deleteQuery = "DELETE FROM ChatLog WHERE MessageId = '" + Session["MID"] + "'";

                    SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);

                    cmdDelete.ExecuteNonQuery();

                    conn.Close();
                }

                Response.Redirect("Chat.aspx");
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        /*
         *  ShowResult() takes data from database, bind to the gridview and display them. 
         */
        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT MessageId, SenderId, Message, Time FROM ChatLog WHERE SenderId = '" + Session["UID"] + "' AND ReceiverId = '" + Session["FID"] + "' OR SenderId = '" + Session["FID"] + "' AND ReceiverId = '" + Session["UID"] + "' ORDER BY TIME ASC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView_Chat.DataSource = dataTable;
            GridView_Chat.DataBind();
        }

        /*
         * Count() counts if there is any message between users
         */
        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM ChatLog WHERE SenderId = '" + Session["UID"] + "' AND ReceiverId = '" + Session["FID"] + "' OR SenderId = '" + Session["FID"] + "' AND ReceiverId = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

        }
    }
}