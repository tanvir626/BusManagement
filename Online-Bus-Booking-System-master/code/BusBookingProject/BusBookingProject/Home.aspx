<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BusBookingProject.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {

            background-color: rgba(0, 0, 0, 0.3);
            
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
       <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#txtJourneyDate").datepicker();
        });
        $(function () {
            $("#txtReturnJourneyDate").datepicker();
        });

  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="padding100" style="margin-top: 1%; background-image: url('<%= ResolveUrl("~/img/searchbus.jpg") %>'); background-size: cover; background-position: center;">
    <div class="container" style="margin-top:2%;margin-bottom:5% ;">
         <div class="row ">
            <div class="col-lg-4 col-sm-4 col-md-2 col-sm-offset-2 col-md-offset-2" style="margin-left:32%; background-size: cover; background-position: center;">
               
                <div class="panel panel-default" style="margin-top:20%">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Search For Available Buses</h3>
                    </div>
                    <div class="panel-body">
                        <div id="divMessage" runat="server" />
                           <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                   <asp:Label ID="lblAccType" runat="server" Text="From" Font-Bold="true"></asp:Label>
                                     <asp:DropDownList ID="ddlOrigin" class="form-control input-sm floatlabel" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                   <asp:Label ID="Label1" runat="server" Text="To" Font-Bold="true"></asp:Label>
                                     <asp:DropDownList ID="ddlDestination" class="form-control input-sm floatlabel" runat="server">
                                    </asp:DropDownList>
                                </div>

                                </div>
                          <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <asp:Label ID="lblDate" runat="server" Text="Travel Date" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtDate" TextMode="Date" runat="server" class="form-control input-sm floatlabel" Culture="en-GB" />
                                </div>
                            </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                   <asp:Label ID="lblbustype" runat="server" Text="Type" Font-Bold="true"></asp:Label>
                                     <asp:DropDownList ID="ddlBustType" class="form-control input-sm floatlabel" runat="server">
                                         <asp:ListItem>--Select--</asp:ListItem>
                                         <asp:ListItem>AC</asp:ListItem>
                                         <asp:ListItem>Normal</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                </div>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search Buses" class="btn btn-info btn-block" OnClick="btnSearch_Click"/>
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
    <%--<br />
    <br />
    <br />
    <br />
    <br />
    <br />--%>
</asp:Content>
