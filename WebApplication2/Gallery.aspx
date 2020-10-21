<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApplication2.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <table>
            <tr>
                <td>
                    <asp:DataList ID="Datalist_Images" runat="server" RepeatColumns="10" RepeatDirection="Horizontal">
                         <ItemTemplate>
                              <asp:Image ID="Image" runat="server" Height="70" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' Width="100" />
                         </ItemTemplate>
                    </asp:DataList>
                </td>
                <tr>
                <td>
                    <asp:Button ID="Button_Back" runat="server" Text="Back" OnClick="Button_Click_Back"/>
                </td>
                </tr>
            </tr>
        </table>
    </div>
</asp:Content>
