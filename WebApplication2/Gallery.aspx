<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApplication2.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Form1 {
            position: relative;
            top: 25px;
            left: 0;
            bottom: 100px;
            width: 100%;
        }

        .image{
            height:200px;
            width:200px;
            margin-bottom: 10px;
        }

        .title{
            display: flex;
            justify-content: center;
        }

        .listItem{
            margin-bottom:20px;
        }

        .button{
            display: flex;
            margin: auto;
            margin-top: 10px;
            justify-content: center;
        }

        .btn-back {
            display: block;
            width: 10%;
            height: 50px;
            border-radius: 25px;
            outline: none;
            border: none;
            background-image: linear-gradient(to right,#ec1da4e6, #dc0a939c, #ec1da4e6 );
            background-size: 200%;
            font-size: 1.2rem;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            text-transform: uppercase;
            cursor: pointer;
            transition: .5s;
            margin: auto;
        }

            /*When pointed*/
            .btn-back:hover, .btn-delete:hover{
                background-position: right;
            }

        .btn-delete{
            display: block;
            width: 60%;
            height: 35px;
            border-radius: 25px;
            outline: none;
            border: none;
            background-image: linear-gradient(to right,#ec1da4e6, #dc0a939c, #ec1da4e6 );
            background-size: 200%;
            font-size: 1.2rem;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: .5s;
            margin: auto;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <table>
            <tr>
                <td>
                    <div class="title">
                    <h2>Gallery</h2></div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="Datalist_Images" runat="server" RepeatColumns="9" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="listItem" >
                                <asp:Image ID="Image" runat="server" CssClass="image zoom" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>'/>
                                <asp:Button runat="server" CssClass="button" Text="Delete"></asp:Button>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button_Back" runat="server" Text="Back" OnClick="Button_Click_Back" class="button"/>
                </td>

            </tr>
        </table>
    </div>
</asp:Content>
