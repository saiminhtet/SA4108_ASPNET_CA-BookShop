<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Book_Shop.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style43 {
            width: 146px;
        }
        .auto-style44 {
            font-size: x-large;
            text-decoration: underline;
        }
        .auto-style54 {
            width: 160px;
            text-align: left;
        }
        .auto-style55 {
            text-decoration: underline;
        }
        .auto-style56 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="auto-style1">
        <div>
            <span class="auto-style44"><strong>
            <br />
            SMARTERBOOKS MANAGEMENT CONSOLE</strong></span><br />
            <br />
            <br />
            <asp:Button ID="Add_Btn" runat="server" Text="Add New Book" Height="70px" Width="300px" OnClick="Add_Btn_Click" />
            <asp:Button ID="MngBook_Btn" runat="server" Text="Manage Books" Height="70px" Width="300px" OnClick="MngBook_Btn_Click" />
            <asp:Button ID="MngPromo_Btn" runat="server" Text="Manage Promotions" Height="70px" Width="300px" OnClick="MngPromo_Btn_Click" />
        </div>
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table id="Table1" class="auto-style56">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label12" runat="server" Text="Book Image:"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="225px" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                        <asp:TextBox ID="TextBox12" runat="server">Enter a (string)</asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="CategoryID:"></asp:Label>
                        <asp:TextBox ID="TextBox13" runat="server">Enter an (int)</asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="ISBN:"></asp:Label>
                        <asp:TextBox ID="TextBox14" runat="server">Enter an (int)</asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Author:"></asp:Label>
                        <asp:TextBox ID="TextBox15" runat="server">Enter a (string)</asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label6" runat="server" Text="Stock:"></asp:Label>
                        <asp:TextBox ID="TextBox16" runat="server">Enter an (int)</asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label11" runat="server" Text="Price:"></asp:Label>
                        <asp:TextBox ID="TextBox21" runat="server">Enter a (decimal)</asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Height="60px" OnClick="Button1_Click" Text="Add Book" Width="120px" />
                    </td>
                </tr>
            </table>

        </ContentTemplate>
        </asp:UpdatePanel>
        <div class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" OnRowDeleting="OnRowDeleting" OnRowEditing="OnRowEditing" OnRowCancelingEdit="
                            OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" DataKeyNames="BookID">
                            <Columns>
                                <asp:TemplateField HeaderText="BookID" SortExpression="BookID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("BookID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Author" SortExpression="Author">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <image height="120" src='images/<%# Eval("ISBN") %>.jpg' width="90" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
            </div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table id="Table2" align="center" style="width:100%;">
                    <tr>
                        <td class="auto-style54"><strong>
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style55" Text="Apply Discount By:"></asp:Label>
                            </strong></td>
                        <td class="auto-style43">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem>Title</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                                <asp:ListItem>Author</asp:ListItem>
                                <asp:ListItem>Storewide</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Width="100%"></asp:ListBox>
                        </td>
                    </tr>
                </table>
                <table id="Table3" align="center" style="width:50%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label7" runat="server" Text="Start Date:"></asp:Label>
                            <asp:TextBox ID="TextBox17" runat="server" TextMode="DateTime"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <asp:Label ID="Label8" runat="server" Text="End Date:"></asp:Label>
                            <asp:TextBox ID="TextBox18" runat="server" TextMode="DateTime"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <asp:Label ID="Label10" runat="server" Text="Discount %:"></asp:Label>
                            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Height="60px" OnClick="Button3_Click" Text="Add Discount" Width="120px" />
                        </td>
                    </tr>
                </table>
                        <div class="auto-style1">
                            <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center">
                            </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    </body>
</html>
