<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="RouteDetails.aspx.cs" Inherits="BusBookingProject.Admin.RouteDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 5%">
         <asp:GridView ID="gdRouteDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="false" PageSize="50" CssClass="table table-hover table-bordered"
                    Width="100%" Font-Size="12pt" OnRowDataBound="gdRouteDetails_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gdRouteDetails_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField >
                        <asp:TemplateField HeaderText="Bus ID">
                           <ItemTemplate>
                               <asp:Label ID="lblBusID" runat="server" Text='<%# Eval("BusID") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Route ID">
                           <ItemTemplate>
                               <asp:Label ID="lblRouteID" runat="server" Text='<%# Eval("RouteID") %>'></asp:Label>
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
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                           <ItemTemplate>
                               <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Departure Time">
                           <ItemTemplate>
                               <asp:Label ID="lblDepartureTime" runat="server" Text='<%# Eval("DepartureTime") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlinkBoarding" runat="server" >Add Boarding Points</asp:HyperLink>
                                <asp:HyperLink ID="hlinkdel" runat="server" >Delete</asp:HyperLink>
                                 <asp:HiddenField ID="hdnRouteID" runat="server" Value='<%# Eval("RouteID") %>' />
                                 <asp:HiddenField ID="hdnBusID" runat="server" Value='<%# Eval("BusId") %>' />
                                <asp:HiddenField ID="hdnDepartureTime" runat="server" Value='<%# Eval("DepartureTime") %>' />
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
