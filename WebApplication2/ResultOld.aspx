<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResultOld.aspx.cs" Inherits="WebApplication2.WebForm13" EnableEventValidation="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Form1">
        <div class="rg_layout">
		    <div class="rg_center">
                <div class="rg_form">
                    <div class="word">
                    <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="We Found XX results " runat="server" ></asp:Label></td>
                        </tr>                           
                    </table>
                        <asp:GridView ID="GridView_SearchResult" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="UID" />
                                <asp:BoundField DataField="fname" HeaderText="Fisrt Name" />
                                <asp:BoundField DataField="lname" HeaderText="Last Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button_View" runat="server" Text="View" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_View"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
