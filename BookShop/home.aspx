<%@ Page 
    Title="Home" 
    Language="C#" 
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" 
    CodeBehind="Home.aspx.cs" 
    Inherits="Book_Shop.home" %>

<asp:Content ID="imageBanner" ContentPlaceHolderID="ImageBanner" runat="server">
    <style type="text/css">
        #imageBanner {
            text-align:center; 
            width:100%; 
            margin-left:auto; 
            margin-right:auto; 
        }    
        #imgBanner {
            width:100%;
            clip: rect(400px, 0, 400px, 0);
            box-shadow: 0px 2px 8px 0px hsl(0, 0%, 50%);
        }
    </style>
    <br />
    <asp:Image ID="imgBanner" runat="server" ImageUrl="~/resources/image/knowledge-is-power-banner.jpg"/>
</asp:Content>

<asp:Content ID="tblFeaturedCollection" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .tblFeatured {
            min-width = 800px;
            margin-left:auto;
            margin-right:auto;
            text-align: center;
        }
        .f1 {
            min-width:100px;
            max-width:150px;
            padding: 0 20px 0 20px;
            vertical-align:top;
            text-align:center;
        }
        .featuredImg {
            min-width:100px;
            max-width:150px;
            
            margin-left:auto;
            margin-right:auto;
        }
        .featuredTitle {
            font-family:'Arial Narrow';
            font-weight: 600;
            font-size:14pt;
        }
        .featuredAuthor {
            font-family:'SF Display';
            font-weight: 200;
            font-size:12pt;
        }
        .featuredCat {
            font-family:'SF Display';
            font-weight: 100;
            font-style:oblique;
            font-size:10pt;
        }
        .featuredPrice {
            font-family:'SF Display';
            font-weight: 800;
            font-size:14pt;
            color:#4286f5;
        }
    </style>
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
            <td class="f1">
                <asp:ImageButton ID="f5Img" class="featuredImg" runat="server" OnClick="f5Img_Click"/><br />
                <a id="f5Link" href='<%= "~/details?id=" + f5ISBN.Text %>'><asp:Label ID="f5Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f5Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f5Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f5Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f5BtnBuy" runat="server" Text="Add to Cart" OnClick="f5BtnBuy_Click" /><br />
                <asp:Label ID="f5ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f6Img" class="featuredImg" runat="server" OnClick="f6Img_Click"/><br />
                <a id="f6Link" href='<%= "~/details?id=" + f6ISBN.Text %>'><asp:Label ID="f6Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f6Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f6Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f6Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f6BtnBuy" runat="server" Text="Add to Cart" OnClick="f6BtnBuy_Click" /><br />
                <asp:Label ID="f6ISBN" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
