using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

public partial class wishlist : System.Web.UI.Page
{
    String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //database connection string
    SqlCommand command;
    String query = "";

    int userID;

    protected void Page_Load(object sender, EventArgs e)
    {
        //get the userID by using Session["User"] on the Users table
        userID = searchDatabase("SELECT userID FROM Users WHERE email = '" + Session["User"] + "'");
        //get the wishlist
        buildQuery("SELECT * FROM Wishlist WHERE userID = " + this.userID);
    }

    private int searchDatabase(String query)
    {
        //declare the connection
        SqlConnection connection = new SqlConnection(connectionString);
        //open the connection
        connection.Open();
        this.query = query;
        //create SQL command and connection
        command = new SqlCommand(query, connection);
        //read data
        SqlDataReader dataReader = command.ExecuteReader();
        connection.Close();
        return 0;
    }

    private void buildQuery(String query)
    {
        //declare the connection
        SqlConnection connection = new SqlConnection(connectionString);
        //open the connection
        connection.Open();
        this.query = query;
        //create SQL command and connection
        command = new SqlCommand(query, connection);
        //read data
        SqlDataReader dataReader = command.ExecuteReader();
        //create the listing with the read data
        showWishlist(dataReader);
        //close the connection
        connection.Close();
    }

    private void showWishlist(SqlDataReader dataReader)
    {
        //local variable
        int listingID = 0;
        //while data is being read...
        while (dataReader.Read())
        {
            //create the listing
            HtmlGenericControl listing = new HtmlGenericControl("listing");
            listing.Attributes.Add("style", "content");
            listing.ID = "listing: " + listingID;
            //style the listing
            listing.Style.Add(HtmlTextWriterStyle.BackgroundColor, "#c0c0c0");
            listing.Style.Add(HtmlTextWriterStyle.BorderStyle, "solid");
            listing.Style.Add(HtmlTextWriterStyle.BorderColor, "#999999");
            listing.Style.Add(HtmlTextWriterStyle.Color, "black");
            listing.Style.Add(HtmlTextWriterStyle.Display, "inline-table");
            listing.Style.Add(HtmlTextWriterStyle.FontStyle, "Arial");
            listing.Style.Add(HtmlTextWriterStyle.Margin, "10px");
            listing.Style.Add(HtmlTextWriterStyle.Padding, "10px");
            listing.Style.Add(HtmlTextWriterStyle.Width, "300px");
            //add an image to the listing
            System.Web.UI.WebControls.Image image = new Image();
            //image sizing
            image.Height = 250;
            image.Width = 350;
            //add to the listing
            listing.Controls.Add(image);
            //retrieve image via ImageHandler
            image.ImageUrl = "ImageHandler.ashx?id=" + dataReader["carID"];
            //content of the listing
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Make: " + dataReader["make"] });
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Model: " + dataReader["model"] });
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Type: " + dataReader["type"] });
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Year: " + dataReader["regYear"] });
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Price: £" + dataReader["price"] });
            listing.Controls.Add(new LiteralControl("<br />"));
            listing.Controls.Add(new Label() { Text = "Location: " + dataReader["location"] });
            //add the listing to the page
            Controls.Add(listing);
            listingID++;
        }
        //close the reader
        dataReader.Close();
    }
}