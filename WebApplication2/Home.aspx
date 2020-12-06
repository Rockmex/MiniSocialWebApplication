<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/home.css" rel="stylesheet" type="text/css" />
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
                                <%--<asp:BoundField DataField="User2_Id" visible="False"/>--%>
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
                        <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False" GridLines="None">
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
        <div class="word">
            <table>
                <tr>
                    <td colspan="2" class="td_center">
                        <h3>Weclome</h3>
                    </td>
                    <td colspan="2" class="td_center">
                        <asp:Label ID="Label_UserName" runat="server"></asp:Label></td>
                    <td><asp:Label ID="test_label" runat="server"></asp:Label></td>
                </tr>
            </table>
            <table id="Table_PostArea">
                <tr>
                    <td>
                        <asp:TextBox ID="Post_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Post_Textbox" ValidationGroup="Post_Group" ErrorMessage="*" ForeColor="Red"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="ImgUpload" runat="server" /></td>
                    <td>
                        <asp:Button ID="Post_Button" runat="server" Text="Post" OnClick="Button_Click_Post" ValidationGroup="Post_Group" /></td>
                </tr>
            </table>
            <br />
            <asp:ListView runat="server" ID="Post_ListView" OnItemDataBound="Post_DataBound">
                <LayoutTemplate>
                    <div>
                        <tr id="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <table id="PostArea">
                        <tr>
                            <asp:Label ID="PostId" Visible="false" runat="server" Text='<%# Eval("PostId") %>'></asp:Label>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Image ID="Profile_Image" runat="server" Width="50px" Height="50px" CssClass="image-personal" />
                                <asp:Label id="name" CssClass="text-name" runat="server" text='<%#Eval("Fname") + "" + Eval("Lname")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="Delete_Button" runat="server" ImageUrl="~/img/delete.png" Width=" 35px" heigth="35px" CssClass="button-deletePost" OnCommand="Button_Click_Post_Delete" CommandArgument='<%# Eval("PostId") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="content" runat="server" Text='<%#Eval("content")%>' CssClass="text-content"></asp:Label>
                                <!-- User Message Here -->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Image ID="Post_Image" runat="server" Width="300px" Height="200px" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' onerror="this.style.display='none'" CssClass="image-post" />
                            </td>
                        </tr>
                        <tr>
                            <td>Like: <%#Eval("LikeCounts")%></td>
                            <td>Comments :<%#Eval("CommentCounts")%></td>
                        </tr>
                        <tr>
                            <td style="width: 50px;">
                                <div class="PB">
                                    <asp:ImageButton ID="Like_Button" ImageUrl="~/img/like.png" CssClass="button-lck" runat="server" OnCommand="Button_Click_Like" CommandArgument='<%# Eval("PostId") %>' />
                                </div>
                            </td>
                            <td style="width: 50px">
                                <div class="PB">
                                    <asp:ImageButton ID="CommentDisplay_Button" ImageUrl="~/img/comment.png" CssClass="button-lck" runat="server" Text="Comment" OnCommand="Button_Click_Comment_Display" CommandArgument='<%# Eval("PostId") %>'/>
                                </div>
                            </td>
                            <td style="width: 50px">
                                <div class="PB">
                                    <asp:ImageButton ID="Share_Button" ImageUrl="~/img/share.png" CssClass="button-lck" runat="server" Text="Share" OnCommand="Button_Click_Share" CommandArgument='<%# Eval("PostId") %>' />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="Comment_GridView" runat="server" AutoGenerateColumns="false" ShowHeader="false" CellPadding="4" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="Fname" HeaderText="Fname" />
                                        <asp:BoundField DataField="Content" HeaderText="Content" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button_Delete" runat="server" Text="Delete" CommandArgument='<%# Eval("CommentId") %>' OnCommand="Button_Click_Comment_Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="CommentArea" runat="server">
                        <table id="Table_CommentArea" runat="server">
                            <tr>
                                <td>
                                    <asp:TextBox ID="Comment_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Comment_Textbox" ValidationGroup="Comment_Group" ErrorMessage="*" ForeColor="Red"/>
                                </td>
                                <td>
                                    <asp:Button ID="Comment_Button" runat="server" Text="Comment" OnCommand="Button_Click_Comment" CommandArgument='<%# Eval("PostId") %>' ValidationGroup="Comment_Group"/></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </ItemTemplate>
            </asp:ListView>
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
                        <asp:Label ID="Label_display" Text="No new Notifications" runat="server"></asp:Label></td>
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
                                    <h1><asp:Label ID="Time" runat="server" /></h1>
                                    <asp:Timer ID="Timer" runat="server" Interval="1000" OnTick="Timer_Tick" /> 
                                    </ContentTemplate>
                                    </asp:UpdatePanel>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Date" runat="server"/></td>
                                <td><asp:Label ID="Weekday" runat="server"/></td>
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