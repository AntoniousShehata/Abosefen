<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Invoice_Total_Search.aspx.vb" Inherits="Invoice_Total_Search" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="hide">

<div class="col-3 col-s-12"  id="img" runat="server">
<asp:Image ID="Image1" runat="server" Visible="False" Height="100%" ImageAlign="Middle" Width="100%" />

</div>

<div class="footer" id="footer">

 <div id="rptPager_div" class="col-3 col-s-12" align="center" dir="rtl" runat="server">
        <asp:Repeater ID="rptPager" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                    CssClass='<%# If(Convert.ToBoolean(Eval("Enabled")), "page_enabled", "page_disabled")%>'
                    OnClick="Page_Changed" OnClientClick='<%# If(Not Convert.ToBoolean(Eval("Enabled")), "return false;", "") %>'   Height="100%"></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
</div>

<div id="search_div" class="col-3 col-s-12" style="display: inline-block" align="center" runat="server">
<asp:Button CssClass="btntt"  ID="Button1" runat="server"/>
</div>
</div>


 <asp:Panel ID="Panel2" runat="server" defaultbutton="Button1"  Direction="RightToLeft" >
 
  <div class="row" >
  <div class="col-3 col-s-12" id="wrapper"><asp:Label ID="Label5" runat="server" CssClass="lbltt_header" Text="البحث عن فاتورة"></asp:Label></div>
  <div class="col-3 col-s-12"><asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label></div>
  </div> 
  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label57" runat="server" CssClass="lbltt" Text="مسلسل"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox4" runat="server" CssClass="txttt" MaxLength="7"></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label58" runat="server" CssClass="lbltt" Text="رقم"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox5" runat="server" CssClass="txttt" MaxLength="7"></asp:TextBox></div>
 </div>
  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" CssClass="lbltt" Text="النوع"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="droptt" DataSourceID="SqlDataSource1" DataTextField="Invoice_TypeDesc" 
  DataValueField="Invoice_TypeCode"></asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label33" runat="server" CssClass="lbltt" Text="التاريخ"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="ar-EG" 
                       Width="100%" Height="100%" CssClass="txttt" Calendar-MonthLayout="Layout_7rows_x_6columns">
                       <Calendar CalendarTableStyle-CssClass="RadCalendar_Default" 
                           CalendarTableStyle-ForeColor="Black" 
                           CalendarTableStyle-HorizontalAlign="Center" 
                           CalendarTableStyle-VerticalAlign="Middle" CultureInfo="ar-EG" 
                           DayNameFormat="Full" DayOverStyle-ForeColor="Black" DayOverStyle-Height="30" 
                           DayOverStyle-HorizontalAlign="Center" DayOverStyle-VerticalAlign="Middle" 
                           DayStyle-ForeColor="Black" DayStyle-Height="30" 
                           DayStyle-HorizontalAlign="Center" DayStyle-VerticalAlign="Middle" 
                           DefaultCellPadding="15" DefaultCellSpacing="15" DisabledDayStyle-Height="30" 
                           DisabledDayStyle-HorizontalAlign="Center" 
                           DisabledDayStyle-VerticalAlign="Middle" 
                           FastNavigationSettings-CancelButtonCaption="إلغاء" 
                           FastNavigationSettings-DisableOutOfRangeMonths="False" 
                           FastNavigationSettings-OkButtonCaption="تأكيد" 
                           FastNavigationSettings-TodayButtonCaption="اليوم" 
                           FastNavigationStyle-HorizontalAlign="Center" 
                           FastNavigationStyle-VerticalAlign="Middle" FirstDayOfWeek="Monday" 
                           ForeColor="Black" HeaderStyle-HorizontalAlign="Center" 
                           HeaderStyle-VerticalAlign="Middle" NavigationCellPadding="10" 
                           NavigationCellSpacing="10" Orientation="RenderInColumns" 
                           OtherMonthDayStyle-HorizontalAlign="Center" 
                           OtherMonthDayStyle-VerticalAlign="Middle" 
                           OutOfRangeDayStyle-HorizontalAlign="Center" 
                           OutOfRangeDayStyle-VerticalAlign="Middle" SelectedDayStyle-Height="30" 
                           SelectedDayStyle-HorizontalAlign="Center" 
                           SelectedDayStyle-VerticalAlign="Middle" SingleViewHeight="100%" 
                           SingleViewWidth="100%" TitleAlign="Center" TitleStyle-Height="30" 
                           TitleStyle-HorizontalAlign="Center" TitleStyle-VerticalAlign="Middle" 
                           UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                           ViewSelectorStyle-Height="30" ViewSelectorStyle-HorizontalAlign="Center" 
                           ViewSelectorStyle-VerticalAlign="Middle" ViewSelectorText="x" 
                           WeekendDayStyle-Height="30" WeekendDayStyle-HorizontalAlign="Center" 
                           WeekendDayStyle-VerticalAlign="Middle">
                           <FastNavigationSettings CancelButtonCaption="إلغاء" OkButtonCaption="تأكيد" 
                               TodayButtonCaption="تاريخ اليوم">
                           </FastNavigationSettings>
                           <DayStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                           <WeekendDayStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <CalendarTableStyle CssClass=".calendar_btt" HorizontalAlign="Center" 
                               VerticalAlign="Middle" />
                           <OtherMonthDayStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <OutOfRangeDayStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <DisabledDayStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <SelectedDayStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <DayOverStyle Font-Bold="False" HorizontalAlign="Center" 
                               VerticalAlign="Middle" />
                           <TitleStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           <FastNavigationStyle Font-Bold="False" HorizontalAlign="Center" 
                               VerticalAlign="Middle" />
                           <ViewSelectorStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                       </Calendar>
                       <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                           EnableAjaxSkinRendering="False" EnableSingleInputRendering="True" LabelWidth="" 
                           ShortYearCenturyEnd="2035" Height="100%">
                           <EmptyMessageStyle CssClass="riTextBox riEmpty" HorizontalAlign="Center" 
                               Width="100%" />
                           <ReadOnlyStyle CssClass="riTextBox riRead" HorizontalAlign="Center" 
                               Width="100%" />
                           <FocusedStyle CssClass="riTextBox riFocused" HorizontalAlign="Center" 
                               Width="100%" />
                           <DisabledStyle CssClass="riTextBox riDisabled" HorizontalAlign="Center" 
                               Width="100%" />
                           <InvalidStyle CssClass="riTextBox riError" HorizontalAlign="Center" 
                               Width="100%" />
                           <HoveredStyle CssClass="riTextBox riHover" HorizontalAlign="Center" 
                               Width="100%" />
                           <EnabledStyle CssClass="riTextBox riEnabled" HorizontalAlign="Center" 
                               Width="100%" />
                       </DateInput>
                       <DatePopupButton Height="35px" HoverImageUrl="images/calendar.png" 
                           ImageUrl="images/calendar.png" Width="35px" />
                   </telerik:RadDatePicker>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label56" runat="server" CssClass="lbltt" Text="الحالة"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
   <asp:DropDownList ID="DropDownList4" runat="server" CssClass="droptt" 
                       DataSourceID="SqlDataSource4" DataTextField="Invoice_StatusDesc" 
                       DataValueField="Invoice_StatusCode">
                   </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label41" runat="server" CssClass="lbltt" Text="م.  ذات صلة"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox2" runat="server" CssClass="txttt" MaxLength="7"></asp:TextBox></div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label34" runat="server" CssClass="lbltt" Text="طريقة الدفع"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
  <asp:DropDownList ID="DropDownList2" runat="server" CssClass="droptt" 
                       DataSourceID="SqlDataSource2" DataTextField="PaymentMethod_Desc" 
                       DataValueField="PaymentMethod_Code">
                   </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label59" runat="server" CssClass="lbltt" Text="مخزن"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
      <asp:DropDownList ID="DropDownList6" runat="server" CssClass="droptt" 
                       DataSourceID="SqlDataSource5" DataTextField="Store_Name" 
                       DataValueField="Store_Serial">
                   </asp:DropDownList>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label60" runat="server" CssClass="lbltt" Text="حالة تسليم مخزن"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
      <asp:DropDownList ID="DropDownList7" runat="server" CssClass="droptt" 
                       DataSourceID="SqlDataSource6" DataTextField="TransReviewStatus_Desc" 
                       DataValueField="TransReviewStatus_Code">
                   </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label39" runat="server" CssClass="lbltt" Text="ملاحظات"></asp:Label></div>  
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox3" runat="server" CssClass="txttt"></asp:TextBox></div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label40" runat="server" CssClass="lbltt" Text="إسم العميل"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="txtSearch" runat="server" autofocus="true" CssClass="txttt" onkeyup="FilterItems(this.value)" Visible="False"></asp:TextBox></div>
 <div class="col-3 col-s-6" style="float: right">
    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="droptt" 
                       DataSourceID="SqlDataSource3" DataTextField="Person_Name" 
                       DataValueField="Person_Code">
                   </asp:DropDownList>
 </div>

 </div>
    <div class="col-3 col-s-12"><asp:Label ID="Label61" runat="server" CssClass="lbltt" Text="الصنف"></asp:Label></div>
<div class="col-3 col-s-12"><asp:TextBox ID="txtSearch0" runat="server" autofocus="true" CssClass="txttt" onkeyup="FilterItemsY(this.value)" ></asp:TextBox></div>
     <div class="col-3 col-s-12">
     <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                       CssClass="droptt" DataSourceID="SqlDataSource8" DataTextField="DESC_TOTAL_ITEM" 
                       DataValueField="Item_Serial">
                   </asp:DropDownList>
                   </div>

    </asp:Panel>
    </div>
  <div id="header_print" runat="server">
 <div class="col-3 col-s-12" align="center">

<asp:Repeater ID="DataList1" runat="server">

<ItemTemplate>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label1129" runat="server" Text='<%# Eval("Invoice_Date", "{0: yyyy-MM-dd}") %>' CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label9"  runat="server" Text="التاريخ" CssClass="lbltt" Width="48%"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label4" runat="server" text='<%# Eval("Invoice_Serial") %>' CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label28" runat="server" Text="م.الفاتورة" CssClass="lbltt" Width="48%"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label129" runat="server" text='<%# Eval("Invoice_Number") %>' CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label7" runat="server" Text="رقم الفاتورة" CssClass="lbltt" Width="48%"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label75" runat="server" text='<%# Eval("Invoice_TypeDesc") %>' CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label6"  runat="server" Text="النوع" CssClass="lbltt" Width="48%"></asp:Label>
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label77" runat="server" text='<%# Eval("PaymentMethod_Desc") %>' CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label12" runat="server" Text="طريقة الدفع" CssClass="lbltt" Width="48%"></asp:Label>
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label76" runat="server" text='<%# Eval("Invoice_StatusDesc") %>' CssClass="txttt" Width="48%"></asp:Label>  
<asp:Label ID="Label10" runat="server" Text="الحالة" CssClass="lbltt" Width="48%"></asp:Label>
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
 
 <asp:Label ID="Label73" runat="server" Text="إسم العميل" CssClass="lbltt"></asp:Label>

 </div>
  
 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
 
  <asp:Label ID="Label78" runat="server" text='<%# Eval("Person_Name") %>' CssClass="txttt"></asp:Label>

  </div>

 <div class="col-3 col-s-12">
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Invoice_FilePath") %>' Visible="False"></asp:Label>

    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Invoice_Serial") %>' />
    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("Person_Code") %>' />
    <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("Invoice_TypeCode") %>' />
    <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("Invoice_Date", "{0: yyyy-MM-dd}") %>' />
    <asp:HiddenField ID="HiddenField5" runat="server" Value='<%# Eval("Invoice_Ledger_Direction") %>' />
    <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Eval("Invoice_Tax_Discount_Flag") %>' />
</div>

<div class="col-3 col-s-12" style="display: inline-block">

 <div class="col-3 col-s-3" style="float: right">
 <asp:Button ID="Button4" runat="server" CssClass="btntt" OnClick="Invoice" Text="تعديل الفاتورة"/>
 </div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:Button ID="Button6" runat="server" CssClass="btntt" OnClick="details_related" Text="V | فاتورة ذات صلة" />
 </div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:Button ID="Button5" runat="server" CssClass="btntt" OnClick="details" Text="V | تفاصيل الفاتورة" />
 </div>
 <div class="col-3 col-s-3" style="float: right">
<asp:Button ID="Button1" runat="server"  CommandArgument='<%# Eval("Invoice_FilePath") %>' CssClass="btntt"  OnClick="DownloadFile" Text="صورة الفاتورة"/>
 </div>

 </div>
<div class="col-3 col-s-12" style="display: inline-block;width:100%;overflow:auto"" dir="rtl" >

<asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource7">

<HeaderTemplate>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label2" runat="server" Text="فواتير ذات صلة" CssClass="txttt"></asp:Label>
               
</div>

</HeaderTemplate>

<ItemTemplate>
<div style="border: medium solid #673492; background-color: #2d2926">
<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label19" runat="server" Text="إسم العميل" CssClass="lbltt_header"></asp:Label>
</div>
<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label23" runat="server" Text='<%# Bind("Person_Name") %>' CssClass="txttt"></asp:Label>
</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label10" runat="server" Text="مسلسل" CssClass="lbltt_header" Width="30%"></asp:Label>

<asp:Label ID="Label16" runat="server" Text="فاتورة" CssClass="lbltt_header" Width="30%"></asp:Label>

<asp:Label ID="Label14" runat="server" Text="رقم فاتورة" CssClass="lbltt_header" Width="30%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label11" runat="server" Text='<%# Bind("Invoice_Serial") %>' CssClass="txttt"  Width="30%"></asp:Label>

<asp:Label ID="Label12" runat="server" Text='<%# Bind("Invoice_TypeDesc") %>' CssClass="txttt" Width="30%"></asp:Label>

<asp:Label ID="Label13" runat="server" Text='<%# Bind("Invoice_Number") %>' CssClass="txttt" Width="30%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label21" runat="server" Text="تاريخ فاتورة" CssClass="lbltt_header" Width="30%"></asp:Label>

<asp:Label ID="Label17" runat="server" Text="طريقة الدفع" CssClass="lbltt_header" Width="30%"></asp:Label>

<asp:Label ID="Label20" runat="server" Text="حالة الفاتورة" CssClass="lbltt_header" Width="30%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label25" runat="server" Text='<%# Bind("Invoice_Date", "{0: yyyy-MM-dd}") %>' CssClass="txttt" Width="30%"></asp:Label>

<asp:Label ID="Label22" runat="server" Text='<%# Bind("PaymentMethod_Desc") %>' CssClass="txttt"  Width="30%"></asp:Label>

<asp:Label ID="Label24" runat="server" Text='<%# Bind("Invoice_StatusDesc") %>' CssClass="txttt" Width="30%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label15" runat="server" Text="ملاحظات" CssClass="lbltt_header"></asp:Label>
</div>
<div class="col-3 col-s-12" align="center">                  
<asp:Label ID="Label8" runat="server" Text='<%# Bind("Invoice_Notes") %>' CssClass="txttt"></asp:Label>
</div>      

</div>                         
</ItemTemplate>
       
</asp:Repeater>

  </div>
     <div class="col-3 col-s-12" style="display: inline-block;width:100%;overflow:auto""  dir="rtl" >


<asp:Repeater ID="Repeater2" runat="server"  DataSourceID="SqlDataSource101">
                                                                    
<HeaderTemplate>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label2" runat="server" Text="تفاصيل الفاتورة" CssClass="lbltt"></asp:Label>
               
</div>

</HeaderTemplate>

<ItemTemplate>

<div style="border: medium solid #673492; background-color: #2d2926">

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label23" runat="server" Text="الصنف" CssClass="lbltt_header"></asp:Label>
               
</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Desc_Total") %>' CssClass="txttt"></asp:Label>
               
</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label9" runat="server" Text="الكمية" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label6" runat="server" Text="السعر" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label17" runat="server" Text="الخصم" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label7" runat="server" Text="سعر الكمية" CssClass="lbltt_header" Width="30%"></asp:Label>
</div>


<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label27" runat="server" Text='<%# Bind("Total_Amount") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label18" runat="server" Text='<%# Bind("InvoiceItem_Price") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label19" runat="server" Text='<%# Bind("InvoiceItem_PriceDiscountRate") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label26" runat="server" Text='<%# Bind("Net_Item_price") %>'  CssClass="txttt" Width="30%"></asp:Label>
</div>

<div id="no_print">
<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label10" runat="server" Text="الحالة" CssClass="lbltt_header" Width="48%"></asp:Label>

<asp:Label ID="Label16" runat="server" Text="تسليم المخزن" CssClass="lbltt_header" Width="48%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label11" runat="server" Text='<%# Bind("DeliveryStatus_Desc") %>' CssClass="txttt"  Width="48%"></asp:Label>

<asp:Label ID="Label12" runat="server" Text='<%# Bind("TransReviewStatus_DESC") %>'  CssClass="txttt"  Width="48%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label32" runat="server" Text="المخزن" CssClass="lbltt_header" Width="48%"></asp:Label>

<asp:Label ID="Label33" runat="server" Text="تاريخ التسليم" CssClass="lbltt_header" Width="48%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label36" runat="server" Text='<%# Bind("Store_Name") %>' CssClass="txttt"  Width="48%"></asp:Label>

<asp:Label ID="Label37" runat="server" Text='<%# Bind("InventoryTrans_Date", "{0:yyyy/MM/dd}") %>' CssClass="txttt"  Width="48%"></asp:Label>

</div>

</div>

</div>                         
</ItemTemplate>
      <SeparatorTemplate>
      <br />
      </SeparatorTemplate> 
</asp:Repeater>
  <div class="col-3 col-s-12"  style="width:100%;overflow:auto"  align="center">

 <div class="col-3 col-s-6" style="float: right">
  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource12" 
      ShowHeader="False" BorderColor="green" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" style="width:100%;overflow:auto" 
      Visible="False">
    <Columns>
<asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" SortExpression="title">
        <ItemStyle CssClass="G_lbltt_header" />
        </asp:BoundField>

<asp:BoundField DataField="value" HeaderText="value" ReadOnly="True" SortExpression="value">
        <ItemStyle CssClass="G_txttt" />
        </asp:BoundField>
   </Columns>
 </asp:GridView>
 </div>

  <div class="col-3 col-s-6" style="float: right"> 
  <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource15" 
  BorderColor="green" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ShowHeader="False" style="width:100%;overflow:auto" 
  Visible="False">
        <Columns>
            <asp:TemplateField HeaderText="وسيلة الدفع" SortExpression="AmountDueMean_Desc">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("AmountDueMean_Desc") %>' CssClass="lbltt_header"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("AmountDueMean_Desc") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="كود العملية أو رقم الحساب" 
                SortExpression="DueMean_Reference_Number">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("DueMean_Reference_Number") %>' CssClass="lbltt"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("DueMean_Reference_Number") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="التاريخ" SortExpression="Trans_Date">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Trans_Date", "{0:yyyy/MM/dd}") %>' CssClass="lbltt"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Trans_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="hgridview" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Width="100%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="المبالغة المدفوعة" SortExpression="Amount_Due">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount_Due") %>' CssClass="txttt"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount_Due") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
 </div>
 </div>
</div>
    
    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="Invoice_Totals_Sum" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Invoice_Serial" 
                PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField3" Name="Invoice_TypeCode" 
                PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField4" DbType="Date" Name="filter_date" 
                PropertyName="value" />
            <asp:ControlParameter ControlID="HiddenField6" Name="Invoice_Tax_Discount_Flag" 
                PropertyName="value" Type="Int32"/>
                
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="GENERAL_LEDGER_Invoice_Trans_Sel" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Invoice_Serial" 
                PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField2" Name="Person_Code" 
                PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField3" Name="Invoice_TypeCode" 
                PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField4" DbType="Date" Name="filter_date" 
                PropertyName="value" />
            <asp:ControlParameter ControlID="HiddenField6" Name="Invoice_Tax_Discount_Flag" 
                PropertyName="value" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="Invoice_Invoice_SEARCH_relative" SelectCommandType="StoredProcedure">
        <SelectParameters>
        <asp:ControlParameter ControlID="Invoice_SerialLabel" Direction="InputOutput" Name="Invoice_Serial" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                 
                        <asp:Label ID="Invoice_SerialLabel" runat="server" 
                            Text='<%# Eval("Invoice_Serial") %>' Visible="False" />
                        <asp:Label ID="Label3" runat="server" Text='<%# Container.ItemIndex %>'
                            Visible="False" />
                        
     <asp:SqlDataSource ID="SqlDataSource101" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
      SelectCommand="Items_InvoiceDetail_select_total" SelectCommandType="StoredProcedure">
         <SelectParameters>
         <asp:ControlParameter ControlID="Invoice_SerialLabel" Name="Invoice_Serial" PropertyName="Text" />
         </SelectParameters>
      </asp:SqlDataSource>
               
     </ItemTemplate>
  </asp:Repeater>
</div>
</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>

<div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="SELECT Invoice_TypeCode, Invoice_TypeDesc FROM INVOICES.InvoiceType WHERE (NOT (Invoice_TypeCode IN (9, 10)))">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="SELECT PaymentMethod_Code, PaymentMethod_Desc FROM INVOICES.PaymentMethod">
    </asp:SqlDataSource>
 
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="SELECT PERSON.Person.Person_Code, PERSON.Person.Person_Name + ' ** ' + PERSON.PersonType.PersonType_Desc AS Person_Name 
                    FROM PERSON.Person INNER JOIN PERSON.PersonType ON PERSON.Person.PersonType_code = PERSON.PersonType.PersonType_code 
                    ORDER BY PERSON.Person.PersonType_code,PERSON.Person.Person_Name ">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="SELECT Invoice_StatusCode, Invoice_StatusDesc FROM INVOICES.InvoiceStatus">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="SELECT - 1 AS TransReviewStatus_Code, 'إختر حالة تسليم مخزن' AS TransReviewStatus_Desc 
                    UNION
                    SELECT TransReviewStatus_Code, TransReviewStatus_Desc FROM STORES.TransReviewStatus">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand=" SELECT Store_Serial, Store_Name FROM STORES.Store">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
     SelectCommand="Total_item_desc" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

</div>
               <script type="text/javascript">
                   var ddlText, ddlValue, ddl, lblMesg, ddlTextY, ddlValueY, ddlY;
                   function CacheItems() {
                       ddlText = new Array();
                       ddlValue = new Array();
                       ddl = document.getElementById("<%=DropDownList5.ClientID %>");
                       ddlTextY = new Array();
                       ddlValueY = new Array();
                       ddlY = document.getElementById("<%=DropDownList8.ClientID %>");

                       for (var i = 0; i < ddl.options.length; i++) {
                           ddlText[ddlText.length] = ddl.options[i].text;
                           ddlValue[ddlValue.length] = ddl.options[i].value;
                       }

                       for (var g = 0; g < ddlY.options.length; g++) {
                           ddlTextY[ddlTextY.length] = ddlY.options[g].text;
                           ddlValueY[ddlValueY.length] = ddlY.options[g].value;
                       }
                   }
                   window.onload = CacheItems;

                   function FilterItems(value) {
                       ddl.options.length = 0;
                       for (var i = 0; i < ddlText.length; i++) {
                           if (ddlText[i].toLowerCase().indexOf(value) != -1) {
                               AddItem(ddlText[i], ddlValue[i]);
                           }
                       }

                       if (ddl.options.length == 0) {
                           AddItem("لا يوجد", "");
                       }
                   }

                   function FilterItemsY(value) {
                       ddlY.options.length = 0;
                       for (var g = 0; g < ddlTextY.length; g++) {
                           if (ddlTextY[g].toLowerCase().indexOf(value) != -1) {
                               AddItem(ddlTextY[g], ddlValueY[g]);
                           }
                       }

                       if (ddlY.options.length == 0) {
                           AddItem("لا يوجد", "");
                       }
                   }


                   function AddItem(text, value) {
                       var opt = document.createElement("option");
                       var optY = document.createElement("option");
                       opt.text = text;
                       opt.value = value;
                       optY.text = text;
                       optY.value = value;
                       ddl.options.add(opt);
                       ddlY.options.add(optY);
                   }


                </script> 

</asp:Content>

