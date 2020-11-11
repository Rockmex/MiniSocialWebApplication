<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="WebApplication2.Result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/result.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <div class="list">
            <table class="label-display">
                    <tr>
                        <td colspan="2" class="td_center">
                            <asp:Label ID="Label_display" Text="We Found XX results " runat="server"></asp:Label>
                        </td>
                    </tr>
            </table>
            <asp:ListView runat="server" ID="listview_result">
                <ItemTemplate>
                    <div class="block zoom">
                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("UID") %>' CssClass="hb" OnCommand="Button_Click_View">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:Image ID="Profile_Image" runat="server" CssClass="image" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' />
                                    </td>
                                    <td>
                                        <h3><%#Eval("UID")%></h3>
                                    </td>
                                    <td>
                                        <h3><%#Eval("Fname")%><%#Eval("Lname")%></h3>
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
