using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                DisplayPersonalImg();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                Button_Delete.Visible = false;
                string checkUser = "SELECT Status FROM FriendRelationship WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
                SqlCommand cmdCheck = new SqlCommand(checkUser, conn);

                //Display friends personal info part
                DisplayInfo();

                //Display friends request part
                if (cmdCheck.ExecuteScalar() == null)
                {
                    Button_AddFriend.Visible = true;
                    Button_CancelAddFriend.Visible = false;
                    Button_ReAddFriend.Visible = false;
                    Button_Block.Visible = false;
                    Button_Unblock.Visible = false;
                    Button_Message.Visible = false;
                }
                else
                {
                    int status = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

                    if (status == 1)
                    {
                        Button_AddFriend.Visible = false;
                        Button_CancelAddFriend.Visible = false;
                        Button_ReAddFriend.Visible = false;
                        Button_Block.Visible = true;
                        Button_Unblock.Visible = false;
                        Button_Message.Visible = true;
                        Button_Delete.Visible = true;
                    }
                    else if (status == 0)
                    {
                        Button_AddFriend.Visible = false;
                        Button_CancelAddFriend.Visible = true;
                        Button_ReAddFriend.Visible = false;
                        Button_Block.Visible = false;
                        Button_Unblock.Visible = false;
                        Button_Message.Visible = false;
                    }
                    else if (status == 2)
                    {
                        Button_AddFriend.Visible = false;
                        Button_CancelAddFriend.Visible = false;
                        Button_ReAddFriend.Visible = true;
                        Button_Block.Visible = false;
                        Button_Unblock.Visible = false;
                        Button_Message.Visible = false;
                    }
                    else if (status == 3)
                    {
                        Button_AddFriend.Visible = false;
                        Button_CancelAddFriend.Visible = false;
                        Button_ReAddFriend.Visible = false;
                        Button_Block.Visible = false;
                        Button_Unblock.Visible = true;
                        Button_Message.Visible = false;
                    }

                    /* Left right menu Part*/
                    Left_ShowFriends();
                    Left_ShowRooms();
                    ShowDate();
                    Label_display.Text = Count() + " new notifications.";
                }
                conn.Close();
            }
        }

        protected void Button_Click_Request(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                string insertQuery = "insert into FriendRelationship (User1_Id, User2_Id, Status) values ('" + Session["UID"] + "','" + Session["FID"] + "', 0)";
                string insertQuery_2 = "insert into FriendRelationship (User1_Id, User2_Id, Status) values ('" + Session["FID"] + "','" + Session["UID"] + "', 0)";
                string insertLogQuery = "insert into EventLog values  ('" + Session["UID"] + "','" + Session["FID"] + "')";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                SqlCommand cmdInsert_2 = new SqlCommand(insertQuery_2, conn);
                SqlCommand cmdInsertLog = new SqlCommand(insertLogQuery, conn);

                cmdInsert.ExecuteNonQuery();
                cmdInsert_2.ExecuteNonQuery();
                cmdInsertLog.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Friends.aspx");

            Response.Write("Request send");  //???
        }

        protected void Button_Click_Cancel(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                string deleteQuery = "DELETE FROM FriendRelationship WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
                string deleteQuery_2 = "DELETE FROM FriendRelationship WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

                SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);
                SqlCommand cmdDelete_2 = new SqlCommand(deleteQuery_2, conn);

                cmdDelete.ExecuteNonQuery();
                cmdDelete_2.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Friends.aspx");

            Response.Write("Request has been canceled");
        }

        protected void Button_Click_Delete(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                string deleteQuery = "DELETE FROM FriendRelationship WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
                string deleteQuery_2 = "DELETE FROM FriendRelationship WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

                SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);
                SqlCommand cmdDelete_2 = new SqlCommand(deleteQuery_2, conn);

                cmdDelete.ExecuteNonQuery();
                cmdDelete_2.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Friends.aspx");

        }

        protected void Button_Click_Re_Add_Friend(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string updateQuery = "UPDATE FriendRelationship SET status = 0 WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
            string updateQuery_2 = "UPDATE FriendRelationship SET status = 0 WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

            string insertLogQuery = "insert into EventLog values  ('" + Session["UID"] + "','" + Session["FID"] + "')";

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
            SqlCommand cmdUpdate_2 = new SqlCommand(updateQuery_2, conn);
            SqlCommand cmdInsertLog = new SqlCommand(insertLogQuery, conn);


            cmdUpdate.ExecuteNonQuery();
            cmdUpdate_2.ExecuteNonQuery();
            cmdInsertLog.ExecuteNonQuery();


            conn.Close();

            Response.Redirect("Friends.aspx");

        }

        protected void Button_Click_Block(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string updateQuery = "UPDATE FriendRelationship SET status = 3 WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
            string updateQuery_2 = "UPDATE FriendRelationship SET status = 3 WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
            SqlCommand cmdUpdate_2 = new SqlCommand(updateQuery_2, conn);


            cmdUpdate.ExecuteNonQuery();
            cmdUpdate_2.ExecuteNonQuery();


            conn.Close();

            Response.Redirect("Friends.aspx");

        }

        protected void Button_Click_Unblock(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string updateQuery = "UPDATE FriendRelationship SET status = 1 WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
            string updateQuery_2 = "UPDATE FriendRelationship SET status = 1 WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
            SqlCommand cmdUpdate_2 = new SqlCommand(updateQuery_2, conn);


            cmdUpdate.ExecuteNonQuery();
            cmdUpdate_2.ExecuteNonQuery();


            conn.Close();

            Response.Redirect("Friends.aspx");

        }

        protected void Button_Click_Message(object sender, EventArgs e)
        {
            Response.Redirect("Chat.aspx");
        }

        public void DisplayPersonalImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = '" + Session["FID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
            conn.Close();
        }

        public void DisplayInfo()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string getInfoCmd = "select [Fname],[DOB],[Email],[Tel] from UserInfo where UID = '" + Session["FID"] + "'";
            SqlCommand getInfo = new SqlCommand(getInfoCmd, conn);
            SqlDataReader reader = getInfo.ExecuteReader();

            if (reader.Read())
            {
                Label_ShowName.Text = reader["Fname"].ToString();
                Label_ShowDOB.Text = reader["DOB"].ToString();
                Label_ShowEmail.Text = reader["Email"].ToString();
                Label_ShowPhone.Text = reader["Tel"].ToString();
            }
            else
            {
                Response.Write("Error: Unable to get User info");
            }
            conn.Close();
        }

        /* =======================================================Left right menu Part========================================================*/
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

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM EventLog WHERE FID = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int count  = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }


        private void ShowDate()
        {
            Date.Text = DateTime.Now.ToString("MMM dd yyyy");
            Weekday.Text = DateTime.Now.ToString("dddd");
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            Time.Text = DateTime.Now.ToString("HH:mm:ss");
        }

    }
}