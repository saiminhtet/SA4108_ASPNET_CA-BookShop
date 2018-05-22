<%@ Page 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="Home.aspx.cs" 
    Inherits="Book_Shop.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SmarterBooks: Home</title>
    <script>
        function tbxClear(str) {
            if (document.getElementById(str).value === "Enter title, author or category to search.") { document.getElementById(str).value = ""; }
        }
        function tbxSearchText(str) {
            if (document.getElementById(str).value === "") { document.getElementById(str).value = "Enter title, author or category to search."; }
        }
    </script>
    <style type="text/css">
        .container {
            margin:0px;
            border:none;
            padding:0px;
        }
        .navbar-container {
            min-width:800px;
            width:100%;
            align-content:center;
            box-shadow: 0px 4px 10px -2px hsl(0, 0%, 80%);
        }
        .td1 {
            width:385px;
        }
        .td2 {
            text-align:left;
            width:300px;
        }
        .td3 {
            width:200px;
        }
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

        #imgMainBrand {
            padding-top:5px;
            height:50px;
            display:inline-block;
        }
        #tbxSearch {
            height:30px;
            border-radius:20px;
            width:92%;
            padding-left: 10px;
            vertical-align:central;
            font-family:'Roboto Condensed';
        }
        #imgPowerSearch {
            height:30px;
            margin-top:1px;
            display:inline-block;
        }
        #imgCart {
            height:30px;
            margin-top:1px;
            display:inline-block;
        }
        #imgBanner {
            width:100%;
            clip: rect(400px, 0, 400px, 0);
            box-shadow: 0px 2px 8px 0px hsl(0, 0%, 50%);
        }
    </style>
</head>
<body class="container">
    <form class="navbar" id="frmHeaderMenu" runat="server">
        <asp:ScriptManager ID="scriptMgr" runat="server"></asp:ScriptManager>
        <table class="navbar-container">
            <tr>
                <td class="td1"><asp:ImageButton ID="imgMainBrand" runat="server" ImageUrl="~/resources/brand/ext.png"/></td>
                <td class="td2"><asp:TextBox ID="tbxSearch" placeholder="Enter title, author or category to search."  runat="server" Text=""></asp:TextBox></td>
                <td><asp:ImageButton runat="server" ID="imgPowerSearch" ImageUrl="~/resources/symbol/magnifying_glass_blue.png" OnClick="imgPowerSearch_Click"/></td>
                <td><asp:ImageButton runat="server" ID="imgCart" ImageUrl="~/resources/symbol/shopping-cart-blue.png" OnClick="imgCart_Click"/></td>
                <td class="td3">
                    <asp:UpdatePanel runat="server" ID="acctPanel">
                        <ContentTemplate>
                            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                            <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" />
                            <asp:Button ID="btnUser" runat="server" Text="Name" OnClick="btnUser_Click"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:Image ID="imgBanner" runat="server" ImageUrl="~/resources/image/knowledge-is-power-banner.jpg"/>
        </div>
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
    </form>
</body>
</html>
