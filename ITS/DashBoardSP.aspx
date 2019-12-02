<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DashBoardSP.aspx.cs" Inherits="ITS.DashBoardSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <h1 class="mx-6">Hello, Tech Support</h1>
    <section class="py-4 my-8 px-8 pt-6 pb-8 h-99">
        <div class="container max-w-xl m-auto flex flex-wrap md:flex-no-wrap items-center justify-between bg-gray-300 px-3 py-3">
            <div class="flex w-full justify-start justify-center md:justify-start">
                <div class="flex flex-col px-8 border-r items-center">
                    <h1 class=""><asp:Label ID="lbNewIssueNumber" runat="server" Text=""></asp:Label></h1>
                    <span class="text-xs block uppercase text-gray-900 tracking-wide mt-1">New Issues</span>
                </div>
                <div class="flex flex-col border-r px-8 items-center">
                    <h1 class=""><asp:Label ID="lbPendingNumber" runat="server" Text=""></asp:Label></h1>
                    <span class="text-xs block uppercase text-gray-900 tracking-wide mt-1">Pending</span>
                </div>
                <div class="flex flex-col px-8 items-center">
                    <h1 class=""><asp:Label ID="lbInspectingNumber" runat="server" Text=""></asp:Label></h1>
                    <span class="text-xs block uppercase text-gray-900 tracking-wide mt-1">Inspecting</span>
                </div>
            </div>
            <asp:Button ID="btnGoTasks" class="bg-black hover:bg-gray-700 text-white py-2 px-4 mx-3" runat="server" Text="Go Tasks" accesskey="4" OnClick="btnGoTasks_Click"/>
            </div>
    </section>
</asp:Content>
