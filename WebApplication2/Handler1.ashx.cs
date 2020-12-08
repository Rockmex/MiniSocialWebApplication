using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace WebApplication2
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string displayimgid = context.Request.QueryString["id_Image"].ToString();

            if (displayimgid == "")
            {
                context.Response.Close();
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string convertCmd = " SELECT image FROM ImageDB WHERE imageID = '" + displayimgid + "'";
                SqlCommand com = new SqlCommand(convertCmd, conn);
                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                context.Response.BinaryWrite((byte[])dr[0]);
                context.Response.End();
                conn.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}