<%@ Page 
    Title="Details" 
    Language="C#" 
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" 
    CodeBehind="Details.aspx.cs" 
    Inherits="Book_Shop.details" %>

<asp:Content ID="pageDetails" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .td11 {
            min-width:100px;
            width: 200px;
            text-align:left;
            padding-left:0px;        
            margin-left:0px;
        }
        .td21 {
            min-width:150px;
            width:300px;
            padding:20px;
            text-align:left;
        }
        .td31 {
            min-width:150px;
            width:150px;
            padding:20px;
            text-align:center;
        }
        .c1 {
            width: 150px;
            text-align:center;
            padding:0px;
            margin:0px;
        }
        .tblLeft {
            text-align:left;
            align-content:flex-start;
            margin-left:0px;
            vertical-align:top;
        }
        .f1 {
            min-width:100px;
            max-width:250px;
            margin-left:10px;
            margin-right:10px;
            vertical-align:top;
            text-align:center;
            margin-left:50px;
            margin-right:50px;
        }
        .auto-style1 {
            width: 100%;
        }
        #imgBook {
            text-align:center;
            margin-left:auto;
            width:100%;
        }
        .l1 {
            width:300px;
        }
    </style>
        <div>
            <table>
                <tr style="height:300px;"><td class="td11"><asp:Image ID="imgBook" runat="server" ImageAlign="Left"/></td>
                    <td class="td21"><asp:Label ID="lblBname" runat="server"></asp:Label><br />
                        <asp:Label ID="lblBauthor" runat="server"></asp:Label><br />
                        <asp:Label ID="lblOprice" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblStock" runat="server"></asp:Label><br />
                        <asp:TextBox cssClass="c1" ID="txbCopies" runat="server"></asp:TextBox><br />
                        <asp:Button cssClass="c1" ID="btnAddCart" runat="server" Text="Add to Cart" OnClick="btnAddCart_Click" /><br />
                        <asp:Label ID="lblAddCartReminder" runat="server" ></asp:Label>
                    </td>
                    <td class="td31">
                        &nbsp;</td>
                </tr>
                <tr><td class="td11" colspan="2" rowspan="2">
                    <div style="text-align:left; padding-left:40px; font-size:14pt; font-weight:800; padding-bottom:10px;"><asp:Label ID="lblBookInfo" runat="server" Text="Book Info"></asp:Label></div>
                    
                    <table class="auto-style1">
                        <tr>
                            <td style="padding-left:40px; width: 150px;"><b>ISBN</b></td>
                            <td><asp:Label ID="lblIsbn" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="padding-left:40px; width: 150px;"><b>Category</b></td>
                            <td><asp:Label ID="lblCategory" runat="server" /></td>
                        </tr>
                    </table>
                    </td>
                    <td class="td31"></td>
                </tr>
                <tr>
                    <td class="td31">&nbsp;</td>
                </tr>
                <tr><td class="td11" colspan="3" style="text-align:left; padding-top:40px; padding-left:40px; font-size:14pt; font-weight:800; padding-bottom:20px;"><asp:Label CssClass="l1" ID="Label1" runat="server" Text="Other Books By This Author"></asp:Label></td>
                </tr>
                
                <tr><td class="td11" colspan="3" style="padding-left:40px;">
        <table class="tblLeft">
            <tr>
                <td class="f1">
                    <asp:ImageButton ID="f1Img" class="featuredImg" runat="server" OnClick="f1Img_Click"/><br />
                    <a id="f1Link" href='<%= "details.aspx?isbn=" + f1ISBN.Text %>'><asp:Label ID="f1Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f1Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f1Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f1Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f1ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f2Img" class="featuredImg" runat="server" OnClick="f2Img_Click"/><br />
                    <a id="f2Link" href='<%= "details.aspx?isbn=" + f2ISBN.Text %>'><asp:Label ID="f2Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f2Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f2Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f2Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f2ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f3Img" class="featuredImg" runat="server" OnClick="f3Img_Click"/><br />
                    <a id="f3Link" href='<%= "details.aspx?isbn=" + f3ISBN.Text %>'><asp:Label ID="f3Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f3Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f3Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f3Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f3ISBN" runat="server" Visible="false"></asp:Label>
                </td>
                <td class="f1">
                    <asp:ImageButton ID="f4Img" class="featuredImg" runat="server" OnClick="f4Img_Click"/><br />
                    <a id="f4Link" href='<%= "details.aspx?isbn=" + f4ISBN.Text %>'><asp:Label ID="f4Title" class="featuredTitle" runat="server"></asp:Label><br /></a>
                    <asp:Label ID="f4Author" class="featuredAuthor" runat="server"></asp:Label><br />
                    <asp:Label ID="f4Cat" class="featuredCat" runat="server"></asp:Label><br /><br />
                    <asp:Label ID="f4Price" class="featuredPrice" runat="server"></asp:Label><br />
                    <asp:Label ID="f4ISBN" runat="server" Visible="false"></asp:Label>
                </td>
             </tr>
        </table>
                    </td>
                </tr>
                
            </table>
            
            <br />
        <div>
        </div>
    </div>
</asp:Content>