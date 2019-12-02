<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Recover.aspx.cs" Inherits="ITS.Recover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pt-6 pb-8 ">
        <h2>Please enter your Registered Email below.</h2>
		<div>
			<asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		</div>
		<div class="relative border rounded mb-4 shadow appearance-none label-floating">
			<asp:TextBox ID="tbEmail" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		</div>
		<div class="flex items-center justify-between">
			<asp:Button ID="btnReset" class="bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Request PasswordRecovery" accesskey="2" OnClientClick="return validationRecover();"  OnClick="btnReset_Click"/>
		    <a class="inline-block align-baseline text-gray-500 hover:text-gray-700" href="/Login.aspx">
				> Go to Login page
			</a>
        </div>
   </div>
</asp:Content>
