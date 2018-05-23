<%@ Page Language="C#" Title="Change Password" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Book_Shop.session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <br />    
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
            <asp:Button ID="btnHome" runat="server"  Text="Back to Home" OnClick="btnHome_Click" />
            <br />
            <br />
            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
            <br />
        </div>
</asp:Content>
