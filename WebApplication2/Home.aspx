<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <div class="rg_layout">
            <div class ="friendlist">
                            <table>
                                <tr>
                                    <td colspan="2" ><h3>Friends</h3></td>
                                </tr>                           
                                <tr>
                                <td>
                                 <asp:GridView ID="GridView_Friends" runat="server" AutoGenerateColumns="False"  GridLines="None" OnItemDataBound="ShowFriendsImg">
                                     <Columns>
                                         <%--<asp:BoundField DataField="User2_Id" visible="False"/>--%>
                                         <asp:TemplateField>
                                             <ItemTemplate>
                                                 <div class="zoom">
                                                <asp:LinkButton ID="Profile_Image2"  runat="server" Cssclass="hb" CommandArgument='<%# Eval("User2_Id") %>' OnCommand="Button_Click_View">
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
                                    <td colspan="2" ><h3>ChatRooms</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                 <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="IDwithChar" visible="False"/>
                                        <asp:TemplateField>
                                             <ItemTemplate>
                                                <div class="zoom">
                                                <asp:LinkButton ID="Profile_Image3"  runat="server" Cssclass="hb" CommandArgument='<%# Eval("IDwithChar") %>' OnCommand="Button_Click_View" >
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
                                        <asp:BoundField DataField="RoomName"  visible="False"/>
                                        <asp:TemplateField>
                                        </asp:TemplateField>
                                    </Columns>
                                  </asp:GridView>
                                   </td>
                                </tr>
                                </table>
              </div>
		    <div class="rg_center">
                <div class="rg_form">
                    <div class="word">
                    <table>
                        <tr>
                            <td colspan="2" class="td_center"><h3>Weclome</h3></td>
                            <td colspan="2" class="td_center"><asp:Label ID="Label_UserName" runat="server" ></asp:Label></td>
                        </tr>                           
                    </table>
                        <table id="Table_PostArea">
                            <tr>
                                <td><asp:TextBox ID="Post_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td> <asp:FileUpload ID="ImgUpload" runat="server" /></td>
                                <td><asp:Button ID="Post_Button" runat="server" Text="Post" OnClick="Button_Click_Post"/></td>
                            </tr>
                        </table>
                        <br/>
                        <asp:ListView runat="server" ID="Post_ListView" OnItemDataBound="Post_DataBound" >
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
                                            <asp:Image ID="Profile_Image"  runat="server" width="50px" height="50px" />
                                            <%#Eval("Fname")%><%#Eval("Lname")%>
                                        </td>
                                        <td><asp:ImageButton ID="Delete_Button" runat="server" ImageUrl="~/img/delete.png" width=" 35px" heigth="35px" OnCommand="Button_Click_Post_Delete" CommandArgument='<%# Eval("PostId") %>'/></td>
                                    </tr>
                                    <tr>
                                         <td colspan="3">
                                            <%#Eval("content")%>   <!-- User Message Here -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Image ID="Post_Image" runat="server" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' onerror="this.style.display='none'" Height="200px" Width="300px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Like: <%#Eval("LikeCounts")%></td>
                                        <td>Comments :<%#Eval("CommentCounts")%></td>      
                                    </tr>
                                    <tr>
                                        <td style="width:50px;">
                                            <div class ="PB">
                                                <asp:ImageButton ID="Like_Button" ImageUrl="~/img/like.png" width=" 35px" heigth="35px" runat="server" OnCommand="Button_Click_Like" CommandArgument='<%# Eval("PostId") %>'/>
                                            </div>
                                        </td>
                                        <td style="width:50px">
                                            <div class ="PB">
                                                <asp:LinkButton ID="CommentDisplay_Button" runat="server" Text="Comment" OnCommand="Button_Click_Comment_Display" CommandArgument='<%# Eval("PostId") %>'/>
                                            </div>
                                            <%--<asp:ImageButton ID="CommentDisplay_Button" ImageUrl="~/img/comment.png" width=" 35px" heigth="35px" runat="server" Text="Comment" OnCommand="Button_Click_Comment_Display" CommandArgument='<%# Eval("PostId") %>'/>--%>
                                        </td>
                                        <td style="width:50px">
                                            <div class ="PB">
                                            <asp:ImageButton ID="Share_Button" ImageUrl="~/img/share.png" width=" 35px" heigth="35px" runat="server" Text="Share" OnCommand="Button_Click_Share" CommandArgument='<%# Eval("PostId") %>'/>
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
                                                            <asp:Button ID="Button_Delete" runat="server" Text="Delete" CommandArgument='<%# Eval("CommentId") %>' OnCommand="Button_Click_Comment_Delete"/>
                                                        </ItemTemplate>
                                                     </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="CommentArea" runat="server">
                                <table ID="Table_CommentArea" runat="server">
                                    <tr>
                                        <td><asp:TextBox ID="Comment_Textbox" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox></td>
                                        <td><asp:Button ID="Comment_Button" runat="server" Text="Comment" OnCommand="Button_Click_Comment" CommandArgument='<%# Eval("PostId") %>'/></td>
                                    </tr>
                                </table></asp:Panel>
                            </ItemTemplate>
                        </asp:ListView>
                        </div>
                    </div>
                </div>
            <div class ="right-menu">
                <table>
                    <tr>
                        <td colspan="2" ><h3>Current Time</h3></td>
                    </tr>
                    <tr>
                        <td> Clock </td>
                    </tr>
                    <tr>
                        <td> Adv </td>
                    </tr>
                </table>
            </div>
           </div>
        </div>
</asp:Content>