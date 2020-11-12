<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WebApplication2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/personal_layout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <div class="personal">
            <table id="m1">
                <tr>
                    <td colspan="2">
                        <div class="backgroundimage">
                            <img src="./img/05.png" width="910px" height="310px">
                        </div>

                        <div class="profile-picture">
                            <asp:Image ID="Profile_Image" runat="server" CssClass="imgClass" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="buttonlists">
                            <asp:Button ID="Edit_Profile_Image" runat="server" CssClass="btn-editImage" Text="Edit Head Image" OnClick="Button_Click_Edit_Profile_Image" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="personal_info">
                            <div class="center">
                                <h2 style="margin-bottom: 25px; display: inline-block;">Personal Info</h2>
                                <asp:Button ID="Button_Edit" CssClass="btn btn-toRight" runat="server" Text="Edit" OnClick="Button_Click_Edit" />
                                <table style="font-size: 22px;">
                                    <tr>
                                        <td class="td_left">
                                            <asp:Label ID="label_Name" Text="Name: " runat="server"></asp:Label></td>
                                        <td class="td_right">
                                            <asp:Label ID="Label_ShowName" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left">
                                            <asp:Label ID="label_DOB" Text="Date of Birth: " runat="server"></asp:Label></td>
                                        <td class="td_right">
                                            <asp:Label ID="Label_ShowDOB" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left">
                                            <asp:Label ID="label_Phone" Text="Phone: " runat="server"></asp:Label></td>
                                        <td class="td_right">
                                            <asp:Label ID="Label_ShowPhone" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left">
                                            <asp:Label ID="label_Email" Text="Email: " runat="server"></asp:Label></td>
                                        <td class="td_right">
                                            <asp:Label ID="Label_ShowEmail" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="personal_invites">
                            <div class="center">
                                <h2>New Friends</h2>
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_display" Text="XX Notifications" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <div style="overflow:auto; height: 250px;margin-top: 5px;">
                                    <asp:GridView ID="GridView_FriendNotification" runat="server" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Friend ID">
                                                <ItemTemplate>
                                                    <div style="text-align: center">
                                                        <asp:LinkButton ID="Button_View" runat="server" Text='<%# Eval("UID") %>' CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_RedirectFriend" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Fname" HeaderText="First Name" />
                                            <asp:BoundField DataField="Lname" HeaderText="Last Name" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="Button_Accept" runat="server" Text="Accept" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Accept" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="Button_Decline" runat="server" Text="Decline" CommandArgument='<%# Eval("UID") %>' OnCommand="Button_Click_Decline" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="personal_pictures">
                            <div class="center">
                                <h2>Personal Pictures</h2>
                                <asp:FileUpload ID="ImgUpload" runat="server" accept=".png,.jpg,.jpeg" />
                                <asp:Button ID="Button_Upload_Picture" CssClass="btn" runat="server" Text="Upload" OnClick="Button_Click_UploadPicture" />
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
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button_Redirect_MorePic" CssClass="btn" runat="server" Text="More.." OnClick="Button_Click_Redirect_MorePic" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="personal_rooms">
                            <div class="center">
                                <h2 style="display:inline-block">Chat Room</h2>
                                <asp:Button ID="Button_RedirectRoom" runat="server" CssClass="btn btn-toRight" Text="Create" OnClick="Button_Click_RedirectRoom" />
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_NoRoomList" Text="No Chat Room Yet." runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <div style="overflow:auto; height: 250px;margin-top: 5px;">
                                    <asp:ListView runat="server" ID="listview_ChatRoom">
                                        <ItemTemplate>
                                            <div class="block zoom">
                                                <asp:LinkButton runat="server" CssClass="hb" CommandArgument='<%#Eval("IDwithChar")%>' OnCommand="Button_Click_RedirectChatRoom">
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Image ID="Profile_Image" runat="server" CssClass="image" ImageUrl="~/img/I2.png" />
                                                            </td>
                                                            <td>
                                                                <h3><%#Eval("IDwithChar")%></h3>
                                                            </td>
                                                            <td>
                                                                <h3><%#Eval("RoomName")%></h3>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="personal_friends">
                            <div class="center">
                                <h2>Personal Friends</h2>
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_NoFriend" Text="No Friend Yet." runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                 <div style="overflow:auto; height: 250px;margin-top: 5px;">
                                    <asp:ListView runat="server" ID="listview_friendlist">
                                        <ItemTemplate>
                                            <div class="block zoom">
                                                <asp:LinkButton runat="server" CssClass="hb" CommandArgument='<%#Eval("User2_Id")%>' OnCommand="Button_Click_RedirectFriend">
                                                    <table>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Image ID="Profile_Image" runat="server" CssClass="image-friendlist" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' />
                                                            </td>
                                                            <td>
                                                                <h3>UID: <%#Eval("User2_Id")%></h3>
                                                            </td>
                                                            <td>
                                                                <h3><%#Eval("Fname")%><%#Eval("Lname")%></h3>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="personal_post">
                            <div class="center">
                                <h2>Personal Post</h2>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>