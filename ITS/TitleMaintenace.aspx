<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TitleMaintenace.aspx.cs" Inherits="ITS.TitleMaintenace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div id="extra" class="container">
    <h2>Title Maintenance</h2>
        <div id="inputArea" class="container">
		    <div>
			    <asp:Label ID="lbErrMessageTitle" class="text-red" runat="server" Text=""></asp:Label>
		    </div>
		    <div class="relative border rounded mb-4 shadow appearance-none label-floating">
			    <asp:TextBox ID="tbTitle" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" accesskey="1"></asp:TextBox>
		    </div>
            <asp:RadioButtonList ID="rblTier" runat="server" RepeatColumns="2" accesskey="2">
                <asp:ListItem Text="Tier 1" Value="0" />
                <asp:ListItem Text="Tier 2" Value="1" />
		    </asp:RadioButtonList>
		    <div class="flex items-center justify-between">
			    <asp:Button ID="btnExecute" class="bg-black hover:bg-black text-white py-2 px-4" runat="server" Text="Add" accesskey="3" OnClientClick="return validationTitle(this);"  OnClick="btnExecute_Click"/>
		    </div>
        </div>
        <input id="buttonShowInputArea" type="button" class="bg-black hover:bg-black text-white py-2 px-4" value="Add a New Title"/>
	    
        <table id="table1">
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
