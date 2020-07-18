using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm4 : System.Web.UI.Page
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

                    /* Notification Part*/
                    if (Count() == 0)
                    {
                        GridView_FriendNotification.Visible = false;
                        Label_display.Text = "No New Notifications";
                    }
                    else
                    {
                        ShowResult();
                        Label_display.Text = "There are" + Count() + " new notifications.";
                    }

                    /* Friend List Part*/
                    if (CountFriends() == 0)
                    {
                        Gridview_FriendList.Visible = false;
                        Label_NoFriend.Visible = true;
                    }
                    else
                    {
                        ShowFriends();
                        Label_NoFriend.Visible = false;
                    }

                    /* Chat Room List Part*/
                    if (CountRooms() == 0)
                    {
                        Gridview_FriendList.Visible = false;
                        Label_NoRoomList.Visible = true;
                    }
                    else
                    {
                        ShowRooms();
                        Label_NoRoomList.Visible = false;
                    }
                }
            }
        }

        protected void Button_Click_Accept(Object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string updateQuery = "UPDATE FriendRelationship SET status = 1 WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
            string updateQuery_2 = "UPDATE FriendRelationship SET status = 1 WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
            SqlCommand cmdUpdate_2 = new SqlCommand(updateQuery_2, conn);

            cmdUpdate_2.ExecuteNonQuery();
            cmdUpdate.ExecuteNonQuery();
            DeleteLog();

            conn.Close();

            Response.Redirect("Personal.aspx");
        }

        protected void Button_Click_Decline(Object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string updateQuery = "UPDATE FriendRelationship SET status = 2 WHERE User1_Id = '" + Session["UID"] + "' AND User2_Id = '" + Session["FID"] + "'";
            string updateQuery_2 = "UPDATE FriendRelationship SET status = 2 WHERE User1_Id = '" + Session["FID"] + "' AND User2_Id = '" + Session["UID"] + "'";

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
            SqlCommand cmdUpdate_2 = new SqlCommand(updateQuery_2, conn);


            cmdUpdate.ExecuteNonQuery();
            cmdUpdate_2.ExecuteNonQuery();

            DeleteLog();

            conn.Close();

            Response.Redirect("Personal.aspx");
        }
        protected void Button_Click_Edit(Object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }

        protected void Button_Click_Redirect(Object sender, CommandEventArgs e)
        {
            Session["FID"] = e.CommandArgument;
            Response.Redirect("Friends.aspx");
        }

        protected void Button_Click_RedirectRoom(Object sender, EventArgs e)
        {
            Response.Redirect("Redirect.aspx");
        }

        protected void Button_Click_UploadPicture(Object sender, EventArgs e)
        {
            Imgupload();
        }

        /*
         * RoomId refers to IDwithChar (varchar)
         * RID refers to RoomId (int)
        */
        protected void Button_Click_RedirectChatRoom(Object sender, CommandEventArgs e)
        {
            Session["RoomId"] = e.CommandArgument;
            Session["RID"] = ShowRoomId(Session["RoomId"]);
            Response.Redirect("ChatRoom.aspx");
        }
        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT EventLog.UID, Fname, Lname FROM EventLog INNER JOIN UserInfo ON EventLog.UID = UserInfo.UID WHERE EventLog.FID = '" + Session["UID"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView_FriendNotification.DataSource = dataTable;
            GridView_FriendNotification.DataBind();
        }

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM EventLog WHERE FID = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }

        private void DeleteLog()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string deleteQuery = "DELETE FROM EventLog WHERE FID = '" + Session["UID"] + "' AND UID = '" + Session["FID"] + "'";

            SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);

            cmdDelete.ExecuteNonQuery();

            conn.Close();
        }

        private void ShowFriends()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT FriendRelationship.User2_Id, Fname, Lname FROM FriendRelationship INNER JOIN UserInfo ON FriendRelationship.User2_Id = UserInfo.UID WHERE FriendRelationship.User1_Id = '" + Session["UID"] + "' AND status = 1";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            Gridview_FriendList.DataSource = dataTable;
            Gridview_FriendList.DataBind();
        }

        private void ShowRooms()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT IDwithChar, RoomName FROM ChatRoom WHERE MemberId = '" + Session["UID"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            Gridview_RoomList.DataSource = dataTable;
            Gridview_RoomList.DataBind();
        }

        private int CountRooms()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM ChatRoom WHERE MemberId = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }

        private int CountFriends()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM FriendRelationship WHERE User1_Id = '" + Session["UID"] + "' AND status = 1";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }

        private int ShowRoomId(object idwithchar)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT RoomId FROM ChatRoom WHERE IDwithChar = '" + idwithchar + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }

        private void Imgupload()
        {
            if (ImgUpload.HasFile)
            {
                var Imgid = CountImg() + 1;

                int imgSize = ImgUpload.PostedFile.ContentLength;
                byte[] imgarray = new byte[imgSize];
                HttpPostedFile image = ImgUpload.PostedFile;
                image.InputStream.Read(imgarray, 0, imgSize);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                String query = "Insert into ImageDB (ImageID,UID,ImageName,Image) values (@IID,'" + Session["UID"] + "',@Name, @Image)";
                SqlCommand cmdImg = new SqlCommand(query, conn);
                cmdImg.Parameters.AddWithValue("@IID", Imgid);
                cmdImg.Parameters.AddWithValue("@Name", SqlDbType.VarChar).Value = "img1";
                cmdImg.Parameters.AddWithValue("@Image", SqlDbType.Image).Value = imgarray;
                cmdImg.ExecuteNonQuery();
                /*imagebindGrid();*/
                conn.Close();
            }
        }

        private int CountImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string searchCmd = "SELECT COUNT(*) FROM ImageDB WHERE UId = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            cmdCheck.ExecuteScalar();
            int found = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();

            
            conn.Open();
            string GenerateCmd = "SELECT MAX(ImageID) FROM ImageDB WHERE UId = '" + Session["UID"] + "'";
            SqlCommand GenerateCheck = new SqlCommand(GenerateCmd, conn);
            
            if(found == 0)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(GenerateCheck.ExecuteScalar());
            }
            
        }
        public void DisplayImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT image FROM ImageDB WHERE UId = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            SqlDataReader dr = com.ExecuteReader();
            Datalist_Images.DataSource = dr;
            Datalist_Images.DataBind();
        }
    }
}
