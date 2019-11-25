<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Issues.aspx.cs" Inherits="ITS.Issues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server" class="font-sans text-sm rounded w-full mx-auto"> 
        <h2>Issue List</h2>
        <section class="bg-gray-300 py-4 my-8 px-8 pt-6 pb-8">
            <div class="hf"><asp:HiddenField ID="hfTargetId" runat="server" /></div>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                        <asp:Label ID="idLabel" class="w-1/12 px-3" runat="server" Text='<%# Eval("id") %>' />
                        <asp:Label ID="first_nameLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("first_name") %>' />
                        <asp:Label ID="last_nameLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("last_name") %>' />
                        <asp:Label ID="user_idLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("user_id") %>' />
                        <asp:Label ID="title_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("title_name") %>' />
                        <asp:Label ID="descriptionLabel" runat="server" class="w-3/12 px-3" Text='<%# Eval("description") %>' />
                        <asp:Label ID="statusLabel" runat="server" class="w-1/12 px-3" Text='<%# (ITS.CommonUtil.ISSUSTATUS)(Eval("status")) %>' />
                        <asp:Label ID="updated_dateLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("updated_date") %>' />
                        <asp:Button ID="btnDetail" class="w-1/12 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="Detail" OnClientClick="return setIssue(this);" OnClick="btnDetail_Click" /> 
                    </li>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <ItemSeparatorTemplate>
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                        <asp:Label ID="idLabel" class="w-1/12 px-3" runat="server" Text='<%# Eval("id") %>' />
                        <asp:Label ID="first_nameLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("first_name") %>' />
                        <asp:Label ID="last_nameLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("last_name") %>' />
                        <asp:Label ID="user_idLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("user_id") %>' />
                        <asp:Label ID="title_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("title_name") %>' />
                        <asp:Label ID="descriptionLabel" runat="server" class="w-3/12 px-3" Text='<%# Eval("description") %>' />
                        <asp:Label ID="statusLabel" runat="server" class="w-1/12 px-3" Text='<%# (ITS.CommonUtil.ISSUSTATUS)(Eval("status")) %>' />
                        <asp:Label ID="updated_dateLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("updated_date") %>' />
                        <asp:Button ID="btnDetail" class="w-1/12 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="Detail" OnClientClick="return setIssue(this);" OnClick="btnDetail_Click" /> 
                
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" class="font-sans list-none p-0 container m-auto text-gray-900" runat="server" style="">
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                            <asp:Label ID="idLabelHead" class="w-1/12 px-3" runat="server" Text='ID' />
                            <asp:Label ID="first_nameLabelHead" class="w-1/12 px-3" runat="server" Text='First Name' />
                            <asp:Label ID="last_nameLabelHead" class="w-1/12 px-3" runat="server" Text='Last Name' />
                            <asp:Label ID="user_idLabelHead" class="w-1/12 px-3" runat="server" Text='UserID' />
                            <asp:Label ID="title_nameLabelHead" class="w-2/12 px-3" runat="server" Text='Title' />
                            <asp:Label ID="descriptionLabelHead" class="w-3/12 px-3" runat="server" Text='Description' />
                            <asp:Label ID="statusLabelHead" class="w-1/12 px-3" runat="server" Text='Status' />
                            <asp:Label ID="update_dateLabelHead" class="w-1/12 px-3" runat="server" Text='Update Date' />
                            <div class="w-1/12"></div>
                        </li>
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div class="py-4">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="bg-black hover:bg-gray-700 text-white py-2 px-4" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="bg-black hover:bg-gray-700 text-white py-2 px-4" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                
            </asp:ListView>
        </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT i.id, u.first_name, u.last_name, i.user_id, t.name AS title_name, i.description, i.status, i.updated_date FROM issues AS i INNER JOIN users AS u ON i.user_id = u.id INNER JOIN titles AS t ON i.title_id = t.id"></asp:SqlDataSource>
</form>
</asp:Content>
