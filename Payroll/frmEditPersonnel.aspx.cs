using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmEditPersonnel : System.Web.UI.Page
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
    }
    protected void grdEditPersonnel_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}