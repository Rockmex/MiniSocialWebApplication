<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Redirect.aspx.cs" Inherits="WebApplication2.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/CreateRoom.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="word">
        <h3>Create Chat Room</h3>
        <div class="pad">
            <asp:Label ID="Label_Room_Name" runat="server" Text="Room Name:" /><asp:TextBox ID="rname" runat="server" CssClass="input"/>
        </div>
        <div class="pad">
            <asp:Label ID="Label_display" CssClass="label" runat="server"/>
        </div>
        <asp:GridView ID="GridView_ChatRoom" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Friend ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_UID" runat="server" Text='<%# Bind("UId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_UID" runat="server" Text='<%# Bind("UId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Fname" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Fname" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Lname" runat="server" Text='<%# Bind("Lname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_Lname" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Select">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
        <div class="btn-place">
            <asp:Button ID="Button_CreateRoom" CssClass="btn" runat="server" Text="Create" OnClick="Button_Click_CreatRoom" /><asp:Button ID="Button_ExAddFriend" runat="server" CssClass="btn" Text="Add" OnClick="Button_Click_ExAddFriend" />
        </div>
    </div>
</asp:Content>
