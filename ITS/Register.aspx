<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ITS.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container">
    <h2>Register a new user</h2>
        <table id="table1">
	        <tr>
	            <td colspan="3" class="side-title">
                    <asp:Label ID="lbSubTitle" runat="server" Text="User Information"></asp:Label>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="3" class="side-title">
                    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
                </td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbUserID" runat="server" Text="UserID:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageUserID" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title">
                    <asp:Label ID="lbFirstName" runat="server" Text="First Name:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageFirstName" runat="server" Text=""></asp:Label></td>
	        </tr>
	        <tr>
	            <td class="side-title">
                    <asp:Label ID="lbLastName" runat="server" Text="Last Name:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageLastName" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbEmail" runat="server" Text="E-MAIL:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageEmail" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbPassword" runat="server" Text="Password:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessagePassword" runat="server" Text=""></asp:Label></td>
	        </tr>
            <tr>
	            <td class="side-title">
                    <asp:Label ID="lbPasswordComfirm" runat="server" Text="Password comfirmation:"></asp:Label>
                    </td>
	            <td>
                    <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageConfirm" runat="server" Text=""></asp:Label></td>
	        </tr>
            
	        <tr>
	            <td></td>
	            <td></td>
	            <td>
                    <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
                </td>
	        </tr>
        </table>
    </div>
</asp:Content>
