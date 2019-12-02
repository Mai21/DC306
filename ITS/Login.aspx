<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ITS.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container w-full items-center max-w-md mx-auto my-8 px-8 pt-6 pb-8">
		<div>
			<asp:Label ID="lbErrMessageUserID" class="text-red" runat="server" Text=""></asp:Label>
		</div>
		<div class="relative border rounded mb-4 shadow appearance-none label-floating">
			<asp:TextBox ID="tbUserID" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		</div>
        <div>
			<asp:Label ID="lbErrMessagePassword" class="text-red" runat="server" Text=""></asp:Label>
		</div>
		<div class="relative border rounded mb-4 shadow appearance-none label-floating"> 
			<asp:TextBox ID="tbPassword" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="2"></asp:TextBox>
		</div>
		<div class="flex items-center justify-between">
			<asp:Button ID="btnLogin" class="bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Login" accesskey="3" OnClientClick="return validationLogin();"  OnClick="btnLogin_Click"/>
		</div>
    </div>
</asp:Content>
