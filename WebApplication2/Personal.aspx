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
                <asp:Image ID="Profile_Image" runat="server" CssClass="imgClass"/>
            </div>
        </td>
      </tr>
      <tr>
         <td colspan="2">
                <div class ="buttonlists">
                <asp:Button ID="Edit_Profile_Image" runat="server" Text="Edit" OnClick="Button_Click_Edit_Profile_Image"/>
                </div>
         </td>
      </tr>
      <tr>
        <td>
            <div class="personal_info">
            <h2>Personal Info</h2>
                <asp:Button ID="Button_Edit" runat="server" Text="Edit" OnClick="Button_Click_Edit" />
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
            </td>
        <td>
          <div class="personal_invites">
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
        </td>
      </tr>
      <tr>
        <td>
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
                 <tr>
                    <td>
                        <asp:Button ID="Button_Redirect_MorePic" runat="server" Text="More.." OnClick="Button_Click_Redirect_MorePic" />
                    </td>
                  </tr>
            </table>
          </div>
        </td>
         <td>
             <div class="personal_rooms">
              <h2>Chat Room</h2>
              <asp:Button ID="Button_RedirectRoom" runat="server" Text="Create" OnClick="Button_Click_RedirectRoom" />
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
        </td>
      </tr>
      <tr>
        <td>
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
        </td>
        <td>
            <div class="personal_post">
            <h2>Personal Post</h2>
            </div>
        </td>
      </tr>
    </table>
 </div>
</div>

</asp:Content>