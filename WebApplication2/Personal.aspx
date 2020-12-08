<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WebApplication2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/personal_layout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <asp:HiddenField Value="" ID="errorMessageHidden" runat="server" />
        <div class="left-menu">
            <table>
                <tr>
                    <td colspan="2">
                        <h2>Friends</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView_Friends" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemDataBound="ShowFriendsImg">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="zoom">
                                            <asp:LinkButton ID="Profile_Image2" runat="server" CssClass="left-hb" CommandArgument='<%# Eval("User2_Id") %>' OnCommand="Left_Button_Click_View">
                                                        <table id="t01">
                                                            <tr>
                                                                <td><asp:Image runat="server" width="50px" height="50px" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' /></td>
                                                                <td><%#Eval("Fname")%><%#Eval("Lname")%></td>
                                                            </tr>
                                                        </table>
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>ChatRooms</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="IDwithChar" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="zoom">
                                            <asp:LinkButton ID="Profile_Image3" runat="server" CssClass="left-hb" CommandArgument='<%# Eval("IDwithChar") %>' OnCommand="Left_Button_Click_View">
                                                        <table id="t01">
                                                            <tr>
                                                                <td><asp:Image runat="server" width="50px" height="50px" ImageUrl="~/img/I2.png" /></td>
                                                                <td><%#Eval("RoomName")%></td>
                                                            </tr>
                                                        </table>   
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RoomName" Visible="False" />
                                <asp:TemplateField></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
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
                                            <asp:Label ID="Label_ShowFName" runat="server" /><asp:Label ID="Label_ShowLName" runat="server" /></td>
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
                                <div style="overflow: auto; height: 250px; margin-top: 5px;">
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
                                <h2 style="display: inline-block">Chat Room</h2>
                                <asp:Button ID="Button_RedirectRoom" runat="server" CssClass="btn btn-toRight" Text="Create" OnClick="Button_Click_RedirectRoom" />
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_NoRoomList" Text="No Chat Room Yet." runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <div style="overflow: auto; height: 250px; margin-top: 5px;">
                                    <asp:ListView runat="server" ID="listview_ChatRoom">
                                        <ItemTemplate>
                                            <div class="block zoom1">
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
                                <div style="overflow: auto; height: 250px; margin-top: 5px;">
                                    <asp:ListView runat="server" ID="listview_friendlist">
                                        <ItemTemplate>
                                            <div class="block zoom1">
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
        <div class="right-menu">
            <table>
                <tr>
                    <td>
                        <h2>You have ...</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" Text="No new Notifications" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <h2>Current time is</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="ClockArea">
                            <table id="Clock">
                                <tr>
                                    <td colspan="2">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                        <asp:UpdatePanel ID="U1" runat="server">
                                            <ContentTemplate>
                                                <h1>
                                                    <asp:Label ID="Time" runat="server" /></h1>
                                                <asp:Timer ID="Timer" runat="server" Interval="1000" OnTick="Timer_Tick" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Date" runat="server" /></td>
                                    <td>
                                        <asp:Label ID="Weekday" runat="server" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>Adv</h2>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>