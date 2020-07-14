<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication2.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rg_layout">
	<div class="rg_center">
            <div class="rg_form">
                    <table>
						<tr>
							<td colspan="2" class="td_center"><h3>Edit</h3></td>						
						</tr>
                        <tr>
                            <td class="td_left"><asp:Label ID= "label_OldEmail" Text="Old Email: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_ShowEmail" runat="server" ></asp:Label></td>
                            <asp:Button ID="Button_Edit_Email" runat="server" Text="Edit" OnClick="Button_Click_EditEmail" />
                        </tr>
                        <tr>
                            <td class="td_left"><asp:Label ID= "label_OldPhone" Text="Old Phone: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_ShowPhone" runat="server" ></asp:Label></td>
                            <asp:Button ID="Button_Edit_Phone" runat="server" Text="Edit" OnClick="Button_Click_EditPhone" />
                        </tr>
						<tr>
                            <td class="td_left"><asp:Label ID= "label_OldPass" Text="Old Password: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_ShowPass" runat="server" require="true"></asp:Label></td>
                            <asp:Button ID="Button_Edit_Password" runat="server" Text="Edit" OnClick="Button_Click_EditPassword" />
                        </tr>
						<tr>
							<td colspan="2" style="text-align:center;"><asp:Button ID="Button_Back" Text="Back" OnClick="Button_Click_Back" runat="server" ></asp:Button></td>						
						</tr>
					</table>
			</div>
		</div>
	</div>
</asp:Content>
