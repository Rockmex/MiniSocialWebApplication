<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="WebApplication2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/personal_layout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
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
                        <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False" GridLines="None">
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
                            <asp:Button ID="Button_AddFriend" runat="server" Text="Add Friend" OnClick="Button_Click_Request" />
                            <asp:Button ID="Button_CancelAddFriend" runat="server" Text="Cancel Add Friend" OnClick="Button_Click_Cancel" />
                            <asp:Button ID="Button_ReAddFriend" runat="server" Text="Re-Add Friend" OnClick="Button_Click_Re_Add_Friend" />
                            <asp:Button ID="Button_Block" runat="server" Text="Block" OnClick="Button_Click_Block" />
                            <asp:Button ID="Button_Unblock" runat="server" Text="Unblock" OnClick="Button_Click_Unblock" />
                            <asp:Button ID="Button_Message" runat="server" Text="Message" OnClick="Button_Click_Message" />
                            <asp:Button ID="Button_Delete" runat="server" Text="Delete" OnClick="Button_Click_Delete" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="personal_info">
                            <div class="center">
                                <h2>Personal Info</h2>
                                <table>
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
                                <h2>XXXXXXXX</h2>
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_display" Text="XXXXXXXX" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="personal_pictures">
                            <div class="center">
                                <h2>Personal Pictures</h2>
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
                        </div>
                    </td>
                    <td>
                        <div class="personal_rooms">
                            <div class="center">
                                <h2>Chat Room</h2>
                                <table>
                                    <tr>
                                        <td colspan="2" class="td_center">
                                            <asp:Label ID="Label_RoomList" Text="Chart Room List" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="IDwithChar" HeaderText="Room ID" />
                                        <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                                    </Columns>
                                </asp:GridView>
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
                                            <asp:Label ID="Label_FriendList" Text="Friend List" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="Gridview_FriendList" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="User2_Id" HeaderText="FID" />
                                        <asp:BoundField DataField="fname" HeaderText="Fisrt Name" />
                                        <asp:BoundField DataField="lname" HeaderText="Last Name" />
                                    </Columns>
                                </asp:GridView>
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