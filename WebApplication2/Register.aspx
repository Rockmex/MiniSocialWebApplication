<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm3" %>
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
                                <td colspan="2" class="td_center"><h3>Register Page</h3></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_1" runat="server" Text="Gender"></asp:Label></td>
                                <td class="td_right"><asp:RadioButton ID="gender" GroupName="Group1" Text="Male" Value="male"  runat="server"/> <asp:RadioButton ID="RadioButton1" GroupName="Group1" Text="Female" Value="female"  runat="server"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_2" runat="server" Text="First name:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="first_name" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label3" runat="server" Text="Last name:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="last_name" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_3" runat="server" Text="Date of Birth:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="date_of_birth" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_4" runat="server" Text="Telephone:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="telephone" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_5" runat="server" Text="Email:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="email" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_6" runat="server" Text="Password:"></asp:Label></td>
                                <td class="td_right"><asp:TextBox ID="password" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" />
                            </tr>
                            <tr>
                                <td colspan="2" class="redirect"><b>Have an account? &nbsp </b><a href="login.apsx">Login</a></td>
                            </tr>
                        </table>

                     </div>
                   </div>
		         </div>
                </div>
              </div>           
</asp:Content>
