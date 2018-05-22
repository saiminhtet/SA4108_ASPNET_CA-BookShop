<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="Book_Shop.OrderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Shipping Information</h3>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Shipping Address: "></asp:Label></td>
            <td><asp:Label ID="lblshippingaddress" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Customer Name: "></asp:Label></td>
            <td><asp:Label ID="lblcustname" runat="server" Text=""></asp:Label></td>
            
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Email Address: "></asp:Label></td>
            <td><asp:Label ID="lblemail" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Contact: "></asp:Label></td>
            <td><asp:Label ID="Label5" runat="server" Text="+658755443"></asp:Label></td>
        </tr>

    </table>
    
    <hr />
    <h3>Order Items</h3>
    <asp:ListView runat="server" ID="lvorder">
        <LayoutTemplate>
            <table class="table text-info">
                <thead>
                    <th class="active">Book ID</th>
                    <th class="active">Book Title</th>
                    <th class="active">Quantity</th>
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
    <asp:LinkButton ID="btn_order" CssClass="btn btn-primary btn-lg " runat="server">
      <span class="glyphicon glyphicon-usd" aria-hidden="true"></span> ORDER</asp:LinkButton><br />
</asp:Content>
