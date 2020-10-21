<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChatRoom.aspx.cs" Inherits="WebApplication2.ChatRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rg_layout">
		    <div class="rg_center">
                <div class="rg_form">
                    <div class="word">
                    <table style="float:left">
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="Chat Room" runat="server" ></asp:Label></td>
                            <td><asp:Label ID="SenderId" Visible="false" runat="server" Text='<%# Eval("SenderId") %>' /></td>
                        </tr>                           
                    <tr>
                        <asp:GridView ID="GridView_ChatBox" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="MessageId" HeaderText="MessageId" visible="False"/>
                            <asp:BoundField DataField="Fname" HeaderText="Name" />
                            <asp:BoundField DataField="Message" HeaderText="Message" />
                            <asp:BoundField DataField="Time" HeaderText="Time" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Button_Delete" runat="server" Text="Delete" Visible='<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? true : false %>' CommandArgument='<%# Eval("MessageId") %>' OnCommand="Button_Click_Delete"/>
                                </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                        </asp:GridView>
                    </tr>
                            <tr>
                                <td><asp:TextBox ID="MessageBox" runat="server"></asp:TextBox></td>
                                <td><asp:Button ID="Button_Send" runat="server" Text="Send" onclick="Button_Click_Send"/></td>
                            </tr>                         
                        </table>
                        <table style="float:left;">
                            <tr>
                            <td class="td_center"><asp:Label ID="Label_MemberList" Text="Member List" runat="server" ></asp:Label></td>
                        </tr>
                            <tr>
                                <asp:GridView ID="Gridview_MemberList" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="MemberId" HeaderText="Member Id" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button_Remove_Member" runat="server" Text="Remove" CommandArgument='<%# Eval("MemberId") %>' OnCommand="Button_Click_RemoveMember"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center;">
                                    <asp:Button ID="Button_Add_New_Member" runat="server" Text="Add" OnClick="Button_Click_AddNewMember" />
                                    <asp:Button ID="Button_Drop_Room" runat="server" Text="Delete Room" OnClick="Button_Click_RemoveRoom" />
                                </td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </div>
               </div>
            
</asp:Content>
