


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LoginSP.aspx.cs" Inherits="ITS.LoginSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
            .auto-style2 {
                width: 181px;
            }
            .auto-style3 {
                width: 338px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="title">
        <h1>Login</h1>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="extra" class="container">
    <h2>Please enter your login details below</h2>
        <table id="table1">
	        <tr>
	            <td colspan="3" class="side-title">
                    <asp:Label ID="lbErrMessage" runat="server" Text=""></asp:Label>
                </td>
	        </tr>
	        <tr>
	            <td class="side-title" style="width: 181px">
                    <asp:Label ID="lbUserID" runat="server" Text="User ID:"></asp:Label>
                    </td>
	            <td class="auto-style3">
                    <asp:TextBox ID="txtUserID" runat="server" accesskey="1"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageUserID" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title" style="width: 181px">
                    <asp:Label ID="lbPassowrd" runat="server" Text="Password:"></asp:Label>
                    </td>
	            <td class="auto-style3">
                    <asp:TextBox ID="txtPassword" runat="server" accesskey="2"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessagePassword" runat="server" Text=""></asp:Label></td>
	        </tr>
            
           
	        <tr>
	            <td class="auto-style2"></td>
	            <td class="auto-style3"></td>
	            <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" accesskey="3" OnClick="btnLogin_Click" />
                </td>
	        </tr>
        </table>
    </div>
    <div id="extra2" class="container">
        <table id="table2">
            <tr>
                <td><h2>Forgot UserID?</h2></td>
                <td><h2>Forgot password?</h2></td>
            </tr>
            <tr>
                <td rowspan="2"><h2>UserID and Password should be provided in the beginning of your course. Ask Tech Support!</h2></td>
                <td><h2>We can send your password to your email address.</h2></td>
            </tr>
            <tr>
                <td><a href="/Recover.aspx" accesskey="5" title="" class="button">Recover password</a></td>
            </tr>
        </table>
    </div>

</asp:Content>
