using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

public partial class register : System.Web.UI.Page
{
   //used for storing encrypted passwords in the db
    Encryption encryption = new Encryption();

    protected void Page_Load(object sender, EventArgs e)
    {
        //on page load generate a random string of characters 
        generateCaptcha();
    }

    protected void RegisterUser(object sender, EventArgs e)
    {
        int userId = 0;

        String captchaText = captchaInput.Text;
        Response.Write(Session["prev_captcha"] + " " + captchaText);
        String prCaptcha = (string)Session["prev_captcha"]; //set the captcha

        if (captchaText == prCaptcha) //if the captcha matches
        {
            //db connection string
            string connectionstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionstr))
            {
                using (SqlCommand command = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        //insert into the users table
                        command.Parameters.AddWithValue("@name", nameInput.Text.Trim());
                        command.Parameters.AddWithValue("@surname", surnameInput.Text.Trim());
                        command.Parameters.AddWithValue("@password", encryption.MD5Hash(passRegInput.Text.Trim()));
                        command.Parameters.AddWithValue("@email", emailInput.Text.Trim());
                        command.Parameters.AddWithValue("@phone", phoneInput.Text.Trim());
                        command.Parameters.AddWithValue("@address", addressInput.Text.Trim());
                        command.Connection = connection;
                        connection.Open();
                        userId = Convert.ToInt32(command.ExecuteScalar());
                        connection.Close();
                    }
                }
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username taken.\\nPlease use a different email/username."; //checks
                        emailInput.Text = "";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.";
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                Response.Redirect("register_success.aspx"); //change page
            }
        }
    }

    protected void generateCaptcha()
    {
        //generate a random string of characters
        Session["prev_captcha"] = captchaTextLabel.Text;
        Random RandomClass = new Random();
        captchaTextLabel.Text = "";
        for (int i = 0; i <= 5; i++)
        {
            captchaTextLabel.Text += ((char)RandomClass.Next('A', 'Z' + 1)).ToString(); //characters range from A-Z
        }
    }
}