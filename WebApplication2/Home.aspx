<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <div class="rg_layout">
            <div class ="friendlist">
                            <table>
                                <tr>
                                    <td colspan="2" ><h3>Weclome</h3></td>
                                    <td colspan="2" class="td_center"><asp:Label ID="Label1" runat="server" ></asp:Label></td>
                                </tr>                           
                            </table>
                                 <asp:GridView ID="GridView_Friends" runat="server" AutoGenerateColumns="False">
                                     <Columns>
                                         <asp:BoundField DataField="User2_Id" HeaderText="UID" />
                                         <asp:BoundField DataField="fname" HeaderText="Fisrt Name" />
                                         <asp:BoundField DataField="lname" HeaderText="Last Name" />
                                         <asp:TemplateField>
                                         </asp:TemplateField>
                                     </Columns>
                                 </asp:GridView>
                                 <asp:GridView ID="Gridview_RoomList" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="IDwithChar" HeaderText="Room ID" />
                                        <asp:BoundField DataField="RoomName" HeaderText="Room Name" />
                                        <asp:TemplateField>
                                        </asp:TemplateField>
                                    </Columns>
                                  </asp:GridView>
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
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PostId" Visible="false" runat="server" Text='<%# Eval("PostId") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Profile_Image"  runat="server" width="50px" height="50px" />
                                        
                                            <%#Eval("Fname")%><%#Eval("Lname")%>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td colspan="2">
                                            <%#Eval("content")%>   <!-- User Message Here -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Post_Image" runat="server" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' onerror="this.style.display='none'" Height="200px" Width="300px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Like: <%#Eval("LikeCounts")%></td>
                                        <td>Comments :<%#Eval("CommentCounts")%></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">
                                            <asp:LinkButton ID="Like_Button" runat="server" Text="Like" OnCommand="Button_Click_Like" CommandArgument='<%# Eval("PostId") %>' />
                                            <asp:LinkButton ID="CommentDisplay_Button" runat="server" Text="Comment" OnCommand="Button_Click_Comment_Display" CommandArgument='<%# Eval("PostId") %>'/>
                                            <asp:LinkButton ID="Delete_Button" runat="server" Text="Delete" OnCommand="Button_Click_Post_Delete" CommandArgument='<%# Eval("PostId") %>'/>
                                            <asp:LinkButton ID="Share_Button" runat="server" Text="Share" OnCommand="Button_Click_Share" CommandArgument='<%# Eval("PostId") %>'/>
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
            </div>
        </div>
</asp:Content>