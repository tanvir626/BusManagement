<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BusDetailsReport.aspx.cs" Inherits="BusBookingProject.Admin.BusDetailsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
        <asp:GridView ID="gdBusDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="True" PageSize="20" CssClass="table table-hover table-bordered"
                    Width="100%" Font-Size="12pt" OnRowDataBound="gdBusDetails_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField >
                       <asp:TemplateField HeaderText="Bus ID">
                           <ItemTemplate>
                               <asp:Label ID="lblBusID" runat="server" Text='<%# Eval("BusId") %>'></asp:Label>
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bus No">
                           <ItemTemplate>
                               <asp:Label ID="lblBusNo" runat="server" Text='<%# Eval("BusNo") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="Bus Name">
                           <ItemTemplate>
                               <asp:Label ID="lblBusName" runat="server" Text='<%# Eval("BusName") %>'></asp:Label>
                           </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bus Type">
                           <ItemTemplate>
                               <asp:Label ID="lblBusType" runat="server" Text='<%# Eval("BustType") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Seat Columns">
                           <ItemTemplate>
                               <asp:Label ID="lblSeatCol" runat="server" Text='<%# Eval("SeatColumn") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Seat Row">
                           <ItemTemplate>
                               <asp:Label ID="lblSeatRow" runat="server" Text='<%# Eval("SeatRow") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Origin">
                           <ItemTemplate>
                               <asp:Label ID="lblOrigin" runat="server" Text='<%# Eval("Origin") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Destination">
                           <ItemTemplate>
                               <asp:Label ID="lblDestination" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>
                           </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlinkUpdate" runat="server" >Update Details</asp:HyperLink>
                                 <asp:HyperLink ID="hlinkAddSchedule" runat="server" >Add Bus Schedule</asp:HyperLink>
                                <asp:HiddenField ID="hdnPNRNo" runat="server" Value='<%# Eval("BusId") %>' />
                                 <asp:HiddenField ID="hdnRouteID" runat="server" Value='<%# Eval("RouteID") %>' />
                            </ItemTemplate>
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
    </div>
</asp:Content>
