using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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

        protected void Button_Click_Search(Object sender, EventArgs e)
        {
            Session["result"] = Search_target.Text;
            Response.Redirect("Result.aspx");
        }

        protected void Button_Click_Post(Object sender, EventArgs e)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                
                string insertQuery = "insert into Post (SenderId, Content, LikeCounts,CommentCounts) values ('" + Session["UID"] + "', @Msg,0,0)";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                cmdInsert.Parameters.AddWithValue("@Msg", Post_Textbox.Text);

                cmdInsert.ExecuteNonQuery();

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
            Response.Redirect("Home.aspx");
        }

        protected void Button_Click_Comment(Object sender, CommandEventArgs e)
        {
            Session["PostId"] = e.CommandArgument;

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();

                string insertQuery = "insert into Comment (PostId, Content, SenderId) values ('" + Session["PostId"] + "', @Msg,'" + Session["UID"] + "')";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);

                cmdInsert.Parameters.AddWithValue("@Msg", Post_Textbox.Text);

                cmdInsert.ExecuteNonQuery();

                conn.Close();
            }

            Response.Redirect("Home.aspx");
        }

        
        protected void Button_Click_Share(Object sender, EventArgs e)
        {

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
            //string getPostCmd = "select senderId,content LikeCounts, Commentcounts FROM Post ";
            string getPostCmd = "select PostId,Fname, Lname, senderId,content FROM Post INNER JOIN UserInfo ON senderId = UID"; 
            SqlCommand getPost = new SqlCommand(getPostCmd, conn);
            Datalist_Post.DataSource = getPost.ExecuteReader();
            Datalist_Post.DataBind();

            conn.Close();
        }
    }
}