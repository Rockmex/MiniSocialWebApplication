<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="E1.aspx.cs" Inherits="WebApplication2.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rg_layout">
	<div class="rg_center">
            <div class="rg_form">
                    <table>
						<tr>
							<td colspan="2" class="td_center"><h3>Edit_1</h3></td>						
						</tr>
                        <tr>
                            <td class="td_left"><asp:Label ID= "label1" Text="New Email: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Textbox ID="new_email" runat="server"></asp:Textbox></td>
                        </tr>
						<tr>
							<td colspan="2" style="text-align:center;"><asp:Button ID="Update_Button" Text="Update" OnClick="Button1_Click" runat="server" /><asp:Button ID="Back_Button" Text="Back" OnClick="Button2_Click" runat="server" /></td>						
						</tr>
					</table>
			</div>
		</div>
	</div>
</asp:Content>
