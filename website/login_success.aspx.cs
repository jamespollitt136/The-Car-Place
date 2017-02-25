using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //prove session variables work by showing during redirect.
        userSessLabel.Text = "User: " + Session["User"];
        Response.AddHeader("REFRESH", "5;URL=memberPage.aspx");
    }
}