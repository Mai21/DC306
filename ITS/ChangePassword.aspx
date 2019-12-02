<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ITS.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
	<div class="container max-w-xl m-auto h-65">
        <h2>Please enter a new password below.</h2>
        <section class="bg-white">
            <div class="container py-2 px-4">
                <div>
			        <asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		        </div>
		        <div class="relative border rounded mb-4 shadow appearance-none label-floating">
			        <asp:TextBox ID="tbUserID" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" disabled="disabled" runat="server"></asp:TextBox>
		        </div>
		        <asp:Label ID="lbErrPassword" class="text-red" runat="server" Text=""></asp:Label>
                <div class="relative border rounded mb-4 shadow appearance-none label-floating"> 
			        <asp:TextBox ID="tbPassword" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		        </div>
                <asp:Label ID="lbErrConfirm" class="text-red" runat="server" Text=""></asp:Label>
                <div class="relative border rounded mb-4 shadow appearance-none label-floating"> 
			        <asp:TextBox ID="tbConfirm" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="2"></asp:TextBox>
		        </div>
		        <div class="flex items-center justify-between">
			        <asp:Button ID="btnChangePW" class="bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Change Passoword" accesskey="3" OnClientClick="return validationCW();"  OnClick="btnChangePW_Click"/>
		        </div>
            </div>
        </section>
    </div>
</asp:Content>
