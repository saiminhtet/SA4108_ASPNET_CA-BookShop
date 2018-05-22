<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="Book_Shop.OrderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="lvorder">
        <LayoutTemplate>
            <table class="table text-info">
                <thead>
                    <th class="active">Book ID</th>
                    <th class="active">Book Title</th>
                    <th class="active">Qyantity</th>
                    <th class="active">Unit Price</th>

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
</asp:Content>
