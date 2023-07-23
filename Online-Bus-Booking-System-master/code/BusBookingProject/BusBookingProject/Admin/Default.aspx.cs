using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=OnlineBusBooking;Integrated Security=True");
            //Geting bus number
            con.Open();
            SqlCommand com = new SqlCommand("Select count(BusId) from BusMaster",con);
            SqlDataReader dr = com.ExecuteReader();
            while(dr.Read())
            {
                Label1.Text = dr.GetValue(0).ToString();
            }
            con.Close();

            //Getting route number
            con.Open();
            SqlCommand com1 = new SqlCommand("Select count(RouteID) from RouteDetails", con);
            SqlDataReader dr1 = com1.ExecuteReader();
            while (dr1.Read())
            {
                Label3.Text = dr1.GetValue(0).ToString();
            }
            con.Close();

            //Getting customer number
            con.Open();
            SqlCommand com2 = new SqlCommand("Select count(regId) from Registration", con);
            SqlDataReader dr2 = com2.ExecuteReader();
            while (dr2.Read())
            {
                Label2.Text = dr2.GetValue(0).ToString();
            }
            con.Close();

            //Getting total Sold Ticket
            con.Open();
            SqlCommand com3 = new SqlCommand("select sum(BookedSeats) from ScheduleMaster;", con);
            SqlDataReader dr3 = com3.ExecuteReader();
            while (dr3.Read())
            {
                Label4.Text = dr3.GetValue(0).ToString();
            }
            con.Close();

        }
    }
}