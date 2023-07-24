using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class BusTicktSalesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {

            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
            double total = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                // Access the cell value based on its column index
                string price = row.Cells[5].Text;
                string quantity = row.Cells[6].Text;

                double p = Convert.ToDouble(price);
                double q = Convert.ToDouble(quantity);

                // Perform the calculation
                double rowTotal = p * q;

                // Add the row total to the overall total
                total += rowTotal;
                row.Cells[7].Text = Convert.ToString(rowTotal);
            }
            Label2.Text = Convert.ToString(total);
        }

        
    }
}