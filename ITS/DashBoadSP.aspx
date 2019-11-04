<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DashBoadSP.aspx.cs" Inherits="ITS.DashBoadSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login Successful!</h1>
    <div id="extra" class="container">    
    <table id="table1">
	        <tr>
	            <td colspan="2" class="side-title">
                    <asp:Label ID="lbSubTitle" runat="server" Text="User Information"></asp:Label>
	            </td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbUserID" runat="server" Text="UserID:"></asp:Label>
                </td>
	            <td><asp:Label ID="lbResultUserID" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title">
                    <asp:Label ID="lbFirstName" runat="server" Text="First Name:"></asp:Label>
                </td>
	            <td><asp:Label ID="lbResultFirstName" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title">
                    <asp:Label ID="lbLastName" runat="server" Text="Last Name:"></asp:Label>
                </td>
	            <td><asp:Label ID="lbResultLastName" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbEmail" runat="server" Text="E-MAIL:"></asp:Label>
                </td>
	            <td><asp:Label ID="lbResultEmail" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbPassword" runat="server" Text="Password:"></asp:Label>
                </td>
	            <td><asp:Label ID="lbResultPassword" runat="server" Text=""></asp:Label></td>
	        </tr>
        </table>
    </div>
    <div id="extra2" class="container">
        <table id="table2">
            <tr>
	            <td><a href="/ChangePassword.aspx" accesskey="1" title="" class="button">Change password</a></td>
                <td><a href="/Isuue.aspx" accesskey="2" title="" class="button">Add an issue</a></td>
                <td><a href="/Isuue.aspx" accesskey="3" title="" class="button">Edit issues</a></td>
	        </tr>
        </table>
    </div>


</asp:Content>
