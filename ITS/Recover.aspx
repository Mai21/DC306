<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Recover.aspx.cs" Inherits="ITS.Recover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container">
        <h2>Please enter your UserID below.</h2>
        <form id="form1" runat="server" class="font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pt-6 pb-8">
		    <div>
			    <asp:Label ID="lbMessage" class="text-red" runat="server" Text=""></asp:Label>
		    </div>
		    <div class="relative border rounded mb-4 shadow appearance-none label-floating">
			    <asp:TextBox ID="tbUserID" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		    </div>
		    <div class="flex items-center justify-between">
			    <asp:Button ID="btnReset" class="bg-black hover:bg-gray-700 text-white py-2 px-4" runat="server" Text="Request PasswordRecovery" accesskey="2" OnClientClick="return validationRecover();"  OnClick="btnReset_Click"/>
		    </div>
	    </form>
     </div>
</asp:Content>
