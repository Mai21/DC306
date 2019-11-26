<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="ITS.Aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
   <form id="form1" runat="server" class="font-sans text-sm rounded w-full mx-auto"> 
        <section class="bg-gray-300 font-sans">
  <div class="container m-auto flex flex-col md:flex-row max-w-xl">
    <div class="flex flex-col w-full lg:w-1/2 justify-center items-start py-8">
      <label for="tagline" class="uppercase tracking-loose">About Us</label>
      <h1 class="my-4 font-normal">Our Work Flow</h1>
      <p class="leading-normal mb-4">Students of Aspire2 International Business and Technology in Christchurch New Zealand. Taking Diploma in Computing Level 7 with a
          strand of Software Development. 
      </p>
      <button
        class="bg-transparent hover:bg-black text-black font-semibold hover:text-white py-2 px-4 border border-black hover:border-transparent">Learn
        More</button>
    </div>
    <div class="w-full lg:w-1/2 lg:py-6"><img src="https://stitches.hyperyolo.com/images/demo-devices.png" alt="image"
        class="w-full"></div>
  </div>
    </section>
     </form>
</asp:Content>
