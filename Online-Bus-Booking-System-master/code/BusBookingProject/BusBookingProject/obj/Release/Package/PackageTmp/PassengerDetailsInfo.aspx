<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="PassengerDetailsInfo.aspx.cs" Inherits="BusBookingProject.PassengerDetailsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }

        .auto-style2 {
            height: 52px;
            margin-top: 49px;
        }

        .auto-style3 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 2%">
        <div class="auto-style2">
            <h1 class="auto-style3">Passanger Information</h1>
        </div>
        <asp:GridView ID="gdPassengerDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact">
                    <ItemTemplate>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <FooterStyle HorizontalAlign="Right" />
                    <FooterTemplate>
                        <asp:Button ID="ButtonAdd" runat="server" Style="color: red" Text="Add New Passanger Details"
                            OnClick="ButtonAdd_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnConirmBooking" runat="server" CssClass="btn btn-success" Style="width: auto; margin-top: 2%" Text="Confirm Booking"
            OnClick="btnConirmBooking_Click" ClientIDMode="Static" />

        <div class="row" id="paymentOption" visible="false" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Payment GateWay</h3>
                </div>
                <div class="panel-body">

                    <asp:Label ID="Label1" runat="server" Text="Chose Payment Method " Font-Bold="true" CssClass="auto-style1"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="41px" Width="152px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Online">Mobile Banking</asp:ListItem>
                        <asp:ListItem>Card</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Chose Something" ForeColor="Red"></asp:RegularExpressionValidator>

                </div>
            </div>
        </div>


        <div class="row" id="Onlinepayment" visible="false" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Online payment System</h3>
                </div>
                <div class="panel-body text-center">
                    <a href="https://payment.bkash.com/redirect/tokenized/?paymentID=TR0000lmbSUwl1689494197448&hash=_UrUVMCdVarNRNv2SDPe1voZGRmGswXn8-r5_Lir*Q(5cqVkEFxyO02*ABygw0FKiImpWGtNI8mCghynqKurMBrLJs()nwREGKCW1689494197607&mode=0000&apiVersion=v1.2.0-beta&wxvNoHistory=true">
                        <img src="img/bkash.png" style="height: 152px; width: 209px" />
                    </a>&nbsp;

                   

                    <a href="https://payment.mynagad.com:30000/check-out/auth/account/MDcxNzE4MTkxNzk5MS42ODMyMjkxOTA2MTUzOTkuMjMwNzE3OTA5MDAwMDE5MDg0MTAuM2FmZGM5YjE5ZjQxODEwY2Y1ZGE=">
                        <img src="img/nogod.png" style="height: 152px; width: 209px" />
                    </a>&nbsp;

                   

                    <a href="https://ecom.dutchbanglabank.com/ecomm2/ClientHandler?card_type=6&trans_id=OV9UJ9KTWO23giFLrQ52C4pBWwY%3D">
                        <img src="img/rocket.png" style="height: 152px; width: 209px" />
                    </a>

                </div>
            </div>
        </div>


        <div class="row" id="paymentMode" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Card Details For Payment</h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCardType" runat="server" Text="Select Your Card" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlCardType" runat="server" class="form-control input-sm floatlabel" CausesValidation="True" ValidationGroup="vgRegister">
                                <asp:ListItem Value="0" Text="--Select Card--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Credit Card"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Debit Card"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCardType" Display="None" ID="rfvcardtype" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Card Type is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBankName" runat="server" Text="Select Bank" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlBank" runat="server" class="form-control input-sm floatlabel" ValidationGroup="vgRegister">
                                <asp:ListItem Value="0" Text="--Select Bank--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="State Bank Of Bangladesh"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Bank Of Bangladesh"></asp:ListItem>
                                <asp:ListItem Value="3" Text="IDLC Bank"></asp:ListItem>
                                <asp:ListItem Value="4" Text="HDFC Bank"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Grameen Bank"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBank" Display="None" ID="rfVbank" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Bank Name is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="3 Digit CVV Code" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCode" runat="server" class="form-control input-sm floatlabel" ValidationGroup="vgRegister" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCode" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="CVV Code is required." />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCode" ErrorMessage="only 3 digit" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9]" ValidationGroup="vgRegister"></asp:RegularExpressionValidator>
                            <br />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Card No" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control input-sm floatlabel"  ValidationGroup="vgRegister" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCardNo" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Card No  is required." />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Only 16 digit" ControlToValidate="txtCardNo" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" ValidationGroup="vgRegister"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Make Payment" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister" CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
