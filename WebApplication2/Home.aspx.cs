using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
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
                    ShowUser();
                    ShowPost();
                    Left_ShowFriends();
                    Left_ShowRooms();
                    ShowDate();
                    Label_display.Text = Count() + " new notifications.";

                }
            }
        }

        protected void Button_Click_Post(object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                if (ImgUpload.HasFile)
                {
                    string imgID = Imgupload();
                    string insertQuery = "insert into Post (SenderId, Content, LikeCounts,CommentCounts, ImageId) values ('" + Session["UID"] + "', @Msg,0,0, @IID)";

                    SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                    cmdInsert.Parameters.AddWithValue("@Msg", Post_Textbox.Text);
                    cmdInsert.Parameters.AddWithValue("@IID", imgID);


                    cmdInsert.ExecuteNonQuery();
                }
                else
                {
                    string insertQuery = "insert into Post (SenderId, Content, LikeCounts,CommentCounts) values ('" + Session["UID"] + "', @Msg,0,0)";

                    SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                    cmdInsert.Parameters.AddWithValue("@Msg", Post_Textbox.Text);

                    cmdInsert.ExecuteNonQuery();
                }
                conn.Close();
            }

            Response.Redirect("Home.aspx");
        }

        protected void Button_Click_Like(object sender, CommandEventArgs e)
        {
            Session["PostId"] = e.CommandArgument;
            if (IsLike() == 0)
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();

                    string updateInfocmd = "UPDATE Post SET LikeCounts = LikeCounts + 1 Where PostId = '" + Session["PostId"] + "'";

                    SqlCommand cmdUpdate = new SqlCommand(updateInfocmd, conn);

                    cmdUpdate.ExecuteNonQuery();

                    string insertInfocmd = "insert into CheckLike(PostId,UID) values ('" + Session["PostId"] + "','" + Session["UID"] + "')";

                    SqlCommand cmdInsert = new SqlCommand(insertInfocmd, conn);

                    cmdInsert.ExecuteNonQuery();

                    conn.Close();
                }
            }

            Response.Redirect("Home.aspx");
        }

        protected void Button_Click_Comment_Display(object sender, EventArgs e)
        {
            if (Session["SelectPostId"] == null)
            {
                ImageButton button = (ImageButton)sender;
                var item = (ListViewItem)button.NamingContainer;
                var label = (Label)item.FindControl("PostId");
                var postId = label.Text;

                Session["SelectPostId"] = postId;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Session["SelectPostId"] = null;
                Response.Redirect("Home.aspx");
            }

        }

        protected void Button_Click_Post_Delete(object sender, CommandEventArgs e)
        {
            string postId = e.CommandArgument.ToString();
            if (isPoster(postId))
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string deleteQuery = "DELETE FROM Post WHERE PostId = '" + postId + "'"; // AND PostId = '" + Session["SelectPostId"] +"'";
                SqlCommand delete = new SqlCommand(deleteQuery, conn);
                delete.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button_Click_Comment(object sender, CommandEventArgs e)
        {
            Button button = (Button)sender;
            var item = (ListViewItem)button.NamingContainer;
            var label = (Label)item.FindControl("PostId");
            var postId = label.Text;
            Session["PostId"] = postId;

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();


                var textBox = (TextBox)item.FindControl("Comment_Textbox");

                string insertQuery = "insert into Comment (PostId, Content, SenderId) values ('" + Session["PostId"] + "', @Msg,'" + Session["UID"] + "')";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                cmdInsert.Parameters.AddWithValue("@Msg", textBox.Text);

                cmdInsert.ExecuteNonQuery();

                string updateInfocmd = "UPDATE Post SET CommentCounts = CommentCounts + 1 Where PostId = '" + Session["PostId"] + "'";

                SqlCommand cmdUpdate = new SqlCommand(updateInfocmd, conn);

                cmdUpdate.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Home.aspx");
        }

        protected void Button_Click_Comment_Delete(object sender, CommandEventArgs e)
        {
            string commentID = e.CommandArgument.ToString();
            if (isCommentor(commentID))
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string deleteQuery = "DELETE FROM Comment WHERE commentID = '" + commentID + "'"; // AND PostId = '" + Session["SelectPostId"] +"'";
                SqlCommand delete = new SqlCommand(deleteQuery, conn);
                delete.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("Home.aspx");
            }
        }


        protected void Button_Click_Share(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            var item = (ListViewItem)button.NamingContainer;
            var label = (Label)item.FindControl("PostId");

            Response.Write(label.Text);     //??
        }

        private void ShowUser()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string getFnameCmd = "select Fname from UserInfo where Email = '" + Session["Email"] + "'";
            SqlCommand getFname = new SqlCommand(getFnameCmd, conn);
            SqlDataReader reader = getFname.ExecuteReader();
            if (reader.Read())
            {
                Label_UserName.Text = reader.GetValue(0).ToString();
            }
            else
            {
                Response.Write("Error: Unable to get Fname");
            }

            conn.Close();
        }

        private void ShowPost()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string getPostCmd = "select TOP 50 PostId,Fname, Lname, senderId,content,LikeCounts,CommentCounts, Post.imageID FROM ((Post INNER JOIN UserInfo ON senderId = UID) LEFT JOIN ImageDB ON Post.ImageId = ImageDB.ImageID) WHERE senderId = '" + Session["UID"] + "' OR senderId IN" +
                "(SELECT User2_id FROM FriendRelationship WHERE User1_id = '" + Session["UID"] + "' AND Status = 1) ORDER BY PostId DESC";
            SqlCommand getPost = new SqlCommand(getPostCmd, conn);
            Post_ListView.DataSource = getPost.ExecuteReader();
            Post_ListView.DataBind();
            conn.Close();
        }

        protected void Post_DataBound(object sender, ListViewItemEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            var table = (Panel)e.Item.FindControl("CommentArea");
            table.Visible = false;
            string postId = ((Label)e.Item.FindControl("PostId")).Text;
            
            if (e.Item.ItemType == ListViewItemType.DataItem || e.Item.ItemType == ListViewItemType.InsertItem || e.Item.ItemType == ListViewItemType.EmptyItem)
            {
                string temp = "";

                if (Session["SelectPostId"] != null)
                {
                    temp = Session["SelectPostId"].ToString();

                }


                GridView gridView = e.Item.FindControl("Comment_GridView") as GridView;


                conn.Open();
                string getPostCmd = "select Fname, Content, CommentId FROM Comment INNER JOIN UserInfo ON senderId = UID where PostId = " + postId;
                SqlCommand getComment = new SqlCommand(getPostCmd, conn);


                if (postId == temp)
                {

                    gridView.DataSource = getComment.ExecuteReader();
                    gridView.DataBind();

                    table.Visible = true;
                }

                conn.Close();

            }

            // Profile_image relocate
            var Profile_Image = (Image)e.Item.FindControl("Profile_Image");

            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = (SELECT SenderId FROM Post WHERE postId = '" + postId + "')";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
            conn.Close();
        }
        private string Imgupload()
        {
            string Imgid = null;
            if (ImgUpload.HasFile)
            {
                Imgid = (CountImg() + 1).ToString();

                int imgSize = ImgUpload.PostedFile.ContentLength;
                byte[] imgarray = new byte[imgSize];
                HttpPostedFile image = ImgUpload.PostedFile;
                image.InputStream.Read(imgarray, 0, imgSize);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string query = "Insert into ImageDB (ImageID,UID,ImageName,Image) values (@IID,'" + Session["UID"] + "',@Name, @Image)";
                SqlCommand cmdImg = new SqlCommand(query, conn);
                cmdImg.Parameters.AddWithValue("@IID", Imgid);
                cmdImg.Parameters.AddWithValue("@Name", SqlDbType.VarChar).Value = "img1";
                cmdImg.Parameters.AddWithValue("@Image", SqlDbType.Image).Value = imgarray;
                cmdImg.ExecuteNonQuery();
                conn.Close();
            }
            return Imgid;
        }

        private int CountImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();
            string searchCmd = "SELECT COUNT(*) FROM ImageDB";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            cmdCheck.ExecuteScalar();
            int found = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();


            conn.Open();
            string GenerateCmd = "SELECT MAX(ImageID) FROM ImageDB";
            SqlCommand GenerateCheck = new SqlCommand(GenerateCmd, conn);

            if (found == 0)
            {
                conn.Close();
                return 0;
            }
            else
            {
                int max = Convert.ToInt32(GenerateCheck.ExecuteScalar());
                conn.Close();
                return max;
            }

        }

        private bool isCommentor(string CommentId)
        {
            bool isCommentor = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT SenderId FROM Comment WHERE CommentId = '" + CommentId + "'";
            SqlCommand queryCommand = new SqlCommand(query, conn);
            var senderID = queryCommand.ExecuteScalar().ToString();
            if (senderID != Session["UID"].ToString())
            {
                Response.Write("<script>alert('You can only delete your own Comments')</script>");
            }
            else
            {
                isCommentor = true;
            }
            conn.Close();
            return isCommentor;
        }

        private bool isPoster(string PostId)
        {
            bool isPoster = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT SenderId FROM Post WHERE PostId = '" + PostId + "'";
            SqlCommand queryCommand = new SqlCommand(query, conn);
            var senderID = queryCommand.ExecuteScalar().ToString();
            if (senderID != Session["UID"].ToString())
            {
                Response.Write("<script>alert('You can only delete your own Posts')</script>");
            }
            else
            {
                isPoster = true;
            }
            conn.Close();
            return isPoster;
        }

        private int IsLike()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT COUNT(*) FROM CheckLike WHERE PostId = '" + Session["PostId"] + "' AND UID = '" + Session["UID"] + "' ";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            int count = Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
            conn.Close();
            return count;
        }

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
        protected void Timer_Tick(object sender, EventArgs e)
        {
            Time.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        private int Count()
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