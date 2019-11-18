<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="ITS.CreateTicket" %>
        
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
        </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
   
     <%-- This is the main form of Creating Ticket --%>
    <form id="form1" runat="server" class="font-sans text-sm rounded w-full max-w-md mx-auto my-8 px-8 pt-6 pb-8">   
       
        <%-- This is the label for the DropdownList --%>
        <div class="w-full text-gray-900 mt-6 md:mt-0 leading-normal">
           <h4 class="py-2 uppercase font-bold tracking-wide">What is your Issue About?</h4>
        </div>
        
        <%-- This is the DropdownList --%>
        <div class="relative border rounded mb-4 shadow appearance-none label-floating">
            <asp:DropDownList ID="IssueList" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server">
                <asp:ListItem>I forgot my Student Portal Password.</asp:ListItem>
                <asp:ListItem>I forgot my Student Portal Username.</asp:ListItem>
                <asp:ListItem>I cant connect to the Internet / WIFI</asp:ListItem>
                <asp:ListItem>I cant print document / files.</asp:ListItem>
                <asp:ListItem>I cant open my Laptop.</asp:ListItem>
                <asp:ListItem>I cant download anything on my Laptop.</asp:ListItem>
                <asp:ListItem>I cant access my Student Portal.</asp:ListItem>
                <asp:ListItem>I cant access my grades.</asp:ListItem>
                <asp:ListItem>I want to change my Student Portal Password.</asp:ListItem>
                <asp:ListItem>I cant view my Attendance Portal</asp:ListItem>
                <asp:ListItem>I cant access social media sites</asp:ListItem>
                <asp:ListItem>My issue is not on the lists/ Other Reasons.</asp:ListItem>
            </asp:DropDownList>
        </div>

        <%-- This is the label for the Textbox --%>
        <div class="w-full text-gray-900 mt-6 md:mt-0 leading-normal">
            <h4 class="py-2 uppercase font-bold tracking-wide">Please briefly describe what happen</h4>
        </div>

        <%-- This is the Textbox Textarea --%>
        <div class="relative border rounded mb-4 shadow appearance-none label-floating">
            <asp:TextBox ID="txtboxDesc" class="w-full py-2 px-3 text-gray-700 leading-normal rounded" runat="server" Height="200px" AutoCompleteType="Disabled" TextMode="MultiLine" Wrap="true"></asp:TextBox>
        </div>


        <%-- This is the Button for Submit --%>
        <div class="flex items-center justify-between" style="float:right">
            <asp:Button ID="btnSubmit" class="bg-black hover:bg-black text-white py-2 px-4" runat="server" Text="Submit"  Width="70px" BackColor="#333333" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" OnClick="btnSubmit_Click"/>
        </div>

         <%-- This is the Button for Clear --%>
        <div class="flex items-center justify-between" style="float:right">
            <asp:Button ID="btnClear" class="bg-black hover:bg-black text-white py-2 px-4" runat="server" Text="Clear" Width="70px" BackColor="#333333" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" OnClick="btnSubmit_Click"/>
        </div>
         
    </form>
</asp:Content>
