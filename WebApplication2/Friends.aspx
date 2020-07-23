<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="WebApplication2.WebForm5" %>
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
	</div>

    <div class="button_list">
            <asp:Button ID="Button_AddFriend" runat="server" Text="Add Friend" OnClick="Button_Click_Request"/>
            <asp:Button ID="Button_CancelAddFriend" runat="server" Text="Cancel Add Friend" OnClick="Button_Click_Cancel"/>
            <asp:Button ID="Button_ReAddFriend" runat="server" Text="Re-Add Friend" OnClick="Button_Click_Re_Add_Friend"/>
            <asp:Button ID="Button_Block" runat="server" Text="Block" OnClick="Button_Click_Block"/>
            <asp:Button ID="Button_Unblock" runat="server" Text="Unblock" OnClick="Button_Click_Unblock"/>
            <asp:Button ID="Button_Message" runat="server" Text="Message" OnClick="Button_Click_Message"/>
            <asp:Button ID="Button_Delete" runat="server" Text="Delete" OnClick="Button_Click_Delete" />
	</div>

    <div class="personal_info">
    <h2>Personal Info</h2>
    </div> 

    <div class="personal_pictures">
    <h2>Personal Pictures</h2>
    </div>

    <div class="personal_friends">
    <h2>Personal Friends</h2>
    </div>

    <div class="personal_postarea">
    <h2>What's in you mind ?</h2>
    </div> 


    <div class="personal_post">
    <h2>Personal posts</h2>
    </div> 

</asp:Content>