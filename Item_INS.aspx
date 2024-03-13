
<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Item_INS.aspx.vb" Inherits="Item_INS" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <div id="hide" dir="rtl">
 <div class="footer" id="footer">
<div  id="main_menu" class="col-3 col-s-12 btntt" style="background-color: #6c83bd;" dir="rtl">
<span style="font-size:24px;cursor:pointer;color: white;" onclick="openNav_extra()">&#9776; وحدة إدخال تصنيفات</span>
</div>
</div>

<div id="mySidenav_extra" class="sidenav" dir="rtl" 
        style="background-color: #6c83bd;">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav_extra()">&times;</a>
<div id="menu_button" style="background-color: #6c83bd;">
 
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Label ID="Label4" runat="server" Text="إدخال تصنيفات" CssClass="lbltt_header"></asp:Label>
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:DropDownList ID="DropDownList9" runat="server" CssClass="droptt">
 <asp:ListItem Text="إختر التصنيف" Value="0"></asp:ListItem>
  <asp:ListItem Text="بلد المنشأ" Value="1"></asp:ListItem>
   <asp:ListItem Text="الشركة المصنعة" Value="2"></asp:ListItem>
    <asp:ListItem Text="التصنيف" Value="3"></asp:ListItem>
     <asp:ListItem Text="موديل" Value="4"></asp:ListItem>
     <asp:ListItem Text="التصنيف الفرعى" Value="5"></asp:ListItem>
     <asp:ListItem Text="اللون" Value="6"></asp:ListItem>
     <asp:ListItem Text="خامة الصنف" Value="7"></asp:ListItem>
 </asp:DropDownList>
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:textbox  CssClass="txttt"  ID="textbox5" runat="server"/>
 </div> 
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button CssClass="btntt"  ID="Button8" runat="server" Text="تسجيل التصنيف"/>
  </div>
</div>
</div>

    <asp:Panel ID="Panel1" runat="server" defaultbutton="Button4">

  <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Label ID="Label5" runat="server" Text="تسجيل صنف جديد" CssClass="lbltt_header"></asp:Label></div>

  <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label41" runat="server" CssClass="txttt"></asp:Label></div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" Text="بلد المنشأ" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt" ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Origin_Desc" 
        DataValueField="Origin_Code">
</asp:DropDownList>
 </div>
  <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label32" runat="server" Text="الشركة المصنعة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
    <asp:DropDownList CssClass="droptt"  ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="Company_Desc" 
        DataValueField="Company_Code">
    </asp:DropDownList>
 </div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label33" runat="server" Text="التصنيف" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList3" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="Category_Desc" 
        DataValueField="Category_Code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label35" runat="server" Text="موديل" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource5" DataTextField="Model_Desc" 
        DataValueField="Model_Code">
    </asp:DropDownList>
 </div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label34" runat="server" Text="التصنيف الفرعي" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList4" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="SubCategory_Desc" 
        DataValueField="SubCategory_Code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label40" runat="server" Text="كود الصنف" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:TextBox ID="TextBox2" 
         runat="server" MaxLength="8" CssClass="txttt"></asp:TextBox></div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label36" runat="server" Text="اللون" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList6" runat="server" 
        DataSourceID="SqlDataSource6" DataTextField="Color_Desc" 
        DataValueField="Color_Code">
</asp:DropDownList>
 </div>
  <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label38" runat="server" Text="خامة الصنف" CssClass="lbltt"></asp:Label></div>

  <div class="col-3 col-s-3" style="float: right">
  
  <asp:DropDownList CssClass="droptt"  ID="DropDownList7" runat="server" 
        DataSourceID="SqlDataSource7" DataTextField="Material_Desc" 
        DataValueField="Material_Code">
    </asp:DropDownList>
    </div>
</div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label39" runat="server" Text="مقاسات الصنف" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList8" runat="server" 
        DataSourceID="SqlDataSource8" DataTextField="Size_Desc" 
        DataValueField="Size_Code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label37" runat="server" Text="وصف إضافى" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox1" runat="server" CssClass="txttt"></asp:TextBox></div>
 </div>

 
 <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label></div>

  <div class="col-3 col-s-12" style="display: inline-block" align="center" ><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="تسجيل بينات صنف جديد"/></div>
  <div class="col-3 col-s-12" style="display: inline-block" align="center" ><asp:Button CssClass="btntt_delete"  ID="Button6" runat="server" Text="الرجوع إلى الشاشة السابقة"/></div>


   <div class="col-3 col-s-12" style="display: inline-block" align="center">
<telerik:RadUpload ID="RadUpload1" Runat="server" Culture="ar-EG" Visible="False" CssClass="lbltt">
<Localization Add="إضافة" Clear="تفريغ" Delete="مسح" Remove="إلغاء" Select="رفع صورة" />
</telerik:RadUpload>
   </div>
  <div class="col-3 col-s-12" style="display: inline-block" align="center">
<asp:Button CssClass="btntt"  ID="Button7" runat="server" Text="تسجيل جميع الصور المحددة للصنف" Visible="False"/>
      <asp:HiddenField ID="HiddenField1" runat="server" />
</div>

    </asp:Panel>
</div>



<div id="header_print" style="border: thick double #2E895B" dir="rtl"> 

    <asp:Repeater ID="GridView1" runat="server" DataSourceID="SqlDataSource9">
    <ItemTemplate>

 <div class="col-3 col-s-12">
<asp:Label ID="Label1" runat="server" Text='<%# Eval("Item_Serial") %>' CssClass="txttt"></asp:Label>
</div>
 <div class="col-3 col-s-12">
 <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Desc") %>' CssClass="lbltt_header"></asp:Label>
</div>
  
  <div class="col-3 col-s-12" align="center">
 <asp:Button ID="Button1" runat="server" Text="تحميل صور للصنف" OnClick="photo_upload" CssClass="btntt" />
 </div>
 <div class="col-3 col-s-12" align="center">
<asp:Label ID="Label6" runat="server" Text='<%# Eval("flag") %>' Visible="False"></asp:Label>
<asp:Button ID="Button2" runat="server"  CommandArgument='<%# Eval("Item_Serial") %>' CssClass="btntt"  OnClick="details" Text="صورة الصنف" />
 </div>
  
    </ItemTemplate>
    </asp:Repeater>

</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
    <table align="center" cellspacing="1" dir="rtl">
        <tr>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    SelectCommand="SELECT Origin_Code, Origin_Desc FROM ITEMS.Origin ORDER BY CASE WHEN Origin_Code = 0 THEN 0 WHEN Origin_Code = 1 THEN 1 ELSE 2 END, Origin_Desc">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    SelectCommand="SELECT Company_Code, Company_Desc FROM ITEMS.Company 
ORDER BY CASE WHEN Company_Code = 0 THEN 0 WHEN Company_Code = 1 THEN 1 ELSE 2 END, Company_Desc">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    SelectCommand="SELECT Category_Code, Category_Desc FROM ITEMS.Category 

ORDER BY CASE WHEN Category_Code = 0 THEN 0 WHEN Category_Code = 1 THEN 1 ELSE 2 END, Category_Desc">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    SelectCommand="SELECT SubCategory_Code, SubCategory_Desc FROM ITEMS.SubCategory 
ORDER BY CASE WHEN SubCategory_Code = 0 THEN 0 WHEN SubCategory_Code = 1 THEN 1 ELSE 2 END, SubCategory_Desc">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="SELECT Model_Code, Model_Desc FROM ITEMS.Model 
ORDER BY CASE WHEN Model_Code = 0 THEN 0 WHEN Model_Code = 1 THEN 1 ELSE 2 END, Model_Desc">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="SELECT Color_Code, Color_Desc FROM ITEMS.Color 
ORDER BY CASE WHEN Color_Code = 0 THEN 0 WHEN Color_Code = 1 THEN 1 ELSE 2 END, Color_Desc">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    SelectCommand="SELECT Material_Code, Material_Desc FROM ITEMS.Material 
ORDER BY CASE WHEN Material_Code = 0 THEN 0 WHEN Material_Code = 1 THEN 1 ELSE 2 END, Material_Desc">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    
                    SelectCommand="SELECT Size_Code, dbo.item_Size_Desc_func(Size_Code) AS Size_Desc FROM ITEMS.Size">
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl">
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    
                    SelectCommand="SELECT Item_Serial, dbo.item_Desc_concatination_func(Item_Serial) AS Item_Desc,isnull((SELECT TOP (1) Item_Serial FROM ITEMS.ItemPhoto WHERE (Item_Serial = ITEMS.Item.Item_Serial)),0) AS flag FROM ITEMS.Item order by SUBSTRING(dbo.item_Desc_concatination_func(Item_Serial),12,1000000)">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

