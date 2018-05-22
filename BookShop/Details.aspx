<%@ Page 
    Title="Details" 
    Language="C#" 
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" 
    CodeBehind="Details.aspx.cs" 
    Inherits="Book_Shop.details" %>

<asp:Content ID="pageDetails" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <table>
                <tr><td><asp:Image ID="imgBook" runat="server"/></td>
                    <td><asp:Label ID="lblBname" runat="server"></asp:Label><br />
                        <asp:Label ID="lblBauthor" runat="server"></asp:Label><br />
                        <asp:Label ID="lblOprice" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblStock" runat="server"></asp:Label><br />
                        <asp:TextBox ID="txbCopies" runat="server"></asp:TextBox><br />
                        <asp:Button ID="btnAddCart" runat="server" Text="Add to Cart" OnClick="btnAddCart_Click" /><br />
                        <asp:Label ID="lblAddCartReminder" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblBookInfo" runat="server" Text="Book Info"></asp:Label>
            <br/>
            <table>
                <tr><td>ISBN</td>
                    <td><asp:Label ID="lblIsbn" runat="server"></asp:Label></td>
                </tr>
                <tr><td>Category</td>
                    <td><asp:Label ID="lblCategory" runat="server" /></td>
                </tr>
            </table>
            <br/>
            <asp:Label ID="Label1" runat="server" Text="Other Books By This Author"></asp:Label>
            <br />
        <div style="padding-left:100px; padding-right:100px;">
        <table class="tblFeatured">
            <tr>
                <td class="f1">
                    <asp:ImageButton ID="f1Img" class="featuredImg" runat="server" OnClick="f1Img_Click"/><br />
                    <a id="f1Link" href='<%= "~/details.aspx?isbn=" + f1ISBN.Text %>'><asp:Label ID="f1Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f1Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f1Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f1Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f1ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f2Img" class="featuredImg" runat="server" OnClick="f2Img_Click"/><br />
                    <a id="f2Link" href='<%= "~/details.aspx?isbn=" + f2ISBN.Text %>'><asp:Label ID="f2Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f2Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f2Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f2Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f2ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f3Img" class="featuredImg" runat="server" OnClick="f3Img_Click"/><br />
                    <a id="f3Link" href='<%= "~/details.aspx?isbn=" + f3ISBN.Text %>'><asp:Label ID="f3Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f3Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f3Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f3Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f3ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f4Img" class="featuredImg" runat="server" OnClick="f4Img_Click"/><br />
                    <a id="f4Link" href='<%= "~/details.aspx?isbn=" + f4ISBN.Text %>'><asp:Label ID="f4Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f4Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f4Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f4Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f4ISBN" runat="server" Visible="false"></asp:Label>
                </td>
             </tr>
            </table>
            </div>
            <br />
            <br />
            <br/>
        </div>

</asp:Content>