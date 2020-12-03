<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="WebApplication2.ChatTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/chat.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Form1">
        <div class="left-menu">
            <table>
                <tr>
                    <td colspan="2">
                        <h3>Friends</h3>
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
                        <h3>ChatRooms</h3>
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
        <div class="chatbox">
            <asp:Panel CssClass="panel" runat="server">
               <asp:ScriptManager ID="ScriptManager1" runat="server" />
               <asp:updatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <asp:Timer ID="Timer" runat="server" Interval="5000" OnTick="Timer_Tick"/>
                <h2><asp:Label runat="server" ID="label_name"></asp:Label></h2>
                <div class="pre-scrollable datalist">
                    <asp:DataList ID="datalist1" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatLayout="Table">
                        <ItemTemplate>
                            <div style="display:inline-block">
                                <div class="<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "sender-image" : "receiver-image" %>" >
                                    <asp:Image ID="Post_Image" runat="server" ImageUrl='<%#"Handler1.ashx?id_Image="+ Eval("ImageID") %>' CssClass="round-image" Height="50px" Width="50px" />
                                </div>
                                <div class="<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "SenderClass" : "ReceiverClass" %> MainChatListClass">
                                    <asp:Label ID="label1" runat="server" Text='<%# Eval("SenderId").ToString() == Session["UID"].ToString() ? "You: " : Eval("Fname")+": " %>'></asp:Label>
                                    <asp:Label ID="label2" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                </ContentTemplate>
            </asp:updatePanel>
            </asp:Panel>
            <div class="chat-textbox">
                <table>
                    <tr>
                        <td style="width: 176%"><asp:TextBox ID="MessageBox" runat="server" style="width: 90%;"></asp:TextBox></td>
                        <td><asp:Button ID="Button_Send" runat="server" Text="Send" onclick="Button_Click_Send"/></td>
                    </tr>                         
                </table>
            </div>
        </div>
        <div class="right-menu">
            <table>
                 <tr>
                    <td>
                        <h3>You have ...</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label_display" Text="No new Notifications" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <h3>Current time is</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="ClockArea">
                        <table id="Clock">
                            <tr>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="U1" runat="server">
                                    <ContentTemplate>
                                    <h1><asp:Label ID="Time" runat="server" /></h1>
                                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer_Tick2" /> 
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
                        <h3>Adv</h3> 
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
