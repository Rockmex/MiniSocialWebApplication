using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public partial class ChatTest : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    if (Session["FID"] == null)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        label_name.Text = GetFriendName();
                        if (Count() == 0)
                        {
                            /*GridView_Chat.Visible = false;
                            Label_display.Text = "This is your first time chatting. Please write something.";
                            */
                            Response.Write("Zero");
                        }
                        else
                        {
                            ShowResult();
                        }
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

            Response.Redirect("ChatTest.aspx");
        }

        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Fname, SenderId, Message, Time, ImageID FROM (ChatLog INNER JOIN UserInfo ON SenderId = UID) WHERE SenderId = '" + Session["UID"] + "' AND ReceiverId = '" + Session["FID"] + "' OR SenderId = '" + Session["FID"] + "' AND ReceiverId = '" + Session["UID"] + "' ORDER BY TIME ASC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            datalist1.DataSource = dataTable;
            datalist1.DataBind();
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

        private string GetFriendName()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkUser = "Select Fname from UserInfo where UID = '" + Session["FID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(checkUser, conn);
            string name = cmdCheck.ExecuteScalar().ToString();
            return name;
        }

        /*protected void datalist1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            // Profile_image relocate
            var Profile_Image = (Image)e.Item.FindControl("Profile_Image");

            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
            conn.Close();
        }*/
    }
}