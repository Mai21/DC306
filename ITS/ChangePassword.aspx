<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ITS.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container">
        <h2>Please enter your current password and your new password below.</h2>
        <table id="table1">
	        <tr>
	            <td colspan="3" class="side-title">
                    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
                </td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbCurrentPassword" runat="server" Text="CurrentPassword:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtCurrentPassword" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageCurrentPassword" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title">
                    <asp:Label ID="lbPassword" runat="server" Text="New Password:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessagePassword" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbPasswordComfirm" runat="server" Text="New Password comfirmation:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageConfirm" runat="server" Text=""></asp:Label></td>
	        </tr>
           
	        <tr>
	            <td class="auto-style2"></td>
	            <td class="auto-style3"></td>
	            <td>
                    <asp:Button ID="btnChange" runat="server" Text="Change Password" accesskey="2" OnClick="btnChange_Click" />
                </td>
	        </tr>
        </table>
    </div>
</asp:Content>
