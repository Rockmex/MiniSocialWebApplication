<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChatRoom.aspx.cs" Inherits="WebApplication2.ChatRoom1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/chatroom.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="Form1">
        <div class="chatbox">
            <asp:Panel CssClass="panel" runat="server">
                <h2><asp:Label runat="server" ID="label_name"></asp:Label></h2>
                <div class="pre-scrollable datalist">
                    <asp:DataList ID="datalist1" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatLayout="Table">
                        <ItemTemplate>
                            <div style="display:inline-block">
                                <div class="<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "sender-image" : "receiver-image" %>" >
                                    <asp:Image ID="Post_Image" runat="server" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' CssClass="round-image" Height="50px" Width="50px" />
                                </div>
                                <div class="<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "SenderClass" : "ReceiverClass" %> MainChatListClass">
                                    <asp:Label ID="label1" runat="server" Text='<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "You: " : Eval("Fname")+": " %>'></asp:Label>
                                    <asp:Label ID="label2" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </asp:Panel>
            <div class="chat-textbox">
                <table>
                    <tr>
                        <td style="width: 176%"><asp:TextBox ID="MessageBox" runat="server" style="width: 90%;"></asp:TextBox></td>
                        <td><asp:Button ID="Button_Send" runat="server" Text="Send" onclick="Button_Click_Send"/></td>
                    </tr>                         
                </table>
            </div>
        </div>
         <div class="memberlist">
             <asp:Panel runat="server">
                <h2><asp:Label ID="Label_MemberList" Text="Member List" runat="server" /></h2>
                <asp:GridView ID="Gridview_MemberList" CssClass="membertable" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="MemberId" HeaderText="Member Id" Visible="true" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button_Remove_Member" runat="server" Text="Remove" CommandArgument='<%# Eval("MemberId") %>' OnCommand="Button_Click_RemoveMember" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="button-layout">
                    <asp:Button ID="Button_Add_New_Member" runat="server" Text="Add" OnClick="Button_Click_AddNewMember" />
                    <asp:Button ID="Button_Drop_Room" runat="server" Text="Delete Room" OnClick="Button_Click_RemoveRoom" />
                </div>
             </asp:Panel>
         </div>
    </div>
</asp:Content>
