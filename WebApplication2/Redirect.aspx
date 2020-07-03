<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Redirect.aspx.cs" Inherits="WebApplication2.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Form1">
    <div class="rg_layout">
		<div class="rg_center">
            <div class="rg_form">
                <div class="word">
                        <table id="CreateRoom">
                            <tr>
                                <td colspan="2" class="td_center"><h3>Create Chat Room</h3></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_1" runat="server" Text="Room Name:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="rname" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                 <td colspan="2" class="td_center"><asp:Label ID="Label_display"  runat="server" ></asp:Label></td>
                            </tr> 
                            <tr>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Friend ID">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UId") %>'></asp:TextBox>  
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UId") %>'></asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="First Name">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Last Name">  
                                        <EditItemTemplate>  
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Lname") %>'></asp:TextBox>  
                                        </EditItemTemplate>  
                                        <ItemTemplate>  
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>  
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
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Create" OnClick="Button_Click_CreatRoom" /><asp:Button ID="Button2" runat="server" Text="Add" OnClick="Button_Click_ExAddFriend" /></td>
                            </tr>
                        </table>
                     </div>
                   </div>
		         </div>
                </div>
              </div>    
</asp:Content>
