<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public class ImageHandler : IHttpHandler
{
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            int ID = Convert.ToInt32(context.Request.QueryString["id"].ToString());
            SqlConnection sqlConnection = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|\\web_db.mdf;Integrated Security=True");
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = "Select image From Image Where carID = @ID";
            sqlCommand.Parameters.AddWithValue("@ID", ID);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            DataTable dataTable = new DataTable();

            adapter.Fill(dataTable);

            byte[] image = (byte[])dataTable.Rows[0][0];

            context.Response.ContentType = "image/jpeg";
            context.Response.ContentType = "image/jpg";
            context.Response.ContentType = "image/png";

            context.Response.BinaryWrite(image);
            context.Response.Flush();
        } 
        catch (Exception e)
        {
            
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