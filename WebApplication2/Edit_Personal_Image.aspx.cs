using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Edit_Personal_Image : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayPersonalImg();
        }

        protected void Button_Click_Update(Object sender, EventArgs e)
        {
            Imgupload();
            Response.Redirect("Personal.aspx");
        }

        protected void Button_Click_Back(Object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
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
                String update = "UPDATE UserInfo SET ImageID = '" + Imgid + "' WHERE UID = '" + Session["UID"] + "'";
                SqlCommand updateCMD = new SqlCommand(update, conn);
                updateCMD.ExecuteNonQuery();
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

            if (found == 0)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(GenerateCheck.ExecuteScalar());
            }

        }

        public void DisplayPersonalImg()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string searchCmd = "SELECT imageID FROM UserInfo WHERE UID = '" + Session["UID"] + "'";
            SqlCommand com = new SqlCommand(searchCmd, conn);
            com.ExecuteScalar();
            int imgID = Convert.ToInt32(com.ExecuteScalar().ToString());
            Profile_Image.ImageUrl = "Handler1.ashx?id_Image=" + imgID;
        }
    }
}