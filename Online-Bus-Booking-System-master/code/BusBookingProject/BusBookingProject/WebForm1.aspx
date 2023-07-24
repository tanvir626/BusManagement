<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BusBookingProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineBusBookingConnectionString %>" SelectCommand="SELECT ScheduleMaster.Date, BusMaster.BusName, BookingMaster.Origin, BookingMaster.Destination, BusMaster.BustType, ScheduleMaster.Fare, ScheduleMaster.BookedSeats AS BookedSeat
FROM BookingMaster
INNER JOIN ScheduleMaster ON BookingMaster.ScheduleID = ScheduleMaster.ScheduleId
INNER JOIN BusMaster ON BookingMaster.BusId = BusMaster.BusId
WHERE ScheduleMaster.Date BETWEEN @start AND @end
ORDER BY ScheduleMaster.Date ASC;">
            <SelectParameters>
                <asp:ControlParameter ControlID="start" Name="start" PropertyName="Text" />
                <asp:ControlParameter ControlID="end" Name="end" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>

            <asp:TextBox ID="start" runat="server"></asp:TextBox>
            <asp:TextBox ID="end" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
                    <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                    <asp:BoundField DataField="BustType" HeaderText="BustType" SortExpression="BustType" />
                    <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
                    <asp:BoundField DataField="BookedSeat" HeaderText="BookedSeat" SortExpression="BookedSeat" />
                    <asp:TemplateField HeaderText="Subtotal"></asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />

            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label></div>
    </form>
</body>
</html>
