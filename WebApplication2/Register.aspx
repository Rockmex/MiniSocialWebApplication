<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Form1">
    <div class="rg_layout">
		<div class="rg_center">
            <div class="rg_form">
                <div class="word">
                    <asp:HiddenField Value="" ID="errorMessageHidden" runat="server"/>
                        <script type="text/javascript">
                            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
                            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
                        </script>
                    <table>
                            <tr>
                                <td colspan="2" class="td_center"><h3>Register Page</h3></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Gender" runat="server" Text="Gender" /></td>
                                <td class="td_center"><asp:RadioButton ID="gender" GroupName="Group1" Text="Male" Value="male"  runat="server"/> <asp:RadioButton ID="RadioButton1" GroupName="Group1" Text="Female" Value="female"  runat="server"/></td>
                                <td class="td_right"><asp:Label ID="Label_GenderExp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Fname" runat="server" Text="First name:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="first_name" runat="server"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_FnameEXp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_lname" runat="server" Text="Last name:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="last_name" runat="server"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_lnameExp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_DOB" runat="server" Text="Date of Birth:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="date_of_birth" runat="server"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_DOBExp" runat="server" Text="DD/MM/YYYY"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Tel" runat="server" Text="Telephone:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="telephone" runat="server"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_TelExp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Email" runat="server" Text="Email:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="email" runat="server"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_EmailExp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Password" runat="server" Text="Password:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td class="td_right"><asp:Label ID="Label_PasswordExp" runat="server" Text="*"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:Button ID="Button_Submit" runat="server" Text="submit" OnClick="Button_Click_Submit" />
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
