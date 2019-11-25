<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TitleMaintenace.aspx.cs" Inherits="ITS.TitleMaintenace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="Styles/Javascript/A_title.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server" class="font-sans text-sm rounded w-full mx-auto"> 
        <h2>Title Maintenance</h2>
        <section class="bg-white py-4 my-8 px-8 pt-6 pb-8">
            <div id="extra" class="container ">
        <section class="bg-white py-4 my-8 px-8 pt-6 pb-8 w-1/2">
            <div id="extra" class="container ">
                <div id="inputArea" class="container py-2 px-4">
                    <div>
			            <asp:Label ID="lbErrMessageTitle" class="text-red" runat="server" Text=""></asp:Label>
                    <div>
			            <asp:Label ID="lbMessage" class="text-red lb" runat="server" Text=""></asp:Label>
		            </div>
                    <div>
                        <div class="hf"><asp:HiddenField ID="hfTitleId" runat="server" /></div>
		            </div>
                    <div class="relative border rounded mb-4 shadow appearance-none ">
			            <asp:TextBox ID="tbTitle" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server" accesskey="1"></asp:TextBox>
                    <asp:HiddenField ID="hdTitleId" runat="server" />
		            <div class="relative border rounded mb-4 shadow appearance-none ">
			            <asp:TextBox ID="tbTitle" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		            </div>
                    <asp:RadioButtonList ID="rblTier" class="mb-4" runat="server" RepeatColumns="2" accesskey="2">
                        <asp:ListItem Text="Tier 1" Value="0" />
                        <asp:ListItem Text="Tier 2" Value="1" />
		            </asp:RadioButtonList>
		            <div class="flex items-center">
			            <asp:Button ID="btnExecute" class="bg-black hover:bg-gray-700 text-white mx-3 py-2 px-4" runat="server" Text="Add" accesskey="3" OnClientClick="return validationTitle();" OnClick="btnExecute_Click" />
		                <input id="btnClear" type="button" class="bg-black hover:bg-gray-700 text-white mx-3 py-2 px-4" value="Clear" />
                    </div>
                </div>
                <input id="btnShowInputArea" type="button" class="bg-black hover:bg-gray-700 text-white py-2 px-4" value="Add a New Title"/>
            </div>
                    <div>
                        <asp:RadioButtonList ID="rblTier" class="mb-4 rb" runat="server" RepeatColumns="2" accesskey="2">
                            <asp:ListItem Text="Tier 1" Value="0" />
                            <asp:ListItem Text="Tier 2" Value="1" />
		                </asp:RadioButtonList>
		            </div>
                    <div class="flex items-center">
			            <asp:Button ID="btnExecute" class="bg-black hover:bg-gray-700 text-white mx-3 py-2 px-4" runat="server" Text="Add" accesskey="3" OnClientClick="return validationTitle();" OnClick="btnExecute_Click" />
		                <input id="btnClear" type="button" class="bg-black hover:bg-gray-700 text-white mx-3 py-2 px-4" value="Clear" />
                    </div>
                </div>
                <input id="btnShowInputArea" type="button" class="bg-black hover:bg-gray-700 text-white py-2 px-4" value="Add a New Title"/>
            </div>
        </section>
        <section class="bg-gray-300 py-4 my-8 px-8 pt-6 pb-8">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                    <AlternatingItemTemplate>
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-4 px-4 mt-3">
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="idLabel" class="w-1/2 px-3" runat="server" Text='<%# Eval("id") %>' />
                                <asp:Label ID="tier_levelLabel" class="w-1/2 px-3" runat="server" Text='<%# (ITS.CommonUtil.TIERLEVEL)(Eval("tier_level")) %>' />
                            </div>
                            <asp:Label ID="title_nameLabel" class="w-3/5 px-3" runat="server" Text='<%# Eval("title_name") %>' />
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="numLabel" class="w-1/2 px-3" runat="server" Text='<%# Eval("num") %>' />
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text='Edit' OnClientClick='<%# "return editTitle(this," + Eval("tier_level") + ")"%>'/>
                            </div>
                       </li>
                    </AlternatingItemTemplate>
                
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                
                    <ItemSeparatorTemplate>
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-4 px-4 mt-3">
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="idLabel" class="px-3 w-1/2" runat="server" Text='<%# Eval("id") %>' />
                                <asp:Label ID="tier_levelLabel" class="px-3 w-1/2" runat="server" Text='<%# (ITS.CommonUtil.TIERLEVEL)(Eval("tier_level")) %>' />
                            </div> 
                            <asp:Label ID="title_nameLabel" class="px-3 w-3/5" runat="server" Text='<%# Eval("title_name") %>' />
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">    
                                <asp:Label ID="numLabel" class="px-3 w-1/2" runat="server" Text='<%# Eval("num") %>' />
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Edit" OnClientClick='<%# "return editTitle(this," + Eval("tier_level") + ")"%>'/>
                            </div> 
                       </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" class="font-sans list-none p-0 container m-auto text-gray-900">
                            <li class="border-b border-gray-300 bg-white flex justify-between items-center py-4 px-4 mt-3">
                                <div class="flex-1 overflow-hidden w-1/5 justify-between">    
                                    <asp:Label ID="idLabelHead" class="w-1/2 px-3" runat="server" Text='No.' />
                                    <asp:Label ID="tier_levelLabelHead" class="w-1/2 px-3" runat="server" Text='Tier Level' />
                                </div>
                                <asp:Label ID="title_nameLabelHead" class="w-3/5 px-3" runat="server" Text='Title' />
                                <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                    <asp:Label ID="numLabelHead" class="w-1/2 px-3" runat="server" Text='Registered Issues' />
                                    <div class="w-1/2"></div>
                                </div>
                            </li>
                            <li runat="server" id="itemPlaceholder" /></li>
                        </ul>
                    
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT t.id, t.name AS title_name, t.tier_level, COUNT(i.id) AS num FROM titles AS t LEFT JOIN issues AS i ON i.title_id = t.id GROUP BY t.id, t.name, t.tier_level"></asp:SqlDataSource>
            </section>
        <section class="bg-gray-300 py-4 my-8 px-8 pt-6 pb-8">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                    <AlternatingItemTemplate>
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="idLabel" class="w-1/2 px-3" runat="server" Text='<%# Eval("id") %>' />
                                <asp:Label ID="tier_levelLabel" class="w-1/2 px-3" runat="server" Text='<%# (ITS.CommonUtil.TIERLEVEL)(Eval("tier_level")) %>' />
                            </div>
                            <asp:Label ID="title_nameLabel" class="w-3/5 px-3" runat="server" Text='<%# Eval("title_name") %>' />
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="numLabel" class="w-1/2 px-3" runat="server" Text='<%# Eval("num") %>' />
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text='Edit' OnClientClick='<%# "return editTitle(this," + Eval("tier_level") + ")"%>'/>
                            </div>
                       </li>
                    </AlternatingItemTemplate>
                
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                
                    <ItemSeparatorTemplate>
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                <asp:Label ID="idLabel" class="px-3 w-1/2" runat="server" Text='<%# Eval("id") %>' />
                                <asp:Label ID="tier_levelLabel" class="px-3 w-1/2" runat="server" Text='<%# (ITS.CommonUtil.TIERLEVEL)(Eval("tier_level")) %>' />
                            </div> 
                            <asp:Label ID="title_nameLabel" class="px-3 w-3/5" runat="server" Text='<%# Eval("title_name") %>' />
                            <div class="flex-1 overflow-hidden w-1/5 justify-between">    
                                <asp:Label ID="numLabel" class="px-3 w-1/2" runat="server" Text='<%# Eval("num") %>' />
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Edit" OnClientClick='<%# "return editTitle(this," + Eval("tier_level") + ")"%>'/>
                            </div> 
                       </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" class="font-sans list-none p-0 container m-auto text-gray-900">
                            <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                                <div class="flex-1 overflow-hidden w-1/5 justify-between">    
                                    <asp:Label ID="idLabelHead" class="w-1/2 px-3" runat="server" Text='No.' />
                                    <asp:Label ID="tier_levelLabelHead" class="w-1/2 px-3" runat="server" Text='Tier Level' />
                                </div>
                                <asp:Label ID="title_nameLabelHead" class="w-3/5 px-3" runat="server" Text='Title' />
                                <div class="flex-1 overflow-hidden w-1/5 justify-between">
                                    <asp:Label ID="numLabelHead" class="w-1/2 px-3" runat="server" Text='Registered Issues' />
                                    <div class="w-1/2"></div>
                                </div>
                            </li>
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT t.id, t.name AS title_name, t.tier_level, COUNT(i.id) AS num FROM titles AS t LEFT JOIN issues AS i ON i.title_id = t.id GROUP BY t.id, t.name, t.tier_level"></asp:SqlDataSource>
            </section>
    </form>
</asp:Content>
