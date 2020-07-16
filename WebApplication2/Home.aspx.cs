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
                }
            }
        }

        protected void Button_Click_Post(Object sender, EventArgs e)
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

        protected void Button_Click_Like(Object sender, CommandEventArgs e)
        {
            Session["PostId"] = e.CommandArgument;

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                string updateInfocmd = "UPDATE Post SET LikeCounts = LikeCounts + 1 Where PostId = '" + Session["PostId"] + "'";

                SqlCommand cmdInsert = new SqlCommand(updateInfocmd, conn);

                cmdInsert.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Home.aspx");
        }

        protected void Button_Click_Comment_Display(Object sender, EventArgs e)
        {
            if (Session["SelectPostId"] == null)
            {
                LinkButton button = (LinkButton)sender;
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

        protected void Button_Click_Comment(Object sender, CommandEventArgs e)
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

                conn.Close();
            }

            Response.Redirect("Home.aspx");
        }


        protected void Button_Click_Share(Object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            var item = (ListViewItem)button.NamingContainer;
            var label = (Label)item.FindControl("PostId");

            Response.Write(label.Text);
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
            string getPostCmd = "select PostId,Fname, Lname, senderId,content, image FROM ((Post INNER JOIN UserInfo ON senderId = UID) LEFT JOIN ImageDB ON Post.ImageId = ImageDB.ImageID)";
            SqlCommand getPost = new SqlCommand(getPostCmd, conn);
            Post_ListView.DataSource = getPost.ExecuteReader();
            Post_ListView.DataBind();
            conn.Close();
        }

        protected void Post_DataBound(object sender, ListViewItemEventArgs e)
        {
            var table = (Panel)e.Item.FindControl("CommentArea");
            table.Visible = false;

            if (e.Item.ItemType == ListViewItemType.DataItem || e.Item.ItemType == ListViewItemType.InsertItem || e.Item.ItemType == ListViewItemType.EmptyItem)
            {
                    string postId = ((Label)e.Item.FindControl("PostId")).Text;
                    
                    string temp = "";

                if (Session["SelectPostId"] != null)
                {
                   temp = Session["SelectPostId"].ToString();
                    
                }
                    

                    GridView gridView = e.Item.FindControl("Comment_GridView") as GridView;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string getPostCmd = "select Fname, Content FROM Comment INNER JOIN UserInfo ON senderId = UID where PostId = " + postId;
                    SqlCommand getComment = new SqlCommand(getPostCmd, conn);

                   
                   if (postId == temp)
                   {

                    gridView.DataSource = getComment.ExecuteReader();
                    gridView.DataBind();

                    table.Visible = true;
                    }

                    conn.Close();
                    
            }
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
                String query = "Insert into ImageDB (ImageID,UID,ImageName,Image) values (@IID,'" + Session["UID"] + "',@Name, @Image)";
                SqlCommand cmdImg = new SqlCommand(query, conn);
                cmdImg.Parameters.AddWithValue("@IID", Imgid);
                cmdImg.Parameters.AddWithValue("@Name", SqlDbType.VarChar).Value = "img1";
                cmdImg.Parameters.AddWithValue("@Image", SqlDbType.Image).Value = imgarray;
                cmdImg.ExecuteNonQuery();
                /*Label1.Visible = true;
                Label1.Text = "Image Is Uploaded successfully";
                imagebindGrid();*/
                conn.Close();
            }
            return Imgid;
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

            if (found == 0)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(GenerateCheck.ExecuteScalar());
            }

        }
    }

}