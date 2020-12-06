using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ChatRoom1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                if (CheckRoom() == 0)
                {
                    Response.Write("You are not in this Chat Room");
                    Response.Redirect("Home.aspx");
                }
                else
                {
                 /*   if (Count() == 0)
                    {
                        GridView_ChatBox.Visible = false;
                        Label_display.Text = "This is your first time chatting. Please write something.";
                    }
                    else
                 */   {
                        ShowResult();
                        ShowMember();
                        label_name.Text = getRoomName();

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
            if (string.IsNullOrEmpty(MessageBox.Text))
            {
                Response.Redirect("ChatRoom.aspx");
            }
            else
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string insertQuery = "insert into ChatLog (SenderId, Message, ReceiverId,Time) values ('" + Session["UID"] + "', @Msg,'" + Session["RoomId"] + "', getdate())";
                    SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                    cmdInsert.Parameters.AddWithValue("@Msg", MessageBox.Text);
                    cmdInsert.ExecuteNonQuery();
                    conn.Close();
                }

                Response.Redirect("ChatRoom.aspx");
            }
        }

        protected void Button_Click_Delete(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                Session["MID"] = e.CommandArgument;
                if (isSender())
                {
                    using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        string deleteQuery = "DELETE FROM ChatLog WHERE MessageId = '" + Session["MID"] + "' AND SenderId = '" + Session["UID"] + "'";

                        SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);

                        cmdDelete.ExecuteNonQuery();

                        conn.Close();
                    }
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button_Click_RemoveMember(object sender, CommandEventArgs e)
        {
            Session["MemberId"] = e.CommandArgument;
            if (isCreator())
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string deleteQuery = "DELETE FROM ChatRoom WHERE MemberId = '" + Session["MemberId"] + "'";
                SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);
                cmdDelete.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                Response.Redirect("ChatRoom.aspx");
            }
            Response.Redirect("ChatRoom.aspx");
        }

        protected void Button_Click_AddNewMember(object sender, EventArgs e)
        {
            Session["Case"] = 1;
            Response.Redirect("Redirect.aspx");
        }

        protected void Button_Click_LeaveChat(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string deleteQuery = "DELETE FROM ChatRoom WHERE MemberId = '" + Session["UID"] + "' AND RoomId = '" + Session["RID"] + "'";
            SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);
            cmdDelete.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Personal.aspx");
        }

        protected void Button_Click_RemoveRoom(object sender, EventArgs e)
        {
            if (isCreator())
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string deleteQuery_1 = "DELETE FROM ChatLog WHERE ReceiverId = '" + Session["RoomId"] + "'";
                string deleteQuery_2 = "DELETE FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
                SqlCommand cmdDelete_1 = new SqlCommand(deleteQuery_1, conn);
                SqlCommand cmdDelete_2 = new SqlCommand(deleteQuery_2, conn);
                cmdDelete_1.ExecuteNonQuery();
                cmdDelete_2.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Personal.aspx");
            }
        }

        protected void Button_Click_Back(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }

        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT SenderId, MessageId, ImageId, Fname, Message, Time FROM (ChatLog INNER JOIN UserInfo ON SenderId = UID) WHERE ReceiverId = '" + Session["RoomId"] + "' ORDER BY TIME ASC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            datalist1.DataSource = dataTable;
            datalist1.DataBind();
            conn.Close();
        }

        private void ShowMember()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT MemberId FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            Gridview_MemberList.DataSource = dataTable;
            Gridview_MemberList.DataBind();
            conn.Close();
        }

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Count(*) FROM ChatLog WHERE ReceiverId = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int count = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }


        /*
         *  CheckRoom() : checks if user(UID) is in the chatroom(RoomId with char) 
         */
        private int CheckRoom()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Count(*) FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "' AND MemberId = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int count  =Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }

        private string getRoomName()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT RoomName FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            string name = cmdCheck.ExecuteScalar().ToString();
            conn.Close();
            return name;
        }

        private bool isCreator()
        {
            bool isCreator = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT isCreator FROM ChatRoom WHERE MemberId = '" + Session["UID"] + "' AND IDwithChar = '" + Session["RoomId"] + "'";
            SqlCommand queryCommand = new SqlCommand(query, conn);
            var senderID = Convert.ToInt32(queryCommand.ExecuteScalar().ToString());
            if (senderID != 1)
            {
                Response.Write("<script>alert('You are not the creator')</script>");
            }
            else
            {
                isCreator = true;
            }
            conn.Close();
            return isCreator;
        }

        private bool isSender()
        {
            bool isSender = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT SenderId FROM ChatLog WHERE MessageId = '" + Session["MID"] + "'";
            SqlCommand queryCommand = new SqlCommand(query, conn);
            var senderID = queryCommand.ExecuteScalar().ToString();
            if (senderID != Session["UID"].ToString())
            {
                Response.Write("<script>alert('You can only delete your own messages')</script>");
            }
            else
            {
                isSender = true;
            }
            conn.Close();
            return isSender;
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
            int count =  Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }


    }
}