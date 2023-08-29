<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BusBookingProject.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 5%; height: 463px; background-color: aliceblue; text-align: center; font-size: large;">
        <h1 style="color: black; margin-top: 5%">Summary</h1>
        <br />
        <p>
            Total Bus:
                    
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Route:
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Label"></asp:Label>

        </p>
        <p>
            Total Reg.Customer:
            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ticket Sold:
            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
    </div>
</asp:Content>
