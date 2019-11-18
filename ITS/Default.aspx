<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
  <div class="dashboard" style="padding-left:20px"> </div>
  <h1>Hi Tuam Student</h1>
    <p>Welcome to ServiceWow Portal where your technical issues are being resolve within 24 hours.</p>
    <p>The Time Now is @DateTime.Now</p>
</asp:Content>
