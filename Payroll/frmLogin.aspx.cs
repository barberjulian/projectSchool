using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class frmLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        // Declare the dataset
        dsUser dsUserLogin;

        // Declare string
        string SecurityLevel;

        // Fill dataset with function return
        dsUserLogin = clsDataLayer.VerifyUser(Server.MapPath("PayrollSystem_DB.mdb"),
                         Login1.UserName, Login1.Password);

        // Validate login
        if (dsUserLogin.tblUserLogin.Count < 1)
        {
            e.Authenticated = false;
            // Sends email if there's an email failure
            if (clsBusinessLayer.SendEmail("barber.julian.c@gmail.com",
            "srirachaone@gmail.com", "", "", "Login Incorrect",
            "The login failed for UserName: " + Login1.UserName +
            " Password: " + Login1.Password))
            {

                Login1.FailureText = Login1.FailureText +
            " Your incorrect login information was sent to receiver@receiverdomain.com";

            }
            return;
        }

        SecurityLevel = dsUserLogin.tblUserLogin[0].SecurityLevel.ToString();

        // Case statement that evaluates login privileges
        switch (SecurityLevel)
        {
            case "A":
                // Sets SecurityLevel to Admin
                e.Authenticated = true;
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                Session["SecurityLevel"] = "A";
                break;
            case "U":
                // Sets SecurityLevel to User
                e.Authenticated = true;
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                Session["SecurityLevel"] = "U";
                break;
            default:           
                e.Authenticated = false;
                break;
        }
    }
}