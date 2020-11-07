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
                    if (Count() == 0)
                    {
                        GridView_ChatBox.Visible = false;
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
            string searchCmd = "SELECT SenderId, MessageId, Fname, Message, Time FROM ChatLog INNER JOIN UserInfo ON SenderId = UID WHERE ReceiverId = '" + Session["RoomId"] + "' ORDER BY TIME ASC";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView_ChatBox.DataSource = dataTable;
            GridView_ChatBox.DataBind();
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
        }

        private int Count()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT Count(*) FROM ChatLog WHERE ReceiverId = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

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
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());

        }

        private string getRoomName()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT RoomName FROM ChatRoom WHERE IDwithChar = '" + Session["RoomId"] + "'";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return cmdCheck.ExecuteScalar().ToString();
        }

        private bool isCreator()
        {
            bool isCreator = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            //Missing RID. FIX IT!!!!
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
            return isSender;
        }
    }
}