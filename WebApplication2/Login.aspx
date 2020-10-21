<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/login_layout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1" >
    <div class="ln_layout">
                    <asp:HiddenField Value="" ID="errorMessageHidden" runat="server"/>
                        <script type="text/javascript">
                            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
                            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
                        </script>
        <table>

             <tr>
                  <td colspan="2"><h1>Login</h1></td>
            </tr>

             <tr>
                 <td class="ln_td_left"><asp:Label ID= "Label_Email" runat ="server" Text=" Email: "></asp:Label></td>
                 <td class="ln_td_right"><asp:TextBox  ID="email" runat ="server"></asp:TextBox></td>
            </tr>
            <tr>
                 <td class="ln_td_left"><asp:Label ID= "Label_Password" runat ="server" Text=" Password: "></asp:Label></td>
                 <td class="ln_td_right"><asp:TextBox  ID="password" runat ="server" TextMode="Password"></asp:TextBox></td>
            </tr>

            <tr>
                 <td colspan="2"><asp:Button ID="Login_Button" runat="server" Text="Login" CssClass="Login_Button" OnClick="Button_Click_Login" />
            </tr>
        </table>
                </div>
 </div>
</asp:Content>
