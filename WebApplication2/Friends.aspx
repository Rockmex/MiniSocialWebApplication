<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="WebApplication2.WebForm5" %>
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
                <asp:Image ID="Profile_Image" runat="server" CssClass="imgClass"/>
            </div>
        </td>
      </tr>
      <tr>
         <td colspan="2">
                <div class ="buttonlists">
                    <asp:Button ID="Button_AddFriend" runat="server" Text="Add Friend" OnClick="Button_Click_Request"/>
                    <asp:Button ID="Button_CancelAddFriend" runat="server" Text="Cancel Add Friend" OnClick="Button_Click_Cancel"/>
                    <asp:Button ID="Button_ReAddFriend" runat="server" Text="Re-Add Friend" OnClick="Button_Click_Re_Add_Friend"/>
                    <asp:Button ID="Button_Block" runat="server" Text="Block" OnClick="Button_Click_Block"/>
                    <asp:Button ID="Button_Unblock" runat="server" Text="Unblock" OnClick="Button_Click_Unblock"/>
                    <asp:Button ID="Button_Message" runat="server" Text="Message" OnClick="Button_Click_Message"/>
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
                        <td class="td_left"><asp:Label ID= "label_Name" Text="Name: " runat="server"></asp:Label></td>
                        <td class="td_right"><asp:Label ID="Label_ShowName" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="td_left"><asp:Label ID= "label_DOB" Text="Date of Birth: " runat="server"></asp:Label></td>
                        <td class="td_right"><asp:Label ID="Label_ShowDOB" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="td_left"><asp:Label ID= "label_Phone" Text="Phone: " runat="server"></asp:Label></td>
                        <td class="td_right"><asp:Label ID="Label_ShowPhone" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="td_left"><asp:Label ID= "label_Email" Text="Email: " runat="server"></asp:Label></td>
                        <td class="td_right"><asp:Label ID="Label_ShowEmail" runat="server" ></asp:Label></td>
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
                <td colspan="2" class="td_center"><asp:Label ID="Label_display" Text="XX Notifications" runat="server" ></asp:Label></td>
            </tr>                           
          </table>
          <asp:GridView ID="GridView_FriendNotification" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="UID" HeaderText="Friend ID" />
                <asp:BoundField DataField="Fname" HeaderText="First Name" />
                <asp:BoundField DataField="Lname" HeaderText="Last Name" />
             </Columns>
            </asp:GridView>
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
                 <tr>
                    <td>
                        <%--<asp:Button ID="Button_Redirect_MorePic" runat="server" Text="More.." OnClick="Button_Click_Redirect_MorePic" />--%>
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
              <%--<asp:Button ID="Button_RedirectRoom" runat="server" Text="Create" OnClick="Button_Click_RedirectRoom" />--%>
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
                    <%--<asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button_Redirect" runat="server" Text="View" CommandArgument='<%# Eval("User2_Id") %>' OnCommand="Button_Click_Redirect"/>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
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
</div>

</asp:Content>