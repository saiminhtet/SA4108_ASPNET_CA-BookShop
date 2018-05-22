<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="Book_Shop.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:ListView ID="lvbooklist" runat="server"
                        DataKeyNames="BookID" GroupItemCount="4"
                        ItemType="Book_Shop.Models.BookList" SelectMethod="GetBooksList" OnItemCommand="lvbooklist_ItemCommand">
                        <EmptyDataTemplate>
                            <table>
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <a href="Details.aspx?isbn=<%#:Item.ISBN%>">

                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"images/" + Item.ISBN + ".jpg"%>' />
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="Details.aspx?isbn=<%#:Item.ISBN%>">
                                                <span>
                                                    <%#:Item.Title%>                                                    
                                                </span>
                                            </a>
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text='<%#Item.Author%>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%#"Category: "+ Item.CategoryName.ToUpper()%>'></asp:Label>
                                            <br />
                                            <span>
                                                <b>Price: </b><%#:String.Format("{0:c}", Item.Price)%>
                                            </span>
                                            <br />
                                        </td>
                                         
                                    </tr>
                                    <tr>
                                        <td class="active">
                                            <asp:LinkButton ID="btnAddtoCart" ClientIDMode="AutoID" CssClass="btn btn-info btn-xs" CommandName="AddToCart" runat="server" CausesValidation="false" CommandArgument='<%#Eval("BookID")%>'>
                                            Add To Cart</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                </p>
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                                <tr id="groupPlaceholder"></tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                            <asp:DataPager runat="server" ID="lvbookpager" PagedControlID="lvbooklist" class="btn-group btn-group-sm" PageSize="12">
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
                        </LayoutTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>
