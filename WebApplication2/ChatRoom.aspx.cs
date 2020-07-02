using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ChatRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (CheckRoom() == 0)
                {
                    Response.Write("You are not in this Chat Room");
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    if (Count() == 0)
                    {
                        GridViewChatBox.Visible = false;
                        Label_display.Text = "This is your first time chatting. Please write something.";
                    }
                    else
                    {
                        ShowResult();
                        ShowMember();
                        Label_display.Text = getRoomName();
                    }
                }
            }
        }
        protected void Button_Click_Send(object sender, EventArgs e)
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

                Response.Redirect("ChatRoom.aspx");
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button_Click_RemoveMember(object sender, CommandEventArgs e)
        {
            Session["MemberId"] = e.CommandArgument;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string deleteQuery = "DELETE FROM ChatRoom WHERE MemberId = '" + Session["MemberId"] + "'";

            SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);


            cmdDelete.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("ChatRoom.aspx");
        }

        protected void Button_Click_AddNewMember(object sender, EventArgs e)
        {
            Session["Case"] = 1;
            Response.Redirect("Redirect.aspx");
        }
        private void ShowResult()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT MessageId, SenderId, Message, Time FROM ChatLog WHERE ReceiverId = '" + Session["RoomId"] + "' ORDER BY TIME ASC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridViewChatBox.DataSource = dataTable;
            GridViewChatBox.DataBind();
        }

        private void ShowMember()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT MemberId FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridviewMemberList.DataSource = dataTable;
            GridviewMemberList.DataBind();
        }

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Count(*) FROM ChatLog WHERE ReceiverId = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

        }

        private int CheckRoom()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Count(*) FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "' AND MemberId = '" + Session["UID"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

        }

        private String getRoomName()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT RoomName FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return cmdCheck.ExecuteScalar().ToString();
        }
    }
}