<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/register_layout.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
    <div class="register_layout">
                    <asp:HiddenField Value="" ID="errorMessageHidden" runat="server"/>
                        <script type="text/javascript">
                            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
                            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
                        </script>
                    <table>
                            <tr>
                                <td colspan="2"><h1>Register</h1></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Gender" runat="server" Text="Gender" /></td>
                                <td class="rg_td_center"><asp:RadioButton ID="gender" GroupName="Group1" Text="Male" Value="male"  runat="server"/> <asp:RadioButton ID="RadioButton1" GroupName="Group1" Text="Female" Value="female"  runat="server"/></td>
                                <td class="rg_td_right"><asp:Label ID="Label_GenderExp" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Fname" runat="server" Text="First name:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="first_name" runat="server" ></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="first_name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_validator" colspan="3"><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="first_name" ErrorMessage="This is not a name" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_lname" runat="server" Text="Last name:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="last_name" runat="server"></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="last_name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_td_center" colspan="3"><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="last_name" ErrorMessage="This is not a name" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_DOB" runat="server" Text="Date of Birth:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="date_of_birth" runat="server"></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date_of_birth" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_validator" colspan="3"><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="date_of_birth" ErrorMessage="Format: DD/MM/YYYY" ForeColor="Red" ValidationExpression="((0[1-9]|1[0-2])/((0|1)[0-9]|2[0-9]|3[0-1])/((19|20)\d\d))$"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Tel" runat="server" Text="Telephone:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="telephone" runat="server" ></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="telephone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_validator" colspan="3"><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="telephone" ErrorMessage="Phone Error" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Email" runat="server" Text="Email:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="email" runat="server" ></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_validator" colspan="3"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email Error" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Password" runat="server" Text="Password:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="rg_td_left"><asp:Label ID="Label_Repassword" runat="server" Text="Re-enter Password:"></asp:Label></td>
                                <td class="rg_td_center"><asp:TextBox ID="Repassword" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td class="rg_td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Repassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                                </td>
                            </tr>
                            <tr>
                               <td class="rg_validator" colspan="3"><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="Repassword" ErrorMessage="Password is not match" ForeColor="Red"></asp:CompareValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:Button ID="Button_Submit" runat="server" CssClass="btn_submit" Text="submit" OnClick="Button_Click_Submit" />
                            </tr>
                            <tr>
                                <td colspan="2" class="redirect"><b>Have an account? &nbsp </b><a href="Login.aspx">Login</a></td>
                            </tr>
                        </table>
                     </div>
    </div>
</asp:Content>