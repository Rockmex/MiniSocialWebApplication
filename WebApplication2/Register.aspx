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
                                <td class="td_right"><asp:Label ID="Label_GenderExp" runat="server" Text=" "/></td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Fname" runat="server" Text="First name:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="first_name" runat="server" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="first_name" ErrorMessage="First Name is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="first_name" ErrorMessage="This is not a name" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_lname" runat="server" Text="Last name:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="last_name" runat="server" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="last_name" ErrorMessage="Last Name is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="last_name" ErrorMessage="This is not a name" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_DOB" runat="server" Text="Date of Birth:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="date_of_birth" Text=" " runat="server"></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date_of_birth" ErrorMessage="Date of Birth is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="date_of_birth" ErrorMessage="Please enter a valid date(DD/MM/YYYY)" ForeColor="Red" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Tel" runat="server" Text="Telephone:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="telephone" runat="server" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="telephone" ErrorMessage="Phone number is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="telephone" ErrorMessage="Phone Error" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Email" runat="server" Text="Email:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="email" runat="server" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" ErrorMessage="Email is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email Error" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Password" runat="server" Text="Password:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="password" runat="server" TextMode="Password" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password" ErrorMessage="Password is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"><asp:Label ID="Label_Repassword" runat="server" Text="Re-enter Password:"></asp:Label></td>
                                <td class="td_center"><asp:TextBox ID="Repassword" runat="server" TextMode="Password" Text=" "></asp:TextBox></td>
                                <td class="td_right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Repassword" ErrorMessage="Password is require !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="Repassword" ErrorMessage="Password is not match" ForeColor="Red"></asp:CompareValidator>
                                </td>
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
