using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class BusTicktSalesReport : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                
                bingBookingReport();
                totalsales();
            }
        }
        private void bingBookingReport()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetBookingSalesReportByAdmin";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            if (dsGetData.Tables[0].Rows.Count > 0)
            {
                gdTicketReport.DataSource = dsGetData.Tables[0];
                gdTicketReport.DataBind();
            }
            else
            {
                gdTicketReport.DataSource = null;
                gdTicketReport.EmptyDataText = "No Records Found";
                gdTicketReport.DataBind();
            }

        }
        private void totalsales()
        {
          
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetTotalSalesByAdmin";
            sqlCmd.Connection = connString;
            
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);

            sda.Fill(dsGetData);
            if (dsGetData.Tables[0].Rows.Count > 0)
            {
                decimal sumValue = Convert.ToDecimal(dsGetData.Tables[0].Rows[0][0]);

                // Assign the sum value to the label
                lblsales.Text = sumValue.ToString();
            }
        }
    }
}