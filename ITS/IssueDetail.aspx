<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="IssueDetail.aspx.cs" Inherits="ITS.IssueDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
        <form id="form1" runat="server" class="font-sans text-sm rounded mx-auto px-8 pt-6 pb-8 w-1/2"> 
		<h2>No.<asp:Label ID="lbId" runat="server" Text=""></asp:Label> <asp:Label ID="lbTitle" runat="server" Text=""></asp:Label></h2>
        <section class="bg-white">
            <div class="container py-2 px-4">
                <div>
			        <asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		        </div>
                <div class="flex-1 overflow-hidden">
                    <div>
                      <span class="font-bold">
                          <asp:Label ID="lbFirstName" runat="server" Text=""></asp:Label>
                          <asp:Label ID="lbLastName" runat="server" Text=""></asp:Label>
                      </span>
                      <span class="text-gray-700 text-xs"><asp:Label ID="lbUserID" runat="server" Text=""></asp:Label></span>
                    </div>
                    <p class="text-black leading-normal"><asp:Label ID="lbLastUpdateDate" runat="server" Text=""></asp:Label></p>
                </div>
                <div class="relative border rounded mb-4 shadow appearance-none label-floating">
                    <asp:TextBox ID="tbDescriptionOriginal" class="w-full py-2 px-3 bg-gray-300 text-gray-700 leading-normal rounded" runat="server" Height="100px" AutoCompleteType="Disabled" ReadOnly="true" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                </div>
                <span class="text-xs">*Please add to the original text.</span>
                <div class="relative border rounded mb-4 shadow appearance-none label-floating">
                    <asp:TextBox ID="tbDescriptionAdd" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" Height="200px" AutoCompleteType="Disabled" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                </div>
		        <div class="relative border rounded mb-4 shadow appearance-none label-floating">
                    <asp:DropDownList ID="dlStatusList" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="flex items-center justify-between">
			        <asp:Button ID="btnUpdate" class="bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Update" accesskey="3" OnClick="btnUpdate_Click"/>
		        </div>
            </div>
        </section>
    </form>
</asp:Content>
