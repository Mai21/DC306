<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserMaintenance.aspx.cs" Inherits="ITS.UserMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="Styles/Javascript/A_initialize.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server" class="font-sans text-sm rounded w-full mx-auto"> 
        <h2>User Maintenance</h2>
            <section class="bg-white py-4 my-8 px-8 pt-6 pb-8 w-1/2">
                <div class="container py-2 px-4">
                    <div>
			            <asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		            </div>
                    <div id="inputArea" class="container py-2 px-4">
                        <div>
                            <div class="hf"><asp:HiddenField ID="hfFlg" runat="server" /></div>
                            <div class="hf"><asp:HiddenField ID="hfTargetId" runat="server" /></div>
		                </div>
		                <div class="relative border rounded mb-4 shadow appearance-none flex">
			                <asp:TextBox ID="tbUserID" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrUserID" class="text-red" runat="server" Text=""></asp:Label>
                        <div class="relative border rounded mb-4 shadow appearance-none ">
			                <asp:TextBox ID="tbFirstName" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrFirstName" class="text-red" runat="server" Text=""></asp:Label>
                        <div class="relative border rounded mb-4 shadow appearance-none ">
			                <asp:TextBox ID="tbLastName" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrLastName" class="text-red" runat="server" Text=""></asp:Label>
                        <div class="relative border rounded mb-4 shadow appearance-none ">
			                <asp:TextBox ID="tbEmail" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrEmail" class="text-red" runat="server" Text=""></asp:Label>
                        <div class="relative border rounded mb-4 shadow appearance-none ">
			                <asp:TextBox ID="tbPassword" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrPassword" class="text-red" runat="server" Text=""></asp:Label>
                        <div class="relative border rounded mb-4 shadow appearance-none ">
			                <asp:TextBox ID="tbConfirm" class="w-full py-2 px-3 text-gray-700 leading-normal rounded tb" runat="server"></asp:TextBox>
		                </div>
                        <asp:Label ID="lbErrConfirm" class="text-red" runat="server" Text=""></asp:Label>
                        <div>
                            <asp:RadioButtonList ID="rblAvailability" class="mb-4" runat="server" RepeatColumns="2" accesskey="2">
                                <asp:ListItem Text="Available" Value="0" />
                                <asp:ListItem Text="Unavailable" Value="1" />
		                    </asp:RadioButtonList>
		                </div>
                        <div class="flex items-center">
			                <asp:Button ID="btnExecute" class="bg-black hover:bg-black text-white mx-3 py-2 px-4" runat="server" Text="Add" accesskey="3" OnClientClick="return validationUser();return false;" OnClick="btnExecute_Click" />
		                    <input id="btnClear" type="button" class="bg-black hover:bg-gray-700 text-white mx-3 py-2 px-4" value="Clear" OnClick="clearUser();" />
                        </div>
                    </div>
                    <input id="btnShowInputArea" type="button" class="bg-black hover:bg-gray-700 text-white py-2 px-4" value="Add a New User"/>
              </div>
           </section>
           <section class="bg-gray-300 py-4 my-8 px-8 pt-6 pb-8">
               <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" DataKeyNames="id">
                    <AlternatingItemTemplate>
                        <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                            <asp:Label ID="idLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("id") %>' />
                            <asp:Label ID="first_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("first_name") %>' />
                            <asp:Label ID="last_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("last_name") %>' />
                            <asp:Label ID="e_mailLabel" runat="server" class="w-3/12 px-3" Text='<%# Eval("e_mail") %>' />
                            <asp:Label ID="authorization_level_idLabel" class="w-1/12 px-3" runat="server" Text='<%# Eval("authorization_level_id") %>' />
                            <asp:Label ID="availabilityLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("availability") %>' />
                            <div class="w-2/12 flex items-center">
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="Edit" OnClientClick='return editUser(this);'/>
                                <asp:Button ID="btnChangePW" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="ChangePW" OnClientClick="return setUser(this);" OnClick="btnChangePW_Click" /> 
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
                            <asp:Label ID="idLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("id") %>' />
                            <asp:Label ID="first_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("first_name") %>' />
                            <asp:Label ID="last_nameLabel" runat="server" class="w-2/12 px-3" Text='<%# Eval("last_name") %>' />
                            <asp:Label ID="e_mailLabel" runat="server" class="w-3/12 px-3" Text='<%# Eval("e_mail") %>' />
                            <asp:Label ID="authorization_level_idLabel" class="w-1/12 px-3" runat="server" Text='<%# Eval("authorization_level_id") %>' />
                            <asp:Label ID="availabilityLabel" runat="server" class="w-1/12 px-3" Text='<%# Eval("availability") %>' />                       
                            <div class="w-2/12 flex items-center">
                                <asp:Button ID="btnEdit" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="Edit" OnClientClick="return editUser(this);"/>
                                <asp:Button ID="btnChangePW" class="w-1/2 bg-black hover:bg-gray-700 text-white py-2 mx-1" runat="server" Text="ChangePW" OnClientClick="return setUser(this);" OnClick="btnChangePW_Click" /> 
                            </div>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" class="font-sans list-none p-0 container m-auto text-gray-900" runat="server" style="">
                            <li class="border-b border-gray-300 bg-white flex justify-between items-center py-3 px-4 mt-3">
                                <asp:Label ID="idLabelHead" class="w-1/12 px-3" runat="server" Text='User ID' />
                                <asp:Label ID="first_nameLabelHead" class="w-2/12 px-3" runat="server" Text='First Name' />
                                <asp:Label ID="last_nameLabelHead" class="w-2/12 px-3" runat="server" Text='Last Name' />
                                <asp:Label ID="e_mailLabelHead" class="w-3/12 px-3" runat="server" Text='Email' />
                                <asp:Label ID="authorization_level_idLabelHead" class="w-1/12 px-3" runat="server" Text='Auth Level' />
                                <asp:Label ID="availabilityLabelHead" class="w-1/12 px-3" runat="server" Text='Availability' />
                                <div class="w-2/12"></div>
                            </li>
                            <li id="itemPlaceholder" runat="server">
                            </li>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITSConnectionString %>" SelectCommand="SELECT [id], [first_name], [last_name], [e_mail], [authorization_level_id], [availability] FROM [users] ORDER BY [updated_date] DESC"></asp:SqlDataSource>
            </section>
    </form>
</asp:Content>
