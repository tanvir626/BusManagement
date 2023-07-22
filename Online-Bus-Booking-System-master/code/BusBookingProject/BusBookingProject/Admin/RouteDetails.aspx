<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="RouteDetails.aspx.cs" Inherits="BusBookingProject.Admin.RouteDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 8%">
         <asp:GridView ID="gdRouteDetails" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="True" PageSize="20" CssClass="table table-hover table-bordered"
                    Width="100%" Font-Size="12pt" OnRowDataBound="gdRouteDetails_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField >
                         <asp:TemplateField HeaderText="Route ID">
                           <ItemTemplate>
                               <asp:Label ID="lblBusNo" runat="server" Text='<%# Eval("RouteID") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                          <asp:TemplateField HeaderText="Origin">
                           <ItemTemplate>
                               <asp:Label ID="lblBusName" runat="server" Text='<%# Eval("Origin") %>'></asp:Label>
                           </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                         <asp:TemplateField HeaderText="Destination">
                           <ItemTemplate>
                               <asp:Label ID="lblBusType" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>
                           </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlinkBoarding" runat="server" >Add Boarding Points</asp:HyperLink>
                                 <asp:HiddenField ID="hdnRouteID" runat="server" Value='<%# Eval("RouteID") %>' />
                                 <asp:HiddenField ID="hdnBusID" runat="server" Value='<%# Eval("BusId") %>' />
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
