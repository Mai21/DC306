<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TitleMaintenace.aspx.cs" Inherits="ITS.TitleMaintenace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server" class="font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pt-6 pb-8"> 
        <h2>Title Maintenance</h2>
        <section class="bg-white py-4 font-sans">
            <div id="extra" class="container">
                <div id="inputArea" class="container py-2 px-4">
		            <div>
			            <asp:Label ID="lbErrMessageTitle" class="text-red" runat="server" Text=""></asp:Label>
		            </div>
		            <div class="relative border rounded mb-4 shadow appearance-none ">
			            <asp:TextBox ID="tbTitle" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		            </div>
                    <asp:RadioButtonList ID="rblTier" class="mb-4" runat="server" RepeatColumns="2" accesskey="2">
                        <asp:ListItem Text="Tier 1" Value="0" />
                        <asp:ListItem Text="Tier 2" Value="1" />
		            </asp:RadioButtonList>
		            <div class="flex items-center justify-between">
			            <asp:Button ID="btnExecute" class="bg-black hover:bg-black text-white py-2 px-4" runat="server" Text="Add" accesskey="3" OnClientClick="return validationTitle();" OnClick="btnExecute_Click" />
		            </div>
                </div>
                <input id="buttonShowInputArea" type="button" class="bg-black hover:bg-black text-white py-2 px-4" value="Add a New Title"/>
            </div>
        </section>
        <section>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">title_name:
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                    <br />
                    tier_level:
                    <asp:Label ID="tier_levelLabel" runat="server" Text='<%# Eval("tier_level") %>' />
                    <br />
                    num:
                    <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">title_name:
                    <asp:TextBox ID="title_nameTextBox" runat="server" Text='<%# Bind("title_name") %>' />
                    <br />
                    tier_level:
                    <asp:TextBox ID="tier_levelTextBox" runat="server" Text='<%# Bind("tier_level") %>' />
                    <br />
                    num:
                    <asp:TextBox ID="numTextBox" runat="server" Text='<%# Bind("num") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">title_name:
                    <asp:TextBox ID="title_nameTextBox" runat="server" Text='<%# Bind("title_name") %>' />
                    <br />
                    tier_level:
                    <asp:TextBox ID="tier_levelTextBox" runat="server" Text='<%# Bind("tier_level") %>' />
                    <br />
                    num:
                    <asp:TextBox ID="numTextBox" runat="server" Text='<%# Bind("num") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">title_name:
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                    <br />
                    tier_level:
                    <asp:Label ID="tier_levelLabel" runat="server" Text='<%# Eval("tier_level") %>' />
                    <br />
                    num:
                    <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">title_name:
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                    <br />
                    tier_level:
                    <asp:Label ID="tier_levelLabel" runat="server" Text='<%# Eval("tier_level") %>' />
                    <br />
                    num:
                    <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT t.name AS title_name, t.tier_level, COUNT(i.id) AS num FROM titles AS t LEFT JOIN issues AS i ON i.title_id = t.id GROUP BY t.name, t.tier_level"></asp:SqlDataSource>
        </section>
    </form>
</asp:Content>
