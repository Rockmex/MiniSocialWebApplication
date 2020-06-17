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
                            <td class="td_left"><asp:Label ID= "label_1" Text="Old Email: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_Email" runat="server" ></asp:Label></td>
                            <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
                        </tr>
                        <tr>
                            <td class="td_left"><asp:Label ID= "label3" Text="Old Phone: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_Phone" runat="server" ></asp:Label></td>
                            <asp:Button ID="Button2" runat="server" Text="Edit" OnClick="Button2_Click" />
                        </tr>
						<tr>
                            <td class="td_left"><asp:Label ID= "label5" Text="Old Password: " runat="server"></asp:Label></td>
                            <td class="td_right"><asp:Label ID="Label_Password" runat="server" require="true"></asp:Label></td>
                            <asp:Button ID="Button3" runat="server" Text="Edit" OnClick="Button3_Click" />
                        </tr>
						<tr>
							<td colspan="2" style="text-align:center;"><asp:Button ID="Back_Button" Text="Back" OnClick="Button4_Click" runat="server" ></asp:Button></td>						
						</tr>
					</table>
			</div>
		</div>
	</div>
</asp:Content>
