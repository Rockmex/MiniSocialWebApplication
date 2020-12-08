<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit_Personal_Image.aspx.cs" Inherits="WebApplication2.Edit_Personal_Image" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/EditImg.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <table id="menu">
            <tr>
                <td colspan="2" class="td_center">
                    <h3>Edit_Personal_Image</h3>
                </td>
            </tr>
            <tr>
                <td class="td_left">
                    <asp:Label ID="label_OldImg" Text="Old Image: " runat="server"></asp:Label></td>
                <td class="td_right">
                    <asp:Image ID="Profile_Image" runat="server" Height="206px" Width="171px" /></td>
            </tr>
            <tr>
                <td class="td_left">
                    <asp:Label ID="label_NewImg" Text="New Image: " runat="server"></asp:Label></td>
                <td class="td_right">
                    <asp:FileUpload ID="ImgUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button_Update" Text="Update" CssClass="btn" OnClick="Button_Click_Update" runat="server" />
                    <asp:Button ID="Button_Back" Text="Back" CssClass="btn" OnClick="Button_Click_Back" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
