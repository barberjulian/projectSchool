using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmSalaryCalculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Double Salary = 0.0;
        Double AnnualHours = 0.0;
        Double Rate = 0.0;

        AnnualHours = Convert.ToDouble(txtAnnualHours.Text);
        Rate = Convert.ToDouble(txtRate.Text);

        Salary = AnnualHours + Rate;

        lblSalary.Text = Salary.ToString();
    }
 
}