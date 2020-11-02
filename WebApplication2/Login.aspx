<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="Form1">
     <asp:HiddenField Value="" ID="errorMessageHidden" runat="server"/>
     <img class="background" src="img/wave.png" />
    <div class="container" >
  <div class="img">
    <img src="img/bg.svg"/>
  </div>
  <div class="login-content">
    <table style="width:412px;">
      <tr>
        <td align="center">
        <img class="avatar" src="img/avatar.svg" />
         </td>
      </tr>
      <tr>
        <td colspan="2">
          <h2>Welcome</h2>
         </td>
      </tr>
      <tr>
        <td>
          <div class="input-div user">
          <div class="i">
            <i class="fas fa-user"></i>
          </div>
          <div class="div">
            <h5>Email</h5>
            <asp:Textbox ID="email" runat="server" type="text" class="input"/>
          </div>
        </div>
          </td>
        </tr>
      <tr>
        <td>
          <div class="input-div pass">
            <div class="i"> 
            <i class="fas fa-lock"></i>
            </div>
            <div class="div">
              <h5>Password</h5>
              <asp:Textbox ID="password" runat="server" type="password" class="input"/>
            </div>
          </div>
          </td>
        </tr>
      <tr>
        <td>
        <a href="Register.aspx">Forgot Password?</a>
          </td>
        </tr>
      <tr>
        <td>
        <asp:Button runat="server" type="submit" class="btn" text="Login" OnClick="Button_Click_Login"/>
          </td>
          </tr>
        </table>
  </div>
</div>
 </div>
    <script type="text/javascript" src="js/login.js"></script>
</asp:Content>
