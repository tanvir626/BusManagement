<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BusTicktSalesReport.aspx.cs" Inherits="BusBookingProject.Admin.BusTicktSalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .newStyle1 {
            background-color: #FF00FF;
        }
        .auto-style1 {
            width: 1452px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container auto-style1"style="background-color:white;margin-top:5%;margin-left:3%; height: 67px; width: 1198px;" >
        

    </div>
    <div style="margin-top:1%;margin-left:3%" class="auto-style1">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="311px" Width="1198px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" >
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" >
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BustType" HeaderText="Bus Type" SortExpression="BustType" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BookedSeat" HeaderText="BookedSeat" SortExpression="BookedSeat" >
                
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="SusbTotal">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineBusBookingConnectionString %>" SelectCommand="SELECT ScheduleMaster.Date, BusMaster.BusName, BookingMaster.Origin, BookingMaster.Destination, BusMaster.BustType, ScheduleMaster.Fare, ScheduleMaster.BookedSeats AS BookedSeat FROM BookingMaster INNER JOIN ScheduleMaster ON BookingMaster.ScheduleID = ScheduleMaster.ScheduleId INNER JOIN BusMaster ON BookingMaster.BusId = BusMaster.BusId ORDER BY ScheduleMaster.Date ASC "></asp:SqlDataSource>
    <br />
    </div>


</asp:Content>

