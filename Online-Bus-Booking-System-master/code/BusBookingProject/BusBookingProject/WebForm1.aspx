<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BusBookingProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:DropDownList ID="ddlColors" runat="server">
    <asp:ListItem Text="Select a color" Value=""></asp:ListItem>
    <asp:ListItem Text="Red" Value="Red"></asp:ListItem>
    <asp:ListItem Text="Blue" Value="Blue"></asp:ListItem>
    <asp:ListItem Text="Green" Value="Green"></asp:ListItem>
</asp:DropDownList>

<asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="ddlColors"
    ErrorMessage="Please select a color" Text="*"></asp:RequiredFieldValidator>

<asp:Button ID="btnSubmit" runat="server" Text="Submit" />

        </div>
    </form>
</body>
</html>
