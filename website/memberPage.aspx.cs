using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class memberPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       //show user email address
        memberTitleLbl.Text = "Hello, " + Session["User"];
    }
    protected void signOutBTN_Click(object sender, EventArgs e)
    {
        //clear the session variables on log out.
        Session.Clear();
        //go to the home page
        Response.Redirect("index.aspx");
    }
}