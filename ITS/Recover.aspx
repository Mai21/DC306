<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Recover.aspx.cs" Inherits="ITS.Recover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<div id="extra" class="container">
    <h2>Please enter your email address below.</h2>
        <table id="table1">
	        <tr>
	            <td colspan="3" class="side-title">
                    <asp:Label ID="lbErrMessage" runat="server" Text=""></asp:Label>
                </td>
	        </tr>
	        <tr>
	            <td class="side-title" style="width: 181px">
                    <asp:Label ID="lbEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
	            <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" accesskey="1"></asp:TextBox>
                </td>
	            <td><asp:Label ID="lbErrMessageEmail" runat="server" Text=""></asp:Label></td>
	        </tr>
           
	        <tr>
	            <td class="auto-style2"></td>
	            <td class="auto-style3"></td>
	            <td>
                    <asp:Button ID="btnReset" runat="server" Text="Reset My Password" accesskey="2" OnClick="btnReset_Click" />
                </td>
	        </tr>
        </table>
    </div>
</asp:Content>
