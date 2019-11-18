<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DashBoardSP.aspx.cs" Inherits="ITS.DashBoardSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <h1>Hello, Tech Support</h1>
    <ul class="font-sans list-none p-0 container m-auto text-gray-900">
    <% for(int y=1; y<=9; ++y)
      { %>
         <li class="border-b border-gray-300 flex justify-between items-center py-4">
			<div class="flex items-start w-2/5">
				<div class="w-10 h-10 rounded mr-3">
					<div class="rounded-full h-10 w-10 bg-gray-300 m-auto"></div>
				</div>
				<div class="flex-1 overflow-hidden">
					<div>
						<span class="font-bold">Logan Slayer</span>
						<span class="text-gray-700 text-xs">@logan</span>
					</div>
					<p class="text-black leading-normal"><% Response.Write(y);%>/10/2019</p>
				</div>
			</div>
			<p class="w-2/5">UI/UX Designer @Squarespace.</p>
			<label for="status" class="font-bold w-1/5 text-right">Active</label>
		</li>
   
    <%  } %>
   
       
	</ul>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Eval("first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                </td>
                <td>
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="title_nameTextBox" runat="server" Text='<%# Bind("title_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="title_nameTextBox" runat="server" Text='<%# Bind("title_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Eval("first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                </td>
                <td>
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">first_name</th>
                                <th runat="server">last_name</th>
                                <th runat="server">user_id</th>
                                <th runat="server">title_name</th>
                                <th runat="server">description</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Eval("first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Eval("last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                </td>
                <td>
                    <asp:Label ID="title_nameLabel" runat="server" Text='<%# Eval("title_name") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT u.first_name, u.last_name, i.user_id, t.name AS title_name, i.description FROM issues AS i INNER JOIN users AS u ON i.user_id = u.id INNER JOIN titles AS t ON i.title_id = t.id"></asp:SqlDataSource>


</asp:Content>
