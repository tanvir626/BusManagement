﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="BusBookingProject.BookingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
                   <asp:GridView ID="gdTicketReport" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="True" PageSize="20"
                    Width="100%" Font-Size="12pt" OnRowCommand="gdTicketReport_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="PNRNo" DataField="PNRNo" />
                        <asp:BoundField HeaderText="First Name" DataField="Fname" />
                        <asp:BoundField HeaderText="Lasmt Name" DataField="Lname" />
                        <asp:BoundField HeaderText="Travel Date" DataField="TravelDate" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtndownloadTicket" runat="server" CommandName="Download Ticket" CommandArgument='<%# Container.DataItemIndex %>'>Download Ticket</asp:LinkButton>
                                <asp:HiddenField ID="hdnPNRNo" runat="server" Value='<%# Eval("PNRNo") %>' />
                            </ItemTemplate>
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

              <div id="ticket" runat="server" visible="false">
                <h1 style="font-weight: bold">Online Bus Booking</h1>
                <br />
                <br />

                <h2 style="font-weight: bold">PNR Details</h2>
                <div class="table-bordered">
                    <table class="table-striped" id="tbtPNR" runat="server" style="width: 100%; color: green; font-size: large">
                        <tr>
                            <td style="font-weight: bold">Date</td>
                            <td>
                                <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">PNR No</td>
                            <td>
                                <asp:Label ID="lblTransactionNo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Total Tickets</td>
                            <td>
                                <asp:Label ID="lblTotalTickets" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Total Amount</td>
                            <td>
                                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Bus Name</td>
                            <td>
                                <asp:Label ID="lblBusName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Departure Time</td>
                            <td>
                                <asp:Label ID="lblDepartureTime" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">To(Boarding Place)</td>
                            <td>
                                <asp:Label ID="lblTo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">From</td>
                            <td>
                                <asp:Label ID="lblfrom" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <h2 style="font-weight: bold">Passenger's Details</h2>
                <asp:GridView ID="gdPaxDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="True" PageSize="25" CssClass="table table-hover table-bordered" Style="margin-top: 5%" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="First Name" DataField="Fname" />
                        <asp:BoundField HeaderText="Last Name" DataField="Lname" />
                        <asp:BoundField HeaderText="Contact" DataField="Contact" Visible="False" />
                        <asp:BoundField HeaderText="SeatNo" DataField="SeatNo" />
                         <asp:BoundField HeaderText="Travel Date" DataField="TravelDate" Visible="False" />
                         <asp:BoundField HeaderText="From" DataField="Origin" Visible="False" />
                        <asp:BoundField HeaderText="To" DataField="Destination" Visible="False" />
                        <asp:BoundField HeaderText="Boarding Place" DataField="PlaceName" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <p style="text-align: center; font-style: italic; font-size: 10pt">
                    Thank you for booking Ticket with us,have a pleasant journey!!!!
                </p>
            </div>
    </div>
</asp:Content>
