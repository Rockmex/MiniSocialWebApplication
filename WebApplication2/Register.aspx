<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
    <div class="container" >
    <div class="register-content">
      <table style="width:412px;">
        <tr>
            <td colspan="2">
              <h2>Register</h2>
            </td>
          </tr>
        <tr>
            <td>
              <div class="radio">
                <h3>Gender</h3>
                <!--<label>-->
                  <asp:RadioButton runat="server" ID="gender" type="radio" CssClass="radio-input" GroupName="gender" Text="male" value="male"/>
<!--                  <span class="design"></span>
                  <span class="text">Male</span>
                </label>
                <label>
-->                  <asp:RadioButton runat="server" ID="RadioButton1" type="radio" CssClass="radio-input" GroupName="gender" Text="female" value="female"/>
<!--                  <span class="design"></span>
                  <span class="text">Female</span>
                </label>
-->              </div>
            </td>
      </tr>
       <tr>
        <td>
          <div class="input-div first">
            <div class="div">
              <h5>First Name</h5>
              <asp:Textbox runat="server" ID="first_name" type="text" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Last Name</h5>
              <asp:Textbox runat="server" ID="last_name" type="text" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Birthday</h5>
              <asp:Textbox runat="server" ID="date_of_birth" type="text" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Telephone</h5>
              <asp:Textbox runat="server" ID="telephone" type="text" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Email</h5>
              <asp:Textbox runat="server" ID="email" type="text" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Password</h5>
              <asp:Textbox runat="server" ID="password" type="password" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
          <div class="input-div text">
            <div class="div">
              <h5>Re-enter Password</h5>
              <asp:Textbox runat="server" type="password" class="input"/>
            </div>
          </div>
          </td>
        </tr>
        <tr>
        <td>
        <a href="Login.aspx">Have an account?</a>
          </td>
        </tr>
        <tr>
        <td>
        <asp:Button runat="server" type="submit"  class="btn" text="Register" />
          </td>
      </tr>
      </table>
    </div>
  </div>
    </div>
    <script type="text/javascript" src="js/register.js"></script>
</asp:Content>