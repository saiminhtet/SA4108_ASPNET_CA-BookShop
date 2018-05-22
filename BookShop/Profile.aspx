<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Book_Shop.session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Title:<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Mr</asp:ListItem>
                <asp:ListItem>Ms</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            First Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Email Address:<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Shipping Address:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Card Details<br />
            <br />
            Full Name:
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Card Number:<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Expiry Date:<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="Update" />
            <br />
            <br />
            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
