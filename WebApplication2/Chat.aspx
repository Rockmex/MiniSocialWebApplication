<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="WebApplication2.Chat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rg_layout">
		    <div class="rg_center">
                <div class="rg_form">
                    <div class="word">
                    <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="Chat Box" runat="server" ></asp:Label></td>
                        </tr>                           
                    </table>
                        <asp:GridView ID="GridView_Chat" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="MessageId" HeaderText="MessageId" visible="False"/>
                                <asp:BoundField DataField="SenderId" HeaderText="SenderId" />
                                <asp:BoundField DataField="Message" HeaderText="Message" />
                                <asp:BoundField DataField="Time" HeaderText="Time" />
                                <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Button_Delete" runat="server" Text="Delete" CommandArgument='<%# Eval("MessageId") %>' OnCommand="Button_Click_Delete"/>
                                        </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <table>
                            <tr>
                                <td><asp:TextBox ID="MessageBox" runat="server"></asp:TextBox></td>
                                <td><asp:Button ID="Button_Send" runat="server" Text="Send" onclick="Button_Click_Send"/></td>
                            </tr>                         
                        </table>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
