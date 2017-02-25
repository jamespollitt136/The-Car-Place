using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class index : System.Web.UI.Page
{
    String connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //database connection string
    SqlCommand command;
    String query = ""; //variable used to search the database

    String used;
    int usedVal = 2; //not 0 or 1 as to avoid search database
    String carMake;
    String year;
    String location;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void usedDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        used = usedDropDown.SelectedValue.ToString(); //get the value of drop down
        if(used == "True")
        {
            usedVal = 1; //relates to the bit value of the database
        }
        else //its false
        {
            usedVal = 0; //relates to the bit value of the database
        }
        buildQuery("SELECT * FROM Cars WHERE used = '" + usedVal + "'");
    }

    protected void makeDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        carMake = makeDropDown.SelectedValue; //get the value of drop down
        buildQuery("SELECT * FROM Cars WHERE make LIKE '" + carMake + "'"); //search the database for the selected car make
    }

    protected void yearDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        year = yearDropDown.SelectedValue; //get the value of drop down
        buildQuery("SELECT * FROM Cars WHERE regYear LIKE '" + year + "'"); //search the database for the selected year of registration
    }

    protected void locationInput_TextChanged(object sender, EventArgs e)
    {
        location = locationInput.Text; //get the value of drop down
        buildQuery("SELECT * FROM Cars WHERE location LIKE '" + location + "'"); //search the database for the input location
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
        createListing(dataReader);
        //close the connection
        connection.Close();
    }

    //creates a listing similar to professional e-commerce sites
    private void createListing(SqlDataReader dataReader)
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
    protected void searchBTN_Click(object sender, EventArgs e)
    {
        //on button click call the search method
        search();
    }

    protected void search()
    {
        //change to make all searches work together!
        query = "SELECT * FROM Cars WHERE make LIKE '" + carMake + "'";
        buildQuery(query);
    }
}