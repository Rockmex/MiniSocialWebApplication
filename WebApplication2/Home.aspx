<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Form1">
        <div class="rg_layout">
		    <div class="rg_center">
                <div class="rg_form">
                    <div class="word">
                    <table>
                        <tr>
                            <td><asp:TextBox ID="Search_target" runat="server"></asp:TextBox></td>
                            <td><asp:Button ID="Search_Button" runat="server" Text="Search" onclick="Button_Click_Search" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="td_center"><h3>Weclome</h3></td>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_UserName" runat="server" ></asp:Label></td>
                        </tr>                           
                    </table>
                        <table id="Table_PostArea">
                            <tr>
                                <td><asp:TextBox ID="Post_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox></td>
                                <td><asp:Button ID="Post_Button" runat="server" Text="Post" OnClick="Button_Click_Post"/></td>
                            </tr>
                        </table>
                        <br/>
                        <asp:DataList ID="Datalist_Post" DataKeyField="PostId" runat="server">
                            <ItemTemplate>
                            <table style="width:300px" id="Table_PostContent">
                                <tr>
                                    <td>
                                        <asp:Image ID="Profile_Image" src="./img/my.jpg" runat="server" width="50px" height="50px" />  <!-- src change to ImageUrl = Eval Later(Future might use senderId) -->
                                    </td>
                                    <td valign="top">
                                        <%#Eval("content")%>   <!-- User Message Here -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%#Eval("Fname")%><%#Eval("Lname")%>  <!-- User Name Here -->
                                    </td>
                                    <td style="text-align: right">
                                        <asp:LinkButton ID="Like_Button" runat="server" Text="Like" OnCommand="Button_Click_Like" CommandArgument='<%# Eval("PostId") %>' />
                                        <asp:LinkButton ID="CommentDisplay_Button" runat="server" Text="Comment" OnClick="Button_Click_Comment_Display" CommandArgument='<%# Eval("PostId") %>'/>
                                        <asp:LinkButton ID="Share_Button" runat="server" Text="Share" OnClick="Button_Click_Share" CommandArgument='<%# Eval("PostId") %>'/>
                                    </td>
                                </tr>
                            </table>
                                <table id="Table_CommentArea">
                                    <tr>
                                        <td><asp:TextBox ID="Comment_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox></td>
                                        <td><asp:Button ID="Comment_Button" runat="server" Text="Comment" OnClick="Button_Click_Comment" CommandArgument='<%# Eval("PostId") %>'/></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>