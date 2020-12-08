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
                        
                            ShowResult();
                            Left_ShowFriends();
                            Left_ShowRooms();
                            ShowDate();
                            Label_display.Text = Left_Count() + " new notifications.";
                     
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
            conn.Close();
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
            int count = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }

        private string GetFriendName()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkUser = "Select Fname from UserInfo where UID = '" + Session["FID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(checkUser, conn);
            string name = cmdCheck.ExecuteScalar().ToString();
            conn.Close();
            return name;
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            ShowResult();
        }

/* ===========================================================Left right menu Part=============================================================*/


        private void Left_ShowFriends()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT FriendRelationship.User2_Id, Fname, Lname, ImageID FROM FriendRelationship INNER JOIN UserInfo ON FriendRelationship.User2_Id = UserInfo.UID WHERE FriendRelationship.User1_Id = '" + Session["UID"] + "' AND status = 1";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView_Friends.DataSource = dataTable;
            GridView_Friends.DataBind();
            conn.Close();
        }

        private void Left_ShowRooms()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT IDwithChar, RoomName FROM ChatRoom WHERE MemberId = '" + Session["UID"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            Gridview_RoomList.DataSource = dataTable;
            Gridview_RoomList.DataBind();
            conn.Close();
        }

        private void ShowFriendsImg(object sender, ListViewItemEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            var Profile_Image = (Image)e.Item.FindControl("Profile_Image2");
            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
            conn.Close();
        }

        protected void Left_Button_Click_View(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                Session["FID"] = e.CommandArgument;
                string id = Session["FID"].ToString();
                if (id.Length <= 3)
                {
                    Response.Redirect("Chat.aspx");
                }
                else
                {
                    Session["RoomId"] = e.CommandArgument;
                    Session["RID"] = ShowRoomId(Session["RoomId"]);
                    Response.Redirect("ChatRoom.aspx");
                }

            }
        }

        private int ShowRoomId(object idwithchar)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT RoomId FROM ChatRoom WHERE IDwithChar = '" + idwithchar + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int id = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return id;
        }

        private void ShowDate()
        {
            Date.Text = DateTime.Now.ToString("MMM dd yyyy");
            Weekday.Text = DateTime.Now.ToString("dddd");
        }

        protected void Timer_Tick2(object sender, EventArgs e)
        {
            Time.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        private int Left_Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM EventLog WHERE FID = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int count = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }

    }
}