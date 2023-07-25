<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BusTicktSalesReport.aspx.cs" Inherits="BusBookingProject.Admin.BusTicktSalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .newStyle1 {
            background-color: #FF00FF;
        }
        .auto-style1 {
            width: 1200px;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style4 {
            width: 919px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container auto-style1 text-center"style="background-color:white;margin-top:5%;margin-left:3%; height: 22px; width: 1198px; text-align: center;" >
        <p class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <div class="container auto-style1 text-center"style="background-color:white;margin-top:0%;margin-left:3%; height: 67px; width: 1198px; text-align: center;" >
        <asp:TextBox runat="server"  id="from" placeholder="From" CssClass="form-control" color="black"  style="float:left;margin-left:3%;margin-top:1%;margin-bottom:1%" Height="49px" Width="475px"></asp:TextBox>
        <asp:TextBox runat="server"  ID="to"  placeholder="To" CssClass="form-control" color="black"  style="float:left;margin-left:4%;margin-right:2%; margin-top:1%;margin-bottom:1%" Height="49px" Width="475px" ForeColor="#000066"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" ForeColor="Black" Height="43px" style="margin-top:1%;" Width="90px" OnClick="Button1_Click" />
    </div>
    <div style="margin-top:0%;margin-left:3%; height: 365px;" class="auto-style1">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="311px" Width="1198px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BustType" HeaderText="BustType" SortExpression="BustType" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="BookedSeat" HeaderText="BookedSeat" SortExpression="BookedSeat" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Subtotal">
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
       
        <div style="background-color:white" class="auto-style2">
            <h2 class="text-center">
            <asp:Label ID="Label1" runat="server" Text="Total :"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" Text="0" ForeColor="#FF3300"></asp:Label>
            &nbsp;<asp:Label ID="Label3" runat="server" Text="Taka"></asp:Label>
            &nbsp;, Ticket Booked :
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="0"></asp:Label>
            </h2>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineBusBookingConnectionString %>" SelectCommand="SELECT ScheduleMaster.Date, BusMaster.BusName, BookingMaster.Origin, BookingMaster.Destination, BusMaster.BustType, ScheduleMaster.Fare, ScheduleMaster.BookedSeats AS BookedSeat
FROM BookingMaster
INNER JOIN ScheduleMaster ON BookingMaster.ScheduleID = ScheduleMaster.ScheduleId
INNER JOIN BusMaster ON BookingMaster.BusId = BusMaster.BusId
WHERE ScheduleMaster.Date BETWEEN @start AND @end
ORDER BY ScheduleMaster.Date ASC;" >
            <SelectParameters>
                <asp:ControlParameter ControlID="from" Name="start" PropertyName="Text" />
                <asp:ControlParameter ControlID="to" Name="end" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    </div>
    
</asp:Content>

