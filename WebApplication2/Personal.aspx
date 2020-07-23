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
        <asp:Image ID="Profile_Image" runat="server" Height="150px" Width="150px"/>
        <br />
        <asp:Button ID="Edit_Profile_Image" runat="server" Text="Edit" OnClick="Button_Click_Edit_Profile_Image"/>
    </div>

    <div class="personal_info">
    <h2>Personal Info</h2>
    <asp:Button ID="Button_Edit" runat="server" Text="Edit" OnClick="Button_Click_Edit" />
    </div> 

    <div class="personal_pictures">
    <h2>Personal Pictures</h2>
        <asp:FileUpload ID="ImgUpload" runat="server"  accept=".png,.jpg,.jpeg"/>
        <asp:Button ID="Button_Upload_Picture" runat="server" Text="Upload" OnClick="Button_Click_UploadPicture" />
        <table>
            <tr>
                <td>
                    <asp:DataList ID="Datalist_Images" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                         <ItemTemplate>
                              <asp:Image ID="Image" runat="server" Height="70" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' Width="100" />
                         </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>

    <div class="personal_friends">
    <h2>Personal Friends</h2>
        <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_FriendList" Text="Friend List" runat="server" ></asp:Label></td>
                        </tr>      
                         <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_NoFriend" Text="No Friend Yet." runat="server" ></asp:Label></td>
                        </tr>
         </table>
        <asp:GridView ID="Gridview_FriendList" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="User2_Id" HeaderText="FID" />
                                <asp:BoundField DataField="fname" HeaderText="Fisrt Name" />
                                <asp:BoundField DataField="lname" HeaderText="Last Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button_Redirect" runat="server" Text="View" CommandArgument='<%# Eval("User2_Id") %>' OnCommand="Button_Click_Redirect"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
    </div>

    <div class="personal_postarea">
    <h2>New Friends</h2>
        <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="XX Notifications" runat="server" ></asp:Label></td>
                        </tr>                           
        </table>
                        <asp:GridView ID="GridView_FriendNotification" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="Friend ID" />
                                <asp:BoundField DataField="Fname" HeaderText="First Name" />
                                <asp:BoundField DataField="Lname" HeaderText="Last Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button_Accept" runat="server" Text="Accept" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Accept"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Button_Decline" runat="server" Text="Decline" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Decline"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
    </div> 


    <div class="personal_post">
    <h2>Chat Room</h2>
        <asp:Button ID="Button_RedirectRoom" runat="server" Text="Redirect" OnClick="Button_Click_RedirectRoom" />
    <table>
                        <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_RoomList" Text="Chart Room List" runat="server" ></asp:Label></td>
                        </tr>      
                         <tr>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_NoRoomList" Text="No Chart Room Yet." runat="server" ></asp:Label></td>
                        </tr>
         </table>
        <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="IDwithChar" HeaderText="Room ID" />
                                <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button_RedirectChatRoom" runat="server" Text="View" CommandArgument='<%# Eval("IDwithChar") %>' OnCommand="Button_Click_RedirectChatRoom"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
    </div> 

</asp:Content>
