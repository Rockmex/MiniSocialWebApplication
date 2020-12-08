<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication2.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Edit.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="word">
        <div class="menu">
            <table id="t01">
                <tr>
                    <td colspan="3" class="td_center">
                        <h3>Edit</h3>
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        <asp:Label ID="label_OldEmail" Text="Email: " runat="server"></asp:Label></td>
                    <td class="td_right">
                        <asp:Label ID="Label_ShowEmail" runat="server"></asp:Label></td>
                    <td>
                        <asp:Button ID="Button_Edit_Email" runat="server" Text="Edit" OnClick="Button_Click_EditEmail" /></td>
                </tr>
                <tr>
                    <td class="td_left">
                        <asp:Label ID="label_OldPhone" Text="Phone: " runat="server"></asp:Label></td>
                    <td class="td_right">
                        <asp:Label ID="Label_ShowPhone" runat="server"></asp:Label></td>
                    <td>
                        <asp:Button ID="Button_Edit_Phone" runat="server" Text="Edit" OnClick="Button_Click_EditPhone" /></td>
                </tr>
                <tr>
                    <td class="td_left">
                        <asp:Label ID="label_OldPass" Text="Password: " runat="server"></asp:Label></td>
                    <td class="td_right">
                        <asp:Label ID="Label_ShowPass" runat="server" Text="********" require="true"></asp:Label></td>
                    <td>
                        <asp:Button ID="Button_Edit_Password" runat="server" Text="Edit" OnClick="Button_Click_EditPassword" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="Button_Back" Text="Back" OnClick="Button_Click_Back" runat="server"></asp:Button></td>
                </tr>
            </table>
        </div>
    </div>


    <div runat="server" id="m1" visible="false">
        <asp:HiddenField Value="" ID="errorMessageHidden" runat="server" />
        <script type="text/javascript">
            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
        </script>
        <div class="popup">
            <div class="word">
                <div class="menu">
                    <table id="t02">
                        <tr>
                            <td colspan="2" class="td_center">
                                <h3>Edit_Email</h3>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <asp:Label ID="label_Email" Text="New Email: " runat="server"></asp:Label></td>
                            <td class="td_right">
                                <asp:TextBox ID="new_email" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="Button_Update" Text="Update" OnClick="Button_Click_Update" runat="server" /><asp:Button ID="Button1" Text="Back" OnClick="Button_Click_Back2" runat="server" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div runat="server" id="m2" visible="false">
        <asp:HiddenField Value="" ID="HiddenField1" runat="server" />
        <script type="text/javascript">
            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
        </script>
        <div class="popup">
            <div class="word">
                <div class="menu">
                    <table id="t03">
                        <tr>
                            <td colspan="2" class="td_center">
                                <h3>Edit_Phone</h3>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <asp:Label ID="label_phone" Text="New Phone: " runat="server"></asp:Label></td>
                            <td class="td_right">
                                <asp:TextBox ID="new_phone" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="Button2" Text="Update" OnClick="Button_Click_Update2" runat="server" /><asp:Button ID="Button3" Text="Back" OnClick="Button_Click_Back2" runat="server" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div runat="server" id="m3" visible="false">
        <asp:HiddenField Value="" ID="HiddenField2" runat="server" />
        <script type="text/javascript">
            var alertMsg = document.getElementById('ContentPlaceHolder1_errorMessageHidden');
            if (alertMsg != null) if (alertMsg.value != "") alert(alertMsg.value);
        </script>
        <div class="popup">
            <div class="word">
                <div class="menu">
                    <table id="t04">
                        <tr>
                            <td colspan="2" class="td_center">
                                <h3>Edit_Password</h3>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <asp:Label ID="label1" Text="Old Password: " runat="server"></asp:Label></td>
                            <td class="td_right">
                                <asp:TextBox ID="old_password" runat="server" require="true"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <asp:Label ID="label_NewPass" Text="New Password: " runat="server"></asp:Label></td>
                            <td class="td_right">
                                <asp:TextBox ID="new_password" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="Button4" Text="Update" OnClick="Button_Click_Update3" runat="server" /><asp:Button ID="Button5" Text="Back" OnClick="Button_Click_Back2" runat="server" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div runat="server" id="black" class="blackback" visible="false" />
</asp:Content>