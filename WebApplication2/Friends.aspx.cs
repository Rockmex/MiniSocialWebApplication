using System;
using System.Configuration;
using System.Data.SqlClient;

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
                }
                conn.Close();
            }
        }

        protected void Button_Click_Request(Object sender, EventArgs e)
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

            Response.Write("Request send");
        }

        protected void Button_Click_Cancel(Object sender, EventArgs e)
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

        protected void Button_Click_Delete(Object sender, EventArgs e)
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

        protected void Button_Click_Re_Add_Friend(Object sender, EventArgs e)
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

        protected void Button_Click_Block(Object sender, EventArgs e)
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

        protected void Button_Click_Unblock(Object sender, EventArgs e)
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

        protected void Button_Click_Message(Object sender, EventArgs e)
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
        }
    }
}