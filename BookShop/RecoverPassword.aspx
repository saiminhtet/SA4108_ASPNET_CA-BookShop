<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Bookshop.RecoverPassword" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Book_Shop.RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>

<%-- </form>
</body>
</html>--%>
        <div>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Text="Recover Password" Style="margin-left: 500px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lbl_Email" runat="server" Text="Email Address" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px"></asp:Label>&nbsp<asp:TextBox ID="tbx_Email" runat="server" Width="167px" Height="25px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="tbx_Email"
                ValidationExpression="^\S+@\S+$" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 450px" Width="100px"/>&nbsp
            <asp:Button ID="btn_GoToLogin" runat="server" Text="Login" OnClick="btn_GoToLogin_Click" Font-Names="Arial" Font-Size="Medium" CausesValidation="False" Style="margin-left: 133px" Width="100px"/>
            <br />
            <br /><asp:Label ID="lbl_Status" runat="server" Style="margin-left: 450px"></asp:Label>
            <br />
        </div>
<%-- </form>
</body>
</html>--%>
</asp:Content>
