<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BusBookingProject.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Common styles */
        body {
            background: radial-gradient(circle, #1a82f7, #2F2727);
            height: 600px;
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
        
        /* Responsive styles */
        @media screen and (max-width: 768px) {
            /* Adjust margin and width for small screens */
            .col-lg-4,
            .col-sm-4,
            .col-md-2,
            .col-sm-offset-2,
            .col-md-offset-2 {
                width: 100%;
                margin-left: 0;
                margin-right: 0;
            }
            
            /* Adjust padding and font size for small screens */
            .icon-addon.addon-lg .form-control {
                padding: 10px 16px;
                font-size: 14px;
            }
            
            .icon-addon.addon-sm .form-control {
                padding: 5px 10px;
                font-size: 10px;
            }
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
     <div class="container" style="margin-top:8%">
         <div class="row ">
            <div class="col-lg-4 col-sm-4 col-md-2 col-sm-offset-2 col-md-offset-2" style="margin-left:30%">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Search For Available Buses</h3>
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
                                    <asp:Label ID="lblDate" runat="server" Type="Date" Text="Travel Date" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtDate" runat="server" placeholder="DD/MM/YYYY Format" class="form-control input-sm floatlabel"></asp:TextBox>
                                </div>
                            </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="form-group">
                                   <asp:Label ID="lbltype" runat="server" Text="Bus Type" Font-Bold="true"></asp:Label>
                                     <asp:DropDownList ID="DropDownList1" class="form-control input-sm floatlabel" runat="server">
                                         <asp:ListItem>Choose</asp:ListItem>
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
    
</asp:Content>
