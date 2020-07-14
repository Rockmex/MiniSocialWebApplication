<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit_Phone.aspx.cs" Inherits="WebApplication2.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rg_layout">
	<div class="rg_center">
            <div class="rg_form">
                    <table>
						<tr>
							<td colspan="2" class="td_center"><h3>Edit_Phone</h3></td>						
						</tr>
                        <tr>
                            <td class="td_left"><asp:Label ID= "label_phone" Text="New Phone: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Textbox ID="new_phone" runat="server"></asp:Textbox></td>
                        </tr>
						<tr>
							<td colspan="2" style="text-align:center;"><asp:Button ID="Button_Update" Text="Update" OnClick="Button_Click_Update" runat="server" /><asp:Button ID="Button_Back" Text="Back" OnClick="Button_Click_Back" runat="server" /></td>						
						</tr>
					</table>
			</div>
		</div>
	</div>
</asp:Content>
