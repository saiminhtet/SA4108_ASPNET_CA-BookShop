<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Bookshop.RecoverPassword" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Book_Shop.RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>--%>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_Title" runat="server" Text="Please fill up email address to receive new password"></asp:Label><br />
            <asp:Label ID="lbl_Email" runat="server" Text="Email Address"></asp:Label>&nbsp<asp:TextBox ID="tbx_Email" runat="server"></asp:TextBox><br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
        </div>
        <%-- </form>
</body>
</html>--%>
</asp:Content>
