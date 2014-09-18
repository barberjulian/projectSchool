using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmPersonnelVerified : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Inputs data from frmPersonnel and places it in textbox under txtVerifiedInfo
        txtVerifiedInfo.Text = Session["txtFirstName"] +
            "\n" + Session["txtLastName"] +
            "\n" + Session["txtPayRate"] +
            "\n" + Session["txtStartDate"] +
            "\n" + Session["txtEndDate"];

        // Compares verified info aganist 
        if (clsDataLayer.SavePersonnel(Server.MapPath("PayrollSystem_DB.mdb"),
         Session["txtFirstName"].ToString(),
         Session["txtLastName"].ToString(),
         Session["txtPayRate"].ToString(),
         Session["txtStartDate"].ToString(),
         Session["txtEndDate"].ToString()))
        {
            txtVerifiedInfo.Text = txtVerifiedInfo.Text +
                                  "\nThe information was successfully saved!";

        }
        else
        {
            txtVerifiedInfo.Text = txtVerifiedInfo.Text +
                                 "\nThe information was NOT saved.";
        }
    }
       
}