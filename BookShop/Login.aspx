<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bookshop.Login1" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Book_Shop.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">--%>
    <div>
        <asp:Login ID="lgn" runat="server" OnAuthenticate="Login11_Authenticate"></asp:Login>
    </div>
    <asp:Button ID="btn_RecoverPassword" runat="server" Text="Recover Password" Width="147px" OnClick="btn_RecoverPassword_Click" />&nbsp
        <asp:Button ID="btn_Signup" runat="server" Text="Create New Account" OnClick="btn_Signup_Click" Width="185px" />
   <%-- </form>
</body>
</html>--%>
</asp:Content>
