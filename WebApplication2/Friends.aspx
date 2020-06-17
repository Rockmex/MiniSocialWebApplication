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
        <img src="./img/my.jpg" width="150px" height="150px">
    </div>

    <div class="button_list">
            <asp:Button ID="Button444" runat="server" Text="Add Friend" />
            
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
