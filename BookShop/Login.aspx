<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bookshop.Login1" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Book_Shop.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <%-- </form>
</body>
</html>--%>
    <div>
        <br />
        <br />
        <asp:Label ID="lbl_Title" runat="server" Text="Welcome, please log in" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Style="margin-left: 500px"></asp:Label><br /><br />
        <asp:Label ID="lbl_EmailAdress" runat="server" Text="Email Address" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp
        <asp:TextBox ID="tbx_EmailAdress" runat="server" Width="167px" Height="25px" Style="margin-left: 50px"></asp:TextBox><br /><br />
        <asp:Label ID="lbl_Password" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp
        <asp:TextBox ID="tbx_Password" runat="server" Width="167px" Height="25px" TextMode="Password" Style="margin-left: 82px"></asp:TextBox><br /><br />
        <asp:Button ID="btn_Login" runat="server" Text="Log In" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px" OnClick="btn_Login_Click"/><br /><br />
        <asp:Button ID="btn_RecoverPassword" runat="server" Style="margin-left: 450px" Text="Recover Password" Width="190px" OnClick="btn_RecoverPassword_Click" Font-Names="Arial" Font-Size="Medium" />&nbsp
        <asp:Button ID="btn_Signup" runat="server" Text="Create New Account" OnClick="btn_Signup_Click" Width="190px" Font-Names="Arial" Font-Size="Medium" /><br /><br />
        <asp:Label ID="lbl_Status" runat="server" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>
    </div>
   <%-- </form>
</body>
</html>--%>
</asp:Content>
