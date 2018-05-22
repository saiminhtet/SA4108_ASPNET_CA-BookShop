<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Bookshop.RecoverPassword" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Book_Shop.RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>

<%-- </form>
</body>
</html>--%>
        <div>
            <br />
            <asp:Label ID="lbl_Email" runat="server" Text="Email Address"></asp:Label>&nbsp<asp:TextBox ID="tbx_Email" runat="server"></asp:TextBox><br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />&nbsp
            <asp:Button ID="btn_GoToLogin" runat="server" Text="Login" OnClick="btn_GoToLogin_Click" />
            <br /><asp:Label ID="lbl_Status" runat="server"></asp:Label>
        </div>
<%-- </form>
</body>
</html>--%>
</asp:Content>
