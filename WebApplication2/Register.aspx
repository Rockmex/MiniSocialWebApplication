<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/register.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <asp:HiddenField Value="" ID="errorMessageHidden" runat="server"/>
     <div class="container" >
      <div class="register-content">
        <table>
            <tr>
                <td>
                    <h2>Register</h2>
                </td>
            </tr>
            <tr>
                <td>
                  <div class="radio">
                    <h3>Gender</h3>
                     <label>
                      <input class="radio-input" type="radio"  name="gender" value="Male" required> 
                      <span class="design"></span>
                      <span class="text">Male</span>
                    </label>
                    <label>
                      <input class="radio-input"type="radio"  name="gender" value="Female">
                      <span class="design"></span>
                      <span class="text">Female</span>
                    </label>
                </div>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="first_name" ErrorMessage="*" ForeColor="Red"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="first_name" ErrorMessage="Format: Letters only" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+" CssClass="expression-validator"/>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="last_name" ErrorMessage="*" ForeColor="Red"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="last_name" ErrorMessage="Format: Letters only" ForeColor="Red" ValidationExpression="[a-zA-Z/'/-]+" CssClass="expression-validator"/>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="date_of_birth" ErrorMessage="*" ForeColor="Red"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="date_of_birth" ErrorMessage="Format: DD/MM/YYYY" ForeColor="Red" ValidationExpression="((0[1-9]|1[0-2])/((0|1)[0-9]|2[0-9]|3[0-1])/((19|20)\d\d))$"/>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="telephone" ErrorMessage="*" ForeColor="Red"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="telephone" ErrorMessage="Format: 10 digits" ForeColor="Red" ValidationExpression="\d{10}"/>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red"/>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ErrorMessage="Format: xxx@xxx.com" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>
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
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="*" ForeColor="Red"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-div text">
                    <div class="div">
                      <h5>Re-enter Password</h5>
                      <asp:Textbox runat="server" type="password" ID="repassword" class="input"/>
                    </div>
                </div>
            </td>
            <td>
                <div class="validator">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="repassword" ErrorMessage="*" ForeColor="Red"/>
                    <asp:CompareValidator runat="server" ControlToCompare="password" ControlToValidate="Repassword" ErrorMessage="Password is not match" ForeColor="Red"/>
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
                <asp:Button runat="server" type="submit"  class="btn" text="Register" OnClick="Button_Click_Submit" />
            </td>
        </tr>
       </table>
      </div>
     </div>
    </div>
    <script type="text/javascript" src="js/register.js"></script>
</asp:Content>