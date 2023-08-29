<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="BusBookingProject.Admin.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        body {

            background-color: rgba(0, 0, 0, 0.3);
            overflow-y: hidden;
            /*#c1bdba*/
        }

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

         .center-block {
            float: none;
            margin-left: auto;
            margin-right: auto;
        }

        .input-group .icon-addon .form-control {
            border-radius: 0;
        }

        .icon-addon {
            position: relative;
            color: #555;
            display: block;
        }

            .icon-addon:after,
            .icon-addon:before {
                display: table;
                content: " ";
            }

            .icon-addon:after {
                clear: both;
            }

            .icon-addon.addon-md .glyphicon,
            .icon-addon .glyphicon,
            .icon-addon.addon-md .fa,
            .icon-addon .fa {
                position: absolute;
                z-index: 2;
                left: 10px;
                font-size: 14px;
                width: 20px;
                margin-left: -2.5px;
                text-align: center;
                padding: 10px 0;
                top: 1px;
            }

            .icon-addon.addon-lg .form-control {
                line-height: 1.33;
                height: 46px;
                font-size: 18px;
                padding: 10px 16px 10px 40px;
            }

            .icon-addon.addon-sm .form-control {
                height: 30px;
                padding: 5px 10px 5px 28px;
                font-size: 12px;
                line-height: 1.5;
            }

            .icon-addon.addon-lg .fa,
            .icon-addon.addon-lg .glyphicon {
                font-size: 18px;
                margin-left: 0;
                left: 11px;
                top: 4px;
            }

            .icon-addon.addon-md .form-control,
            .icon-addon .form-control {
                padding-left: 30px;
                float: left;
                font-weight: normal;
            }

            .icon-addon.addon-sm .fa,
            .icon-addon.addon-sm .glyphicon {
                margin-left: 0;
                font-size: 12px;
                left: 5px;
                top: -1px;
            }

            .icon-addon .form-control:focus + .glyphicon,
            .icon-addon:hover .glyphicon,
            .icon-addon .form-control:focus + .fa,
            .icon-addon:hover .fa {
                color: #2580db;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding100" style="margin-top: 3%; background-image: url('<%= ResolveUrl("~/img/adminlogin.jpg") %>'); background-size: cover; background-position: center;">
        <div class="container">
            <div id="loginbox" style="margin-top: 7%; margin-bottom: 10%" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
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
                                <asp:TextBox runat="server" ID="txtUserId" placeholder="Enter User Name" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserId" Display="None" ID="rfvLoginId" ValidationGroup="vgLogin"
                                    CssClass="text-danger" ErrorMessage="The email field is required." /><br />
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter password here" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="None" CssClass="text-danger" ID="rfvPassword"
                                    ErrorMessage="The password field is required." ValidationGroup="vgLogin" />
                            </div>
                            <div class="form-group text-center" style="height: 33px">
                                <!-- Button -->
                                <div class="col-sm-12 controls" style="width: auto; position: absolute; bottom: 20; left: 50%; transform: translateX(-50%);">
                                    <asp:Button runat="server" ID="btnLogin"  Text="Log in" CssClass="btn btn-success" Style="width: auto;" ValidationGroup="vgLogin" CausesValidation="True" OnClick="btnLogin_Click" /><br />
                                    <br />
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
