<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Bookshop.Signup" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Book_Shop.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--    </form>
</body>
</html>--%>
    <div>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Welcome, please sign up" Font-Names="Arial" Font-Size="Larger" Style="margin-left: 550px"></asp:Label><br />
        <br />
        <asp:Label ID="lbl_Username" runat="server" Text="Username" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_Username" runat="server" Width="167px" Height="25px" Style="margin-left: 117px"></asp:TextBox>&nbsp
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_Username" ForeColor="Red" ErrorMessage="Please fill username"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lbl_Password" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_Password" runat="server" Width="167px" Height="25px" Style="margin-left: 118px"></asp:TextBox>&nbsp
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_Password" ForeColor="Red" ErrorMessage="Please fill password"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lbl_PasswordConformation" runat="server" Text="Confirm Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_PasswordConfirmation" runat="server" Width="167px" Height="25px" Style="margin-left: 43px"></asp:TextBox>&nbsp
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbx_Password" ControlToValidate="tbx_PasswordConfirmation" ForeColor="Red" ErrorMessage="Password not the same, please try again"></asp:CompareValidator><br />
        <asp:Label ID="lbl_Email" runat="server" Text="E-mail" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_Email" runat="server" Width="167px" Height="25px" Style="margin-left: 151px"></asp:TextBox>&nbsp
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="tbx_Email"
                ValidationExpression="^\S+@\S+$" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="btn_Create" runat="server" Text="Create User" OnClick="Button1_Click" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 501px" />&nbsp<asp:Button ID="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 23px" Width="102px" />&nbsp
        <asp:Button ID="Button1" runat="server" Font-Names="Arial" Font-Size="Medium" Text="Login" OnClick="Button1_Click1" />
        <br />
        <br />
        <asp:Label ID="lbl_Status" runat="server" Style="margin-left: 500px" Font-Names="Arial" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </div>
    <%--    </form>
</body>
</html>--%>
</asp:Content>
