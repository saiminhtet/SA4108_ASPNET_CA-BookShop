<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Book_Shop.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="imgBook" runat="server" width="90" height="120"/>
            <br />
            <asp:Label ID="lblBname" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblBauthor" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblOprice" runat="server"></asp:Label>
            <br />
            
            <br />
            <asp:Label ID="lblStock" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txbCopies" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddCart" runat="server" Text="Add to Cart" OnClick="btnAddCart_Click" />
            <br />
            
            <br />
            <asp:Label ID="lblBookInfo" runat="server" Text="Book Info"></asp:Label>
            <br/>
            <table>
                <tr>
                    <td>ISBN</td>
                    <td><asp:Label ID="lblIsbn" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><asp:Label ID="lblCategory" runat="server" /></td>
                </tr>
            </table>
            <br/>
            <asp:Label ID="Label1" runat="server" Text="Other Books By This Author"></asp:Label>
            <br />
        <div style="align-items:center; padding-left:100px; padding-right:100px;">
        <table class="tblFeatured">
            <tr>
                <td class="f1">
                    <asp:ImageButton ID="f1Img" class="featuredImg" runat="server" OnClick="f1Img_Click"/><br />
                    <a id="f1Link" href='<%= "~/details?id=" + f1ISBN.Text %>'><asp:Label ID="f1Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f1Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f1Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f1Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Button ID="f1BtnBuy" runat="server" Text="Add to Cart" OnClick="f1BtnBuy_Click" /><br />
                    <asp:Label ID="f1ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f2Img" class="featuredImg" runat="server" OnClick="f2Img_Click"/><br />
                    <a id="f2Link" href='<%= "~/details?id=" + f2ISBN.Text %>'><asp:Label ID="f2Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f2Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f2Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f2Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Button ID="f2BtnBuy" runat="server" Text="Add to Cart" OnClick="f2BtnBuy_Click" /><br />
                    <asp:Label ID="f2ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f3Img" class="featuredImg" runat="server" OnClick="f3Img_Click"/><br />
                    <a id="f3Link" href='<%= "~/details?id=" + f3ISBN.Text %>'><asp:Label ID="f3Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f3Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f3Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f3Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Button ID="f3BtnBuy" runat="server" Text="Add to Cart" OnClick="f3BtnBuy_Click" /><br />
                    <asp:Label ID="f3ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f4Img" class="featuredImg" runat="server" OnClick="f4Img_Click"/><br />
                    <a id="f4Link" href='<%= "~/details?id=" + f4ISBN.Text %>'><asp:Label ID="f4Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f4Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f4Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f4Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Button ID="f4BtnBuy" runat="server" Text="Add to Cart" OnClick="f4BtnBuy_Click" /><br />
                    <asp:Label ID="f4ISBN" runat="server" Visible="false"></asp:Label>
                </td>
             </tr>
            </table>
            </div>
            <br />
            <br />
            <br/>
        </div>
    </form>
</body>
</html>
