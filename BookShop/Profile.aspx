<%@ Page Language="C#" Title="Change Password" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Book_Shop.session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <br />    
    <div style="font-size:medium">
            &nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp<asp:Label ID="lbl_EmailAddress" runat="server"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Name:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbx_UserName" runat="server" Style="margin-left: 28px" Width="167px" Height="25px"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Title:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="tbx_Title" runat="server" Width="167px" Height="25px" Style="margin-left: 89px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name:</strong><asp:TextBox ID="tbx_FirstName" runat="server" Width="167px" Height="25px" Style="margin-left: 126px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last Name:</strong><asp:TextBox ID="tbx_LastName" runat="server" Width="167px" Height="25px" Style="margin-left: 126px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shipping Address:</strong><asp:TextBox ID="tbx_ShippingAddress" runat="server" Width="167px" Height="25px" Style="margin-left: 70px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="Update" Font-Names="Arial" Font-Size="Medium" />
            &nbsp;<asp:Button ID="btn_ChangePassword" runat="server" OnClick="btn_ChangePassword_Click" Text="Change Password" Font-Names="Arial" Font-Size="Medium" />
            <asp:Button ID="btnHome" runat="server"  Text="Back to Home" OnClick="btnHome_Click" Font-Names="Arial" Font-Size="Medium" />
            <br />
            <br />
            <br />
        </div>
</asp:Content>
