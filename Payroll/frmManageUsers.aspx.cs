using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {               
        if (Session["SecurityLevel"] != null)
        {
            if (Session["SecurityLevel"].ToString() == "U")
            {
                Response.Redirect("default.aspx");
            }
        }
        else
        {
            Response.Redirect("frmLogin.aspx");
        }

        clsDataLayer.SaveUserActivity(Server.MapPath("PayrollSystem_DB.mdb"), "frmManageUsers");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["txtUserName"] = txtUserName.Text; 
        Session["txtUserPassword"] = txtPassword.Text; 
        Session["txtSecurityLevel"] = ddSecurityLevel.SelectedValue; 

        if (clsDataLayer.SaveUser(Server.MapPath("PayrollSystem_DB.mdb"),
            Session["txtUserName"].ToString(), Session["txtUserPassword"].ToString(), Session["txtSecurityLevel"].ToString()))
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            lblAddMsg.Text = "The user was successfully added!";
            grdUsers.DataBind();
        }
        else
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            lblAddMsg.Text = "The user was NOT added.";
        }
    }
}