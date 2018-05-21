<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="BookShop.MyCart" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="Book_Shop.MyCart" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SmarterBooks: Cart</title>
</head>
<body>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <div>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView ID="gvCart" runat="server" OnRowDataBound="gvCart_RowDataBound" AutoGenerateColumns="False" DataKeyNames="bkID"
                        OnRowDeleting="OnRowDeleting"
                        OnRowEditing="OnRowEditing"
                        OnRowCancelingEdit="OnRowCancelingEdit"
                        OnRowUpdating="OnRowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="BookID" SortExpression="BookID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("bkID") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("bkTitle") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("orderQty") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("unitPrice") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Content>
 <%--   </form>
</body>
</html>--%>
