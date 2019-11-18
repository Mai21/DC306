<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ITS.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<link href="Styles/login.css" rel="stylesheet" />
	<script src="https://ajax.microsoft.com/ajax/jQuery/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="Validation.js" type="text/javascript"></script>
	<title>Login</title>
</head>
<body>
	<form id="form1" runat="server" class="font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pt-6 pb-8">
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
			<asp:Button ID="btnLogin" class="bg-black hover:bg-black text-white py-2 px-4" runat="server" Text="Login" accesskey="3" OnClientClick="return validationLogin();"  OnClick="btnLogin_Click"/>
			<a class="inline-block align-baseline text-gray-500 hover:text-gray-700" href="/Recover.aspx">
				Forgot Password?
			</a>
		</div>
	</form>
	<footer class="font-sans bg-black text-white py-8 px-4">
		<div class="mx-auto max-w-xl overflow-hidden flex justify-between items-center">
			<p class="inline-block py-2 px-3 text-gray-700 text-xs"> ©2019 Tuam Academy. All rights reserved.</p>
	  </div>
	</footer>
	</body>
</html>
