using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmViewPersonnel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Declares the DataSet
            dsPersonnel myDataSet = new dsPersonnel();

            string search = Request["txtSearch"];
            
            // Fill the dataset with what is returned from the function
            myDataSet = clsDataLayer.GetPersonnel(Server.MapPath("PayrollSystem_DB.mdb"), search);

            // Sets the DataGrid to the DataSource based on the table
            grdViewPersonnel.DataSource = myDataSet.Tables["tblPersonnel"];

            // Binds the DataGrid
            grdViewPersonnel.DataBind();
        }
    }
    
}