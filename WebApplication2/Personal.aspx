<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WebApplication2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="backgroud-pic">
        <img src="./img/05.png" width="850px" height="310px">
    </div>

    <div class="profile-pic-a">
    
    </div>

    <div class="profile-picture">
        <img src="./img/my.jpg" width="150px" height="150px">
    </div>

    <div class="personal_info">
    <h2>Personal Info</h2>
    <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button_Click_Edit" />
    </div> 

    <div class="personal_pictures">
    <h2>Personal Pictures</h2>
    </div>

    <div class="personal_friends">
    <h2>Personal Friends</h2>
    </div>

    <div class="personal_postarea">
    <h2>New Friends</h2>
        <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="XX Notifications" runat="server" ></asp:Label></td>
                        </tr>                           
                    </table>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="Friend ID" />
                                <asp:BoundField DataField="Fname" HeaderText="First Name" />
                                <asp:BoundField DataField="Lname" HeaderText="Last Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button1" runat="server" Text="Accept" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Accept"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button2" runat="server" Text="Decline" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Decline"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
    </div> 


    <div class="personal_post">
    <h2>Personal posts</h2>
    </div> 

</asp:Content>
