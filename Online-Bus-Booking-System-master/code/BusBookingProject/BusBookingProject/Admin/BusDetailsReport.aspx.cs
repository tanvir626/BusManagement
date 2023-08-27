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
    public partial class BusDetailsReport : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["UserName"] !=null)
                {
                    bindBusDetailsReport();
                }
                else
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }
            if (Request.QueryString["BusID"] != null)
            {
                btn_del(Request.QueryString["BusID"]);
            }
        }

        private void bindBusDetailsReport()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetBusDetailsForUpdation";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            if(dsGetData.Tables[0].Rows.Count>0)
            {
                gdBusDetails.DataSource = dsGetData.Tables[0];
                gdBusDetails.DataBind();
            }
            else
            {
                gdBusDetails.DataSource = null;
                gdBusDetails.EmptyDataText = "No Records Found";
                gdBusDetails.DataBind();
            }
        }

        protected void gdBusDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                HyperLink klnikUpdate = (HyperLink)e.Row.FindControl("hlinkUpdate");
                HiddenField hdnBusID = (HiddenField)e.Row.FindControl("hdnPNRNo");
                HyperLink hlinkSchedule = (HyperLink)e.Row.FindControl("hlinkAddSchedule");
                HyperLink hlBusDelete = (HyperLink)e.Row.FindControl("hlBusDelete");
                HiddenField hdnRouteID = (HiddenField)e.Row.FindControl("hdnRouteID");
                klnikUpdate.NavigateUrl = "BusDetails.aspx?BusID=" + hdnBusID.Value;
                hlinkSchedule.NavigateUrl = "BusScheduleDetails.aspx?BusID=" + hdnBusID.Value + "&RouteID=" + hdnRouteID.Value;
                hlBusDelete.NavigateUrl = "BusDetailsReport.aspx?BusID=" + hdnBusID.Value;

            }
        }

        protected void btn_del(string x)
        {
            SqlCommand com = new SqlCommand("DELETE FROM BusMaster WHERE BusId='"+x+"';", connString);
            SqlCommand com1 = new SqlCommand("DELETE FROM BookingMaster WHERE BusId='" + x + "';", connString);
            SqlCommand com2 = new SqlCommand("DELETE FROM PickUpStand WHERE BusId='" + x + "';", connString);
            SqlCommand com3 = new SqlCommand("DELETE FROM RouteDetails WHERE BusId='" + x + "';", connString);
            SqlCommand com4 = new SqlCommand("DELETE FROM ScheduleMaster WHERE BusId='" + x + "';", connString);
            com.ExecuteNonQuery();
            com1.ExecuteNonQuery();
            com2.ExecuteNonQuery();
            com3.ExecuteNonQuery();
            com4.ExecuteNonQuery();
            bindBusDetailsReport();
        }
        
        
    }
}