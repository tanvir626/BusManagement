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
            int counter = 0;
            double rowTotal=0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                // Access the cell value based on its column index
                string price = row.Cells[6].Text;
                string quantity = row.Cells[7].Text;

                double p;
                double q;
                if (double.TryParse(price, out p) && double.TryParse(quantity, out q))
                {
                     rowTotal = p * q;
                }
                total += rowTotal;
                row.Cells[8].Text = Convert.ToString(rowTotal);
                counter++;
            }
            Label2.Text = Convert.ToString(total);
            Label4.Text = Convert.ToString(counter);
        }

        
    }
}