using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmPersonnel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Checks wether user or admin
        if (Session["SecurityLevel"] == "A")
        {

            btnSubmit.Visible = true;

            //Displays button if Admin
        }
        else
        {

            btnSubmit.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      // bool anyError = false;
      // txtLastName.BackColor = System.Drawing.Color.White;
      // txtFirstName.BackColor = System.Drawing.Color.White;
      // txtPayRate.BackColor = System.Drawing.Color.White;
      // txtStartDate.BackColor = System.Drawing.Color.White;
      // txtEndDate.BackColor = System.Drawing.Color.White;
      // lblError.Text = "";
        
      // if (txtFirstName.Text == "")
      // {
      //     anyError = true;
      //     lblError.Text = lblError.Text + "\n First name must be entered";
      //     txtFirstName.BackColor = System.Drawing.Color.Yellow;
      // }
      // if (txtLastName.Text == "")
      // {
      //     anyError = true;
      //     lblError.Text = "Last name must be entered";
      //     txtLastName.BackColor = System.Drawing.Color.Yellow;
      // }
      // if (txtPayRate.Text == "")
      // {
      //     anyError = true;
      //     lblError.Text = lblError.Text + "\n Payrate must be entered";
      //     txtPayRate.BackColor = System.Drawing.Color.Yellow;
      // }
      // if (txtStartDate.Text == "")
      // {
      //      anyError = true;
      //     lblError.Text = lblError.Text + "\n Start date must be entered";
      //     txtStartDate.BackColor = System.Drawing.Color.Yellow;
      // }
      // if (txtEndDate.Text == "")
      // {
      //     anyError = true;
      //     lblError.Text = lblError.Text + "\n End date must be entered";
      //     txtEndDate.BackColor = System.Drawing.Color.Yellow;
      // }       
      //  
      // if (anyError == false)
      // {
            Session["txtFirstName"] = txtFirstName.Text;
            Session["txtLastName"] = txtLastName.Text;
            Session["txtPayRate"] = txtPayRate.Text;
            Session["txtStartDate"] = txtStartDate.Text;
            Session["txtEndDate"] = txtEndDate.Text;
            Response.Redirect("frmPersonnelVerified.aspx");
      // }
    }
}