<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Log In.aspx.vb" Inherits="LogIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
    
    <link rel="shortcut icon" type="image/ico" href="/icon.ico" />
    <link rel="icon" type="image/ico" href="/icon.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="/icon.ico" />
    
    <title>معرض ابوسيفين و تماف إيرينى للأدوات الصحية  </title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link href="Styles/Abo_Site.css" rel="stylesheet" type="text/css" />

</head>
<body bgcolor="#2d2926" id="hide">
    <form id="form1" runat="server">

 <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Button CssClass="btntt" ID="Button2" runat="server" Text="خروج"/></div>
 <div class="col-3 col-s-3" style="float: left"><asp:Label  CssClass="lbltt" ID="Label4" runat="server" Text="Label"></asp:Label></div>
</div>

<div class="col-3 col-s-12" style="display: inline-block" >
<asp:Label ID="Label5" runat="server" Text="ابوسيفين و تماف إيرينى للأدوات الصحية" CssClass="lbltt_header"></asp:Label>
</div>

<div class="col-3 col-s-12" style="display: inline-block" >
<asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label>
</div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-6" style="float: right"><asp:Label ID="Label2" runat="server" CssClass="lbltt">المستخدم</asp:Label></div>
 <div class="col-3 col-s-6" style="float: right"><asp:TextBox ID="TextBox1" runat="server" CssClass="txttt"></asp:TextBox></div>
</div>
 <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-6" style="float: right"><asp:Label ID="Label3" runat="server" CssClass="lbltt">كلمة المرور</asp:Label></div>
 <div class="col-3 col-s-6" style="float: right"><asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="txttt"></asp:TextBox></div>
</div>

<div class="col-3 col-s-12" style="display: inline-block"  align="center">
<asp:Button CssClass="btntt" ID="Button1" runat="server" Text="تسجيل دخول" />
</div>
  
<div class="col-3 col-s-12" style="display: inline-block"  align="center">
<img src="pictures/cover.jpg" align="middle" style="width: 100%" alt=""/>
</div>


    </form>
</body>
</html>
