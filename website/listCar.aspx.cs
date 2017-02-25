using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void uploadBTN_Click(object sender, EventArgs e)
    {
        int carId = 0;
        //connection string for database
        string connectionstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionstr))
        {
            using (SqlCommand command = new SqlCommand("Insert_Car")) //stored procedure for inserting to the cars table
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    //insert into the database
                    command.Parameters.AddWithValue("@type", typeInput.Text.Trim());
                    command.Parameters.AddWithValue("@make", makeInput.Text.Trim());
                    command.Parameters.AddWithValue("@model", modelInput.Text.Trim());
                    command.Parameters.AddWithValue("@colour", colourInput.Text.Trim());
                    command.Parameters.AddWithValue("@price", priceInput.Text.Trim());
                    command.Parameters.AddWithValue("@regYear", yearInput.Text.Trim());
                    command.Parameters.AddWithValue("@location", locationInput.Text.Trim());
                    command.Parameters.AddWithValue("@used", usedInput.Text.Trim());
                    command.Connection = connection;
                    connection.Open();
                    carId = Convert.ToInt32(command.ExecuteScalar());
                    connection.Close();
                }
            }
        }
        Response.Redirect("index.aspx"); //when complete go to the home page
    }
}