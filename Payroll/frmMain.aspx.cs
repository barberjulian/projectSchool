using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // call to the class and save the user's activity
        clsDataLayer.SaveUserActivity(Server.MapPath("PayrollSystem_DB.mdb"), "frmPersonnel");
        // call to the class and save the personnel
        clsDataLayer.SavePersonnel(Server.MapPath("PayrollSystem_DB.mdb"),"FirstName", "LastName", "PayRate", "StartDate", "EndDate");
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("frmLogin.aspx");
        }
        if (Session["SecurityLevel"] == "U")
        {
            imgbtnNewEmployee.Visible = false;
            lnkbtnAddEmployee.Visible = false;
            imgbtnViewUserActivity.Visible = false;
            lnkbtnUserActivity.Visible = false;
            imgbtnEditEmployees.Visible = false;
            lnkbtnEditEmployees.Visible = false;
            imgbtnManageUsers.Visible = false;
            lnkbtnManageUsers.Visible = false;

        }

    }
    protected void lnkSalaryCalculator_Click(object sender, EventArgs e)
    {

    }
    protected void lnkAddEmployee_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}