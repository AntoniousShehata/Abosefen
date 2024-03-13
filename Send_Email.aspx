<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Send_Email.aspx.vb" Inherits="Send_Email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label1" runat="server" CssClass="lbltt" Text="To"></asp:Label></div>
  <div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="txtTo" runat="server" CssClass="txttt"></asp:TextBox></div>
  <div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label2" runat="server" CssClass="lbltt" Text="Subject"></asp:Label></div>
  <div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="txtSubject" runat="server" CssClass="txttt"></asp:TextBox></div>


  <div class="col-3 col-s-12" style="display: inline-block">
  <asp:Label ID="Label3" runat="server" CssClass="lbltt" Text="body"></asp:Label>
  </div>

   <div class="col-3 col-s-12" style="display: inline-block">
   <asp:TextBox ID="txtBody" runat="server" TextMode = "MultiLine" CssClass="txttt"></asp:TextBox>
   </div>

    <div class="col-3 col-s-12" align="center">
    <asp:Button ID="Button1" Text="Send" runat="server" CssClass="btntt" />
    </div>

 <div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
</asp:Content>

