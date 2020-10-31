<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Personaltest.aspx.cs" Inherits="WebApplication2.Personaltest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>4900 Project </title>
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/personal_layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <!--Top Bar-->
        <div class ="main">
                <div class ="topbar">
                       <img src="./img/logo.png"  width="100px" height:"100px" />
                        <ul id="ulSiteMenu">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="Login.aspx">Login</a></li>
                            <li><a href="Register.aspx">Register</a></li>
                            <li><a href="Personaltest.aspx">Personal</a></li>
                            <li><a href="App.aspx">App</a></li>
                            <li>
                                <asp:TextBox ID="Search_target" runat="server"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Search_target" ValidationGroup="Search_Group" ErrorMessage="*" ForeColor="Red"/>
                                <!-- To let Validator only valid for one button, have to add same value to the element ValidationGroup for the TextBox and Button -->
                            </li>
                            <li><asp:Button ID="Search_Button" runat="server" Text="Search" onclick="Button_Click_Search" ValidationGroup="Search_Group"/></li>
                            <li><asp:Button ID="LogOut_Button" Text="Log Out" OnClick="Button_Click_LogOut" runat="server" /></li>
                        </ul>
                </div> 
            </div>

        <div class="personal">
    <table id="main">
      <tr>
        <td colspan="2">
                <img src="./img/05.png" width="850px" height="310px">
            <div class="profile-picture">
                <asp:Image ID="Profile_Image" runat="server" />
                <br />
                <asp:Button ID="Edit_Profile_Image" runat="server" Text="Edit" OnClick="Button_Click_Edit_Profile_Image"/>
            </div>
        </td>
      </tr>
      <tr>
        <td>
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
            </td>
        <td>
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
        </td>
      </tr>
      <tr>
        <td>
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

        </td>
        <td>
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
        </td>
      </tr>
      <tr>
        <td>
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
        </td>
        <td>
          Personal Post
        </td>
      </tr>
    </table>
 </div>

    </form>
</body>
</html>
