<%@ Page 
    Title="Home" 
    Language="C#" 
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" 
    CodeBehind="Home.aspx.cs" 
    Inherits="Book_Shop.home" %>

<asp:Content ID="imageBanner" ContentPlaceHolderID="ImageBanner" runat="server">
    <style type="text/css"> 
        .full-width {
            width:100%;
            box-shadow: 0px 2px 8px 0px hsl(0, 0%, 50%);
        }
    </style>
        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/resources/image/knowledge-is-power-banner.jpg" cssclass="full-width"/>
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
            margin-left:10px;
            margin-right:10px;
            vertical-align:top;
            text-align:center;
            align-content:center;
        }
        .featuredImg {
            min-width:80px;
            max-width:150px;
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
        .footer-cell {
            width:300px; 
            text-align: left;
        }
        .footer-header {
            font-family:'SF Display';
            font-weight:800;
            font-size:14pt;
            text-align: left;
            padding-bottom:10px;
        }
    </style>
    <br />
    <div style="align-items:center; padding-left:100px; padding-right:100px;">
<%--        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="featuredPanel">
            <ContentTemplate>--%>
    <table class="tblFeatured">
        <tr>
            <td class="f1">
                <asp:ImageButton ID="f1Img" class="featuredImg" runat="server" OnClick="f1Img_Click"/><br />
                <a id="f1Link" href='<%= "~/details.aspx?isbn=" + f1ISBN.Text %>'><asp:Label ID="f1Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f1Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f1Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f1Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f1BtnBuy" runat="server" Text="Add to Cart" OnClick="f1BtnBuy_Click" /><br />
                <asp:Label ID="f1ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f2Img" class="featuredImg" runat="server" OnClick="f2Img_Click"/><br />
                <a id="f2Link" href='<%= "~/details.aspx?isbn=" + f2ISBN.Text %>'><asp:Label ID="f2Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f2Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f2Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f2Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f2BtnBuy" runat="server" Text="Add to Cart" OnClick="f2BtnBuy_Click" /><br />
                <asp:Label ID="f2ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f3Img" class="featuredImg" runat="server" OnClick="f3Img_Click"/><br />
                <a id="f3Link" href='<%= "~/details.aspx?isbn=" + f3ISBN.Text %>'><asp:Label ID="f3Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f3Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f3Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f3Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f3BtnBuy" runat="server" Text="Add to Cart" OnClick="f3BtnBuy_Click" /><br />
                <asp:Label ID="f3ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f4Img" class="featuredImg" runat="server" OnClick="f4Img_Click"/><br />
                <a id="f4Link" href='<%= "~/details.aspx?isbn=" + f4ISBN.Text %>'><asp:Label ID="f4Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f4Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f4Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f4Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f4BtnBuy" runat="server" Text="Add to Cart" OnClick="f4BtnBuy_Click" /><br />
                <asp:Label ID="f4ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f5Img" class="featuredImg" runat="server" OnClick="f5Img_Click"/><br />
                <a id="f5Link" href='<%= "~/details.aspx?isbn=" + f5ISBN.Text %>'><asp:Label ID="f5Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f5Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f5Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f5Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f5BtnBuy" runat="server" Text="Add to Cart" OnClick="f5BtnBuy_Click" /><br />
                <asp:Label ID="f5ISBN" runat="server" Visible="false"></asp:Label>
            </td>
            <td class="f1">
                <asp:ImageButton ID="f6Img" class="featuredImg" runat="server" OnClick="f6Img_Click"/><br />
                <a id="f6Link" href='<%= "~/details.aspx?isbn=" + f6ISBN.Text %>'><asp:Label ID="f6Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                <asp:Label ID="f6Author" class="featuredAuthor" runat="server"></asp:Label><br />
                <asp:Label ID="f6Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                <asp:Label ID="f6Price" class="featuredPrice" runat="server"></asp:Label><br />
                <asp:Button ID="f6BtnBuy" runat="server" Text="Add to Cart" OnClick="f6BtnBuy_Click" /><br />
                <asp:Label ID="f6ISBN" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
<%--        </ContentTemplate>
            </asp:UpdatePanel>--%>
    <br />
    <br />
    <div style="align-content:center; text-align:center;">
        <table  style="margin-left:auto; margin-right:auto;">
        <tr>
            <td class="footer-header" colspan="3">
                Done By: NUS ISS GDipSA46 Team 6
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Gao Yangyang
            </td>
            <td class="footer-cell">
                A0180493B
            </td>
            <td class="footer-cell">
                e0283979@u.nue.edu
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Hunasavally Virupaksha Dhanya
            </td>
            <td class="footer-cell">
                A0180525J
            </td>
            <td class="footer-cell">
                e0284011@u.nus.edu
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Jerome Kwek Li Ming
            </td>
            <td class="footer-cell">
                A0180495X
            </td>
            <td class="footer-cell">
                e0283981@u.nus.edu
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Sai Min Htet
            </td>
            <td class="footer-cell">
                A0180545E
            </td>
            <td class="footer-cell">
                e0284031@u.nus.edu
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Tang Shenqi
            </td>
            <td class="footer-cell">
                A0114523U
            </td>
            <td class="footer-cell">
                e0287130@u.nus.edu
            </td>
        </tr>
        <tr>
            <td class="footer-cell">
                Teong Hanlong
            </td>
            <td class="footer-cell">
                A0055905A
            </td>
            <td class="footer-cell">
                teong@u.nus.edu
            </td>
        </tr>
    </table>
    </div>
    </div>
</asp:Content>
