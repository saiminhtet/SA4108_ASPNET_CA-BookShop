<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="BookShop.ChangePassword" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Book_Shop.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--   </form>
</body>
</html>--%>
    <div>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Welcome, please change password" Font-Names="Arial" Font-Size="Larger" Style="margin-left: 550px"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbl_Password" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_Password" runat="server" Style="margin-left: 180px" Width="167px" Height="25px"></asp:TextBox>
        &nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_Password" ForeColor="Red" ErrorMessage="Please fill old password"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lbl_NewPassword" runat="server" Text="New Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_NewPassword" runat="server" Style="margin-left: 108px" Width="167px" Height="25px"></asp:TextBox>
        &nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_NewPassword" ForeColor="Red" ErrorMessage="Please fill new password"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lbl_ConfirmPassword" runat="server" Text="Confirm Password" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label><asp:TextBox ID="tbx_ConfirmPassword" runat="server" Style="margin-left: 79px" Width="167px" Height="25px"></asp:TextBox>
        &nbsp<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbx_NewPassword" ControlToValidate="tbx_ConfirmPassword" ForeColor="Red" ErrorMessage="Password different, please try again"></asp:CompareValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="btn_Change" runat="server" Text="Change Password" OnClick="btn_Change_Click" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px" />&nbsp<asp:Button ID="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" Font-Names="Arial" Font-Size="Medium" />
        <br />
        <br />
        <asp:Label ID="lbl_Status" runat="server" Font-Names="Arial" Font-Size="Medium" Style="margin-left: 500px"></asp:Label>
    </div>
    <%--   </form>
</body>
</html>--%>

</asp:Content>
