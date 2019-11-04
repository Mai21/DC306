<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="ITS.CreateTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Ticket Title:"></asp:Label>
    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="29px" Width="543px">
        <asp:ListItem Selected="True">I forgot my Student Password</asp:ListItem>
        <asp:ListItem>I forgot my Username</asp:ListItem>
        <asp:ListItem>I have No Intenet Connection</asp:ListItem>
        <asp:ListItem>I wasn&#39;t able to print.</asp:ListItem>
        <asp:ListItem>I can&#39;t open my Laptop.</asp:ListItem>
        <asp:ListItem>I can&#39;t download a file.</asp:ListItem>
        <asp:ListItem>I can&#39;t access student portal.</asp:ListItem>
        <asp:ListItem>I can&#39;t access Facebook.</asp:ListItem>
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
