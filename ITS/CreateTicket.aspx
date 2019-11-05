<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="ITS.CreateTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Ticket Title:"></asp:Label>
    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="29px" Width="543px">
        <asp:ListItem Text="I forgot my Student Password"></asp:ListItem>
        <asp:ListItem Text="I forgot my Username."></asp:ListItem>
        <asp:ListItem Text="I have No Internet Connection."></asp:ListItem>
        <asp:ListItem Text="I can't Print Files"></asp:ListItem>
        <asp:ListItem Text="I can't open my Laptop."></asp:ListItem>
        <asp:ListItem Text="I can't download a file from my Laptop."></asp:ListItem>
        <asp:ListItem Text="I can't Access my Student Portal."></asp:ListItem>
        <asp:ListItem Text="I can't Access my Facebook."></asp:ListItem>
        <asp:ListItem Text="Other reason please specify."></asp:ListItem>
    </asp:DropDownList>
&nbsp;
<br />
<br />
    <asp:Label ID="Label2" runat="server" Text="Description:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="262px" Width="543px"></asp:TextBox>
    <br />
    <div class="button">
    <div class="btnSave">
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
    </div>
    </div>
<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
</asp:Content>
