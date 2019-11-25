<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
  <div class="dashboard" style="padding-left:20px"> </div>
    <h1>Hi,  <asp:Label ID="lbFirstName" runat="server" Text="Tuam Student"></asp:Label></h1>
    <p>Welcome to ServiceWow Portal where your technical issues are being resolve within 24 hours.</p>
    
    <section class="my-8 font-sans container max-w-xl m-auto flex flex-col md:flex-row sm:items-center">
     <div class="w-full md:w-1/2 flex flex-col justify-center items-start px-6 py-0 md:py-8 md:px-8 lg:items-start">
        <label for="tagline" class="uppercase tracking-wide text-gray-700 font-bold">Values of Tuam Academy</label>
        <h1 class="mt-2 mb-4 font-medium">An internationally accredited Private Institution that is dedicated to innovation and excellence in the service of God and Country.</h1>
            <p class="leading-normal mb-4 text-gray-700">Tuam Academy is a leading New Zealand training provider offering students the opportunity to gain the relevant education and skills to succeed in work and life. We have been a registered Private Training Establishment (PTE) since 1996 and are one of the largest NZQA-accredited PTEs in New Zealand.</p>
     </div>
  <div class="w-full md:w-1/2 flex flex-row md:flex-col justify-between md:justify-center items-center p-2 md:p-8 items-center md:items-start">
    <div class="flex items-center sm:border-r md:border-b md:border-r-0 p-4 w-1/2 md:w-auto">
     
      <div class="">
        <h2 class="text-black font-medium">About Tuam Academy Helpdesk Online</h2>
        <p class="text-gray-700 leading-normal">Tuam Academy is a duly incorporated company which owns and operations registered training providers established as a private training establishment under the Education Act 1989 whose address for service is in Tuam Street Christchurch. Tuam Academy consists of: Tuam Academy English Limited, Tuam Academy Hospitality & Healthcare Limited, and Tuam Academy Business & Technology Limited.</p>
      </div>
    </div>
    <div class="flex items-center p-4 w-1/2 md:w-auto">
      <div class="">
        <h2 class="text-black font-medium">Career Support</h2>
        <p class="text-gray-700 leading-normal">Our Tuam Academy Career Support team will support and guide you on your employment journey. A range of workshops and one to one support is provided around your curriculum vitae (CV), cover letter, job search, interview skills and more.</p>
      </div>
    </div>
  </div>
</section>
</asp:Content>
