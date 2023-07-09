<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="BusBookingProject.Admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
       
        .centered-form {
            margin-top: 10%;
        }

        .centered-form .panel {
            background: rgba(255, 255, 255, 0.8);
            box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
        }

        label.label-floatlabel {
            font-weight: bold;
            color: #46b8da;
            font-size: 11px;
        }
         .auto-style2 {
             top: -2px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="padding100" style="margin-top:3%; background-image: url('<%= ResolveUrl("~/img/adminlogin.jpg") %>'); background-size: cover; background-position: center;">
        <div class="container">
            <div id="loginbox" style="margin-top: 7%; margin-bottom:10%" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default" style="background-color: rgba(255, 255, 255, 0.8); box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Admin Login
                        </div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <asp:Label ID="lblErrorMsg" runat="server" /><br />
                        <br />
                        <asp:ValidationSummary ID="vsLogin" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgLogin" />
                        <div id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox runat="server" ID="txtUserId" placeholder="Enter Admin Id" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserId" Display="None" ID="rfvLoginId" ValidationGroup="vgLogin"
                                    CssClass="text-danger" ErrorMessage="The email field is required." /><br />
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter password here" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="None" CssClass="text-danger" ID="rfvPassword"
                                    ErrorMessage="The password field is required." ValidationGroup="vgLogin" />
                            </div>
                            <div  class="form-group text-center" style="height: 33px" >
                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    <asp:Button runat="server"  ID="btnLogin" Text="Log in" CssClass="btn btn-success" style="width:auto;" ValidationGroup="vgLogin" CausesValidation="True" OnClick="btnLogin_Click" /><br /><br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="navbar-default navbar-flex-bottom" style="background-color: black; text-align: center; font-weight: bold; color: red;">
        <div class="container-fluid">
            <span style="align-content: center; font-display: auto;">HELP LINE:12332</span>
        </div>
    </footer>
</asp:Content>
