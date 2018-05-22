<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Book_Shop.session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Title:<asp:TextBox ID="tbx_Title" runat="server"></asp:TextBox>
            <br />
            <br />
            First Name:<asp:TextBox ID="tbx_FirstName" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name:<asp:TextBox ID="tbx_LastName" runat="server"></asp:TextBox>
            <br />
            <br />
            Email Address:<asp:TextBox ID="tbx_EmailAddress" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            Shipping Address:<asp:TextBox ID="tbx_ShippingAddress" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="Update" />
            &nbsp;<asp:Button ID="btn_ChangePassword" runat="server" OnClick="btn_ChangePassword_Click" Text="Change Password" />
            <br />
            <br />
            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
