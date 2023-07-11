using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject
{
    public partial class Home : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DateTime currentDate = DateTime.Today;
                DateTime maxDate = currentDate.AddMonths(3);
                txtDate.Attributes["min"] = currentDate.ToString("yyyy-MM-dd");
                txtDate.Attributes["max"] = maxDate.ToString("yyyy-MM-dd");

                bindOriginCity();
                bindDextinationCity();
            }
        }

        private void bindOriginCity()
        {
            DataSet dsOrigin = getCity();
            if (dsOrigin.Tables[0].Rows.Count > 0)
            {
                ddlOrigin.DataSource = dsOrigin.Tables[0];
                ddlOrigin.DataTextField = "CityName";
                ddlOrigin.DataValueField = "CityID";
                ddlOrigin.DataBind();
            }
            ddlOrigin.Items.Insert(0, new ListItem("-Select City--", "0"));

     
        }

   

    

        private void bindDextinationCity()
        {
            DataSet dsOrigin = getCity();
            if (dsOrigin.Tables[0].Rows.Count > 0)
            {
                ddlDestination.DataSource = dsOrigin.Tables[0];
                ddlDestination.DataTextField = "CityName";
                ddlDestination.DataValueField = "CityName";
                ddlDestination.DataBind();
            }
            ddlDestination.Items.Insert(0, new ListItem("-Select City--", "0"));
        }

        private DataSet getCity()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetCity";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            return dsGetData;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("BusBookingSearchDetails.aspx?Origin="+ddlOrigin.SelectedItem.Text+"&Destination="+ddlDestination.SelectedItem.Text+"&TravelDate="+ txtDate.Text + "&BustType=" + ddlBustType.SelectedItem.Text);
        }
    }
}