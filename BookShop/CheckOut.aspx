﻿<%@ Page Title="Check Out" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Book_Shop.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>CheckOut Orders</h1>
    <p></p>

    <asp:ListView runat="server" ID="lvorder">
        <LayoutTemplate>
            <table class="table table-hover">
                <thead>
                    <th class="danger">Book ID</th>
                    <th class="danger">Book Title</th>
                    <th class="danger">Quantity</th>
                    <th class="danger">Unit Price</th>

                    <tr>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </tr>
                </thead>
            </table>
            <%-- <div class="pagination" style="padding-left: 40%; padding-top: -10%">
                                        <asp:DataPager runat="server" ID="orderpager" PagedControlID="lvorder" class="btn-group btn-group-sm" PageSize="10">
                                            <Fields>
                                                <asp:NextPreviousPagerField PreviousPageText="<" ShowPreviousPageButton="true"
                                                    ShowFirstPageButton="true" ShowNextPageButton="false" FirstPageText="|<" ShowLastPageButton="false"
                                                    ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                                <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-success disabled" RenderNonBreakingSpacesBetweenControls="false"
                                                    NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                                                <asp:NextPreviousPagerField NextPageText=">" LastPageText=">|" ShowNextPageButton="true"
                                                    ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                                                    ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                                            </Fields>
                                        </asp:DataPager>
                                    </div>--%>
        </LayoutTemplate>
        <ItemTemplate>
            <tbody>
                <td class="active"><%#Eval("bkID")%></td>
                <td class="active"><%#Eval("bkTitle")%></td>
                <td class="active"><%#Eval("orderQty")%></td>
                <td class="active"><%#:String.Format("{0:c}",Eval("unitPrice"))%></td>


            </tbody>
        </ItemTemplate>
    </asp:ListView>
    <asp:Label ID="Total" runat="server" Text=""></asp:Label>
    <hr />
    <asp:LinkButton ID="btn_checkout" CssClass="btn btn-primary btn-lg " runat="server" data-toggle="modal" data-target="#myModal">
      <span class="glyphicon glyphicon-usd" aria-hidden="true"></span> PROCEED TO CHECKOUT</asp:LinkButton><br />
    <asp:LinkButton ID="btn_checkout_cardn0" CssClass="btn btn-primary btn-lg " runat="server" data-toggle="modal" data-target="#myModalselectcard">
      <span class="glyphicon glyphicon-usd" aria-hidden="true"></span> PROCEED TO CHECKOUT</asp:LinkButton>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
          <%--  <asp:UpdatePanel ID="upmodal" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                <ContentTemplate>--%>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Card Info</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="txt_holdername" class="control-label">Card Holder Name</label>
                                <asp:TextBox ID="txt_holdername" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_holdername" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="txt_card_no" class="control-label">Card Number</label>
                                <asp:TextBox ID="txt_card_no" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_card_no" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Enter CardNo"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <p class="col-md-4">
                                    <label for="ddlexpmonth" class="control-label">Expiration Month</label>
                                    <asp:DropDownList ID="ddlexpmonth" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlexpmonth" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Select Month"></asp:RequiredFieldValidator>
                                </p>

                                <p class="col-md-4">
                                    <label for="ddlexpyear" class="control-label">Expiration Year</label>
                                    <asp:DropDownList ID="ddlexpyear" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlexpyear" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Select Year"></asp:RequiredFieldValidator>
                                </p>

                                <p class="col-md-4">
                                    <label for="txt_cvc" class="control-label">CVV</label>
                                    <asp:TextBox ID="txt_cvc" runat="server" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_cvc" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Enter CVV"></asp:RequiredFieldValidator>
                                </p>

                            </div>
                            <br />
                            <hr />
                            <br />

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="btn_purchase" CssClass="btn btn-primary" runat="server" Text="Confirm" OnClick="btn_purchase_Click" />
                        </div>
                    </div>
               <%-- </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_checkout" />
                     <asp:AsyncPostBackTrigger ControlID="btn_purchase" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>
    </div>

    <div class="modal fade" id="myModalselectcard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <%--<asp:UpdatePanel ID="udpanelselectcard" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                <ContentTemplate>--%>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalselectcardLabel">Select Credit Card</h4>
                        </div>
                        <div class="modal-body">
                          
                            <div class="form-group">                                
                                <p class="col-md-4">
                                    <label for="RadioButtonListCCard" class="control-label">Select Credit Card</label>
                                    <asp:RadioButtonList ID="RadioButtonListCCard" runat="server" CssClass="radio-inline">
                                    </asp:RadioButtonList>
                                </p>
                            </div>
                            <br />
                              <p class="row">
                                    <p class="col-md-2">
                                    <asp:LinkButton ID="lbtnaddnewcard" CssClass="btn btn-primary btn-default " runat="server" data-toggle="modal" data-target="#myModal" data-dismiss="modal"> Add New Card</asp:LinkButton>       
                                    </p>                                      
                                    <p>
                                    </p>
                                    <br />
                                    <hr />
                                    <br />
                                    <p>
                                    </p>
                                </p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="btn_selectcard" CssClass="btn btn-primary" runat="server" Text="Confirm" OnClick="btnbtn_selectcard_Click" OnClientClick="return true;" />         
                        </div>
                    </div>
                <%--</ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_checkout" />
                    <asp:AsyncPostBackTrigger ControlID="lbtnaddnewcard" />

                </Triggers>
            </asp:UpdatePanel>--%>
        </div>
    </div>


</asp:Content>
