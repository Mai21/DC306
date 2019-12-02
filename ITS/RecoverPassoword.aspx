<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="RecoverPassoword.aspx.cs" Inherits="ITS.RecoverPassoword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<div id="extra" class="container font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pb-8 ">
        <section class="bg-white">
            <h2>Please enter your StudentID, new password and confirm password below.</h2>
            <div class="container py-2 px-4">
                <div>
			        <asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		        </div>
		        <div class="relative border rounded mb-4 shadow appearance-none label-floating">
			        <asp:TextBox ID="tbUserID" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server"></asp:TextBox>
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
		            <a class="inline-block align-baseline text-gray-500 hover:text-gray-700" href="/Login.aspx">
				    > Go to Login page
			        </a>
                </div>
            </div>
        </section>
   </div>

</asp:Content>
