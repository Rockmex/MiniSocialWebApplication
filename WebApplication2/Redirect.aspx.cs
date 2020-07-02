using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    if (Session["Case"] == null)
                    {
                        if (CountFriends() == 0)
                        {
                            GridView1.Visible = false;
                            Label_display.Text = "Sorry, You can't create a chat room without at least a friend can chat with";
                        }
                        else
                        {
                            Label_display.Text = "Please select the friend that you wish to add";
                            GridView1.Visible = true;
                            ShowFriends();
                        }
                    }
                    else
                    {
                        if (CountFriends() == 0)
                        {
                            GridView1.Visible = false;
                            Label_display.Text = "Sorry, You can't edit a chat room without at least a friend can chat with";
                        }
                        else
                        {
                            Label_display.Text = "Please select the friend that you wish to add";
                            Label_1.Visible = false;
                            rname.Visible = false;
                            GridView1.Visible = true;
                            ShowFriends2();
                        }
                    }
                }
            }
        }


        protected void Button_Click_CreatRoom(Object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            var Rid = Generate_Rid() + 1;

            conn.Open();
            /*      If isCreator is 0, it mean current user is submember. 1 refer current user is creator      */
            string AddRoom = "insert into ChatRoom (RoomId,RoomName,MemberId,IsCreator) values (@Rid,@Rname,'" + Session["UID"] + "',1)";
            SqlCommand cmdInsert = new SqlCommand(AddRoom, conn);
            cmdInsert.Parameters.AddWithValue("Rid", Rid);
            cmdInsert.Parameters.AddWithValue("Rname", rname.Text);

            cmdInsert.ExecuteNonQuery();

            conn.Close();

            foreach (GridViewRow gvrow in GridView1.Rows)
            {   
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var FID = gvrow.FindControl("Label1") as Label;

                    
                    conn.Open();
                    AddRoom = "insert into ChatRoom (RoomId,RoomName,MemberId,IsCreator) values (@Rid,@Rname,@Fid,0)";
                    SqlCommand cmdInsert_2 = new SqlCommand(AddRoom, conn);
                    cmdInsert_2.Parameters.AddWithValue("Rid", Rid);
                    cmdInsert_2.Parameters.AddWithValue("Rname", rname.Text);
                    cmdInsert_2.Parameters.AddWithValue("Fid", FID.Text);

                    cmdInsert_2.ExecuteNonQuery();

                    conn.Close();
                }
            }

            Response.Redirect("Personal.aspx");
        }

        protected void Button_Click_AddMember(Object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            var Rid = Generate_Rid() + 1;

            conn.Open();
            /*      If isCreator is 0, it mean current user is submember. 1 refer current user is creator      */
            string AddRoom = "insert into ChatRoom (RoomId,RoomName,MemberId,IsCreator) values (@Rid,@Rname,'" + Session["UID"] + "',1)";
            SqlCommand cmdInsert = new SqlCommand(AddRoom, conn);
            cmdInsert.Parameters.AddWithValue("Rid", Rid);
            cmdInsert.Parameters.AddWithValue("Rname", rname.Text);

            cmdInsert.ExecuteNonQuery();

            conn.Close();

            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var FID = gvrow.FindControl("Label1") as Label;


                    conn.Open();
                    AddRoom = "insert into ChatRoom (RoomId,RoomName,MemberId,IsCreator) values (@Rid,@Rname,@Fid,0)";
                    SqlCommand cmdInsert_2 = new SqlCommand(AddRoom, conn);
                    cmdInsert_2.Parameters.AddWithValue("Rid", Rid);
                    cmdInsert_2.Parameters.AddWithValue("Rname", rname.Text);
                    cmdInsert_2.Parameters.AddWithValue("Fid", FID.Text);

                    cmdInsert_2.ExecuteNonQuery();

                    conn.Close();
                }
            }

            Response.Redirect("Personal.aspx");
        }

        protected void Button_Click_ExAddFriend(Object sender, EventArgs e)
        {
            var Rid = Session["RoomId"];

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var FID = gvrow.FindControl("Label1") as Label;


                    conn.Open();
                    String AddRoom = "insert into ChatRoom (RoomId,RoomName,MemberId,IsCreator) values (@Rid,@Rname,@Fid,0)";
                    SqlCommand cmdInsert_2 = new SqlCommand(AddRoom, conn);
                    cmdInsert_2.Parameters.AddWithValue("Rid", Rid);
                    cmdInsert_2.Parameters.AddWithValue("Rname", rname.Text);
                    cmdInsert_2.Parameters.AddWithValue("Fid", FID.Text);

                    cmdInsert_2.ExecuteNonQuery();

                    conn.Close();
                }
            }

            Response.Redirect("Personal.aspx");
        }
        
        private int Generate_Rid()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT COUNT (DISTINCT RoomId) FROM ChatRoom";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }

        private void ShowFriends()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT UId, Fname, Lname FROM FriendRelationship INNER JOIN UserInfo ON FriendRelationship.User2_Id = UserInfo.UID WHERE FriendRelationship.User1_Id = '" + Session["UID"] + "' AND status = 1";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        private void ShowFriends2()
        {
            /*SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT UId, Fname, Lname FROM UserInfo INNER JOIN ChatRoom ON UserInfo.UID = ChatRoom.MemberId WHERE ChatRoom.RoomId = '" + Session["RoomId"] + "'";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(searchCmd, conn);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            GridView1.DataSource = dataTable;
            GridView1.DataBind();*/
        }

        private int CountFriends()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT count(*) FROM FriendRelationship WHERE User1_Id = '" + Session["UID"] + "' AND status = 1";
            SqlCommand cmdCheck = new SqlCommand(searchCmd, conn);
            return Convert.ToInt32(cmdCheck.ExecuteScalar().ToString());
        }
    }
}
