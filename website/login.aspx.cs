using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    //used for checking hashed passwords
    Encryption encryption = new Encryption();
    //database connection string
    private static string sqlConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginBTN_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(sqlConnectionString);
        connection.Open();
        //check credentials
        SqlCommand command = new SqlCommand("SELECT * FROM Users WHERE email='" + usernameInput.Text + "' AND password='" + encryption.MD5Hash(passwordInput.Text) + "'", connection);
        SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
        DataTable dataTable = new DataTable();
        dataAdapter.Fill(dataTable);
        if(dataTable.Rows.Count > 0)
        {
            signIn();
        }
        else
        {
            Response.Write("<script>ALERT('Username or Password not recognised. Please enter valid credentials.')</script>");
        }
    }

    protected void signIn()
    {
        //set session variables
        Session["User"] = usernameInput.Text;
        Session["Status"] = "loggedIn";
        Response.Redirect("login_success.aspx");
    }
}