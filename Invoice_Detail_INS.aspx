<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Invoice_Detail_INS.aspx.vb" Inherits="Invoice_Detail_INS" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="hide" dir="rtl">

<div class="col-3 col-s-12"  id="img" runat="server">
<asp:Image ID="Image1" runat="server" Visible="False" Height="100%" 
        ImageAlign="Middle" Width="100%" />
 <div class="col-3 col-s-12" style="display: inline-block;" align="center">
     <asp:Button CssClass="btntt_delete"  ID="Button8" runat="server" 
         Text="إضغط هنا لمسح الصورة الضوئية"/>
 </div> 
</div>
<div class="footer" id="footer">
<div  id="main_menu" class="col-3 col-s-12 btntt" style="background-color: #6c83bd;" dir="rtl">
<span style="font-size:24px;cursor:pointer;color: white;" onclick="openNav_extra()">&#9776; وحدة تحكم فاتورة</span>
</div>
</div>

<div id="mySidenav_extra" class="sidenav" dir="rtl" 
        style="background-color: #6c83bd;">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav_extra()">&times;</a>
<div id="menu_button" style="background-color: #6c83bd;">
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button  CssClass="txttt"  ID="Button2" runat="server"/>
 </div>
  <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button  CssClass="txttt"  ID="Button3" runat="server"/>
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button  CssClass="txttt" ID="Button7" runat="server"/>
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button  CssClass="txttt"  ID="Button1" runat="server"/>
 </div> 
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Invoice_Serial" 
        DataSourceID="SqlDataSource13" PageSize="1" ShowHeader="False" 
        GridLines="None" Width="100%">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
              <asp:Button ID="lnkDownload0" runat="server" 
                   CommandArgument='<%# Eval("Invoice_FilePath") %>' OnClick="DownloadFile" 
                   Text="صورة ضوئية" CssClass="txttt"></asp:Button>
              </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Visible="False" />
    </asp:GridView>
  </div>
<div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
    <asp:Label CssClass="lbltt_header" ID="Label34" runat="server" Text="Label"></asp:Label>
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:TextBox CssClass="lbltt" ID="TextBox13" runat="server" TextMode="Email"></asp:TextBox>
<%--   <asp:RegularExpressionValidator
        id="regEmail"
        ControlToValidate="TextBox13"
        Text="Enter valid email id"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        Runat="server" />  --%>
 <asp:HiddenField ID="HiddenField5" runat="server" />
 </div>
 <div class="col-3 col-s-12" style="border: thin solid #673492; display: inline-block; background-color: #6c83bd;" align="center">
 <asp:Button  CssClass="txttt"  ID="Button9" runat="server"/>
 </div>
</div>
</div>


<div style="display: none">
    <asp:DropDownList CssClass="droptt"  ID="DropDownList6" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Invoice_TypeDesc" 
        DataValueField="Invoice_TypeCode"   
         Font-Size="Large" Width="1%" Enabled="False">
    </asp:DropDownList>
    <asp:DropDownList CssClass="droptt"  ID="DropDownList7" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="Person_Name" 
        DataValueField="Person_Code"   
         Font-Size="Large" Width="1%">
    </asp:DropDownList>
    </div>

<div class="col-3 col-s-12" id="ledger_Transfers" style="border: thick double #2E895B;display: inline-block;" runat="server" dir="rtl">
<asp:Panel ID="Panel1" runat="server" defaultbutton="Button6">
<div class="col-3 col-s-12" style="display: inline-block" >
<asp:Label CssClass="lbltt_header" ID="Label13" runat="server" Text="نافذة تحصيل فواتير"></asp:Label>
</div>

 <div class="col-3 col-s-12" style="display: inline-block" >
<asp:Label CssClass="lbltt_val" ID="Label11" runat="server" Visible="False"></asp:Label>
</div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label80" runat="server" CssClass="lbltt" Text="الإجمالى المتبقى"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label82" runat="server" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label83" runat="server" CssClass="lbltt" Text="دفعة من المستحق"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox10" runat="server" CssClass="txttt"></asp:TextBox></div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label81" CssClass="lbltt" runat="server" Text="وسلية الدفع"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList13" runat="server" 
        DataSourceID="SqlDataSource14" DataTextField="AmountDueMean_Desc" 
        DataValueField="AmountDueMean_Code" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label84" runat="server" CssClass="lbltt" Text="رقم حساب/عملية"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox11" runat="server" CssClass="txttt"></asp:TextBox></div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label85" runat="server" Text="ملاحظات"  CssClass="lbltt"></asp:Label></div>
  <div class="col-3 col-s-12" style="display: inline-block" ><asp:TextBox ID="TextBox12" runat="server" TextMode="MultiLine" CssClass="txttt"></asp:TextBox></div>
    

   <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button6" runat="server" Text="تأكيد تحصيل دفعة مستحقة" /></div>

</asp:Panel>
</div>

<div class="col-3 col-s-12" id="invoice_update" style="border: thick double #2E895B;" runat="server">

<asp:Panel ID="Panel2" runat="server" defaultbutton="Button4">

<div class="col-3 col-s-12" style="display: inline-block" ><asp:Label CssClass="lbltt_header" ID="Label14" runat="server" Text="نافذة تعديل بيانات رئيسية"></asp:Label></div>
<div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label2" runat="server" CssClass="lbltt" Visible="False"></asp:Label></div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label54" runat="server" Text="طريقة الدفع" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList8" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="PaymentMethod_Desc" 
        DataValueField="PaymentMethod_Code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label CssClass="lbltt" ID="Label56" runat="server" Text="حالة الفاتورة"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList4" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="Invoice_StatusDesc" 
        DataValueField="Invoice_StatusCode">
    </asp:DropDownList>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="م. ف. ذات صلة" CssClass="lbltt" /></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox5" runat="server" MaxLength="7" CssClass="txttt" ></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="صورة ضوئية" CssClass="lbltt" /></div>
 <div class="col-3 col-s-3" style="float: right"><asp:FileUpload ID="FileUpload2" runat="server" CssClass="txttt" /></div>
 </div>

    <div class="col-3 col-s-12" style="display: inline-block;width:100%;overflow:auto">
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label63" runat="server" Text="خصم إجمالى" CssClass="lbltt" ></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox4" runat="server" CssClass="txttt" ></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label64" runat="server" Text="ملاحظات" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" CssClass="txttt"></asp:TextBox></div>
     <asp:HiddenField ID="HiddenField3" runat="server" />
 </div>

     <div class="col-3 col-s-9" style="display: inline-block;width:100%;overflow:auto">
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" Text="بند إشعار خصم" CssClass="lbltt" ></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:RadioButton ID="RadioButton1" runat="server" Text="إشعار خصم" 
         CssClass="txttt" GroupName="1" />
 </div>
 <div class="col-3 col-s-3" style="float: right">
  <asp:RadioButton ID="RadioButton2" runat="server" Text="بدون إشعار خصم" 
         CssClass="txttt" GroupName="1" />
 </div>
         <asp:HiddenField ID="HiddenField4" runat="server" />
 </div>


 <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="تعديل بيانات فاتورة رئيسية"/></div>
  
  </asp:Panel>
   </div>


 <div class="col-3 col-s-12" id="add_item_main" style="border: thick double #2E895B;display: inline-block;" runat="server" dir="rtl">

 <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label CssClass="lbltt_header" ID="Label15" runat="server" Text="نافذة إضافة صنف إلى فاتورة"></asp:Label></div>

   <div class="col-3 col-s-12" style="display: inline-block" >
<asp:TextBox ID="txtSearch0" runat="server" Visible="False" CssClass="txttt" AutoPostBack="True"></asp:TextBox>
   </div>
 <div class="col-3 col-s-12" style="display: inline-block" >
 <asp:Repeater ID="Repeateritem" DataSourceID="SqlDataSource6" runat="server">
 <ItemTemplate>
 <div class="col-3 col-s-12" style="display: inline-block" align="center">
  <asp:Label ID="Label1" runat="server" Text='<%# Bind("DESC_TOTAL_ITEM") %>' CssClass="lbltt" Visible="False"></asp:Label>
  <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Bind("Item_Serial") %>' />
  <asp:Button ID="Button10" runat="server" Text='<%# Bind("DESC_TOTAL_ITEM") %>' OnClick="item_select" CssClass="lbltt" />
  </div>
 </ItemTemplate>
 </asp:Repeater>
     <asp:HiddenField ID="HiddenField7" runat="server" />
 </div>
 </div>
 </div>

 <div class="col-3 col-s-12" id="add_item" style="border: thick double #2E895B;display: inline-block;" runat="server" dir="rtl">

<asp:Panel ID="Panel3" runat="server" defaultbutton="Button5">
   <div class="col-3 col-s-12" style="display: inline-block" >
   <asp:Label ID="Label35" runat="server" CssClass="lbltt_header"></asp:Label>
   </div>
   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label66" runat="server" Text="وحدة القياس" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList9" runat="server" 
        DataSourceID="SqlDataSource7" DataTextField="MeasureUnit_Desc" 
        DataValueField="MeasureUnit_Code" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label67" runat="server" Text="العدد بالوحدة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox8" runat="server" Enabled="False" CssClass="txttt"></asp:TextBox></div>
 </div>

    <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label65" runat="server" Text="الكمية" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:TextBox ID="TextBox7" 
         runat="server" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label70" runat="server" Text="المخزن" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
  <asp:DropDownList CssClass="droptt" ID="DropDownList11" runat="server" 
 DataSourceID="SqlDataSource9" DataTextField="Name_Amount" 
         DataValueField="Store_Serial">
</asp:DropDownList>
 </div>
 </div>

 <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label68" runat="server" Text="سعر القطعة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox9" runat="server" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label69" runat="server" Text="نسبة الخصم" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList10" runat="server" 
        DataSourceID="SqlDataSource8" DataTextField="display" 
        DataValueField="id">
    </asp:DropDownList>
 </div>
 </div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label71" runat="server" Text="حالة التسليم" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList12" runat="server" 
        DataSourceID="SqlDataSource10" DataTextField="DeliveryStatus_Desc" 
        DataValueField="DeliveryStatus_Code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label72" runat="server" Text="تاريخ التسليم" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <telerik:RadDatePicker ID="RadDatePicker3" Runat="server" 
        Width="100%" Culture="ar-EG" CssClass="txttt" Calendar-MonthLayout="Layout_7rows_x_6columns">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
            ViewSelectorText="x" DayNameFormat="Full" DefaultCellPadding="15" 
            DefaultCellSpacing="15" FirstDayOfWeek="Monday"  
            NavigationCellPadding="10" NavigationCellSpacing="10" 
            Orientation="RenderInColumns" SingleViewHeight="100%" SingleViewWidth="100%" 
            TitleAlign="Center" CalendarTableStyle-CssClass="RadCalendar_Default" WeekendDayStyle-HorizontalAlign="Center" WeekendDayStyle-VerticalAlign="Middle" ViewSelectorStyle-VerticalAlign="Middle" ViewSelectorStyle-HorizontalAlign="Center" TitleStyle-HorizontalAlign="Center" TitleStyle-VerticalAlign="Middle" SelectedDayStyle-HorizontalAlign="Center" SelectedDayStyle-VerticalAlign="Middle" SelectedDayStyle-Height="30" CultureInfo="ar-EG" FastNavigationSettings-CancelButtonCaption="إلغاء" FastNavigationSettings-DisableOutOfRangeMonths="False" FastNavigationSettings-OkButtonCaption="تأكيد" FastNavigationSettings-TodayButtonCaption="اليوم" CalendarTableStyle-HorizontalAlign="Center" CalendarTableStyle-VerticalAlign="Middle" DayOverStyle-Height="30" DayOverStyle-HorizontalAlign="Center" DayOverStyle-VerticalAlign="Middle" DayStyle-Height="30" DayStyle-HorizontalAlign="Center" DayStyle-VerticalAlign="Middle" DisabledDayStyle-Height="30" TitleStyle-Height="30" ViewSelectorStyle-Height="30" WeekendDayStyle-Height="30" OutOfRangeDayStyle-HorizontalAlign="Center" OutOfRangeDayStyle-VerticalAlign="Middle" OtherMonthDayStyle-HorizontalAlign="Center" OtherMonthDayStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" FastNavigationStyle-VerticalAlign="Middle" FastNavigationStyle-HorizontalAlign="Center" DisabledDayStyle-VerticalAlign="Middle" DisabledDayStyle-HorizontalAlign="Center" CalendarTableStyle-ForeColor="Black" DayOverStyle-ForeColor="Black" DayStyle-ForeColor="Black" ForeColor="Black">
    <FastNavigationSettings CancelButtonCaption="إلغاء" OkButtonCaption="تأكيد" 
        TodayButtonCaption="تاريخ اليوم">
    </FastNavigationSettings>
    <DayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" ForeColor="Black" />
    <WeekendDayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <CalendarTableStyle CssClass=".calendar_btt"  
        HorizontalAlign="Center" VerticalAlign="Middle" />
    <OtherMonthDayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <OutOfRangeDayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <DisabledDayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <SelectedDayStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <DayOverStyle Font-Bold="False"  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <TitleStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <HeaderStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
    <FastNavigationStyle Font-Bold="False"  
        HorizontalAlign="Center" VerticalAlign="Middle" />
    <ViewSelectorStyle  HorizontalAlign="Center" 
        VerticalAlign="Middle" />
        </Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" 
            EnableSingleInputRendering="True" LabelWidth="" 
            ShortYearCenturyEnd="2035" EnableAjaxSkinRendering="False">
    <EmptyMessageStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riEmpty" Width="100%" />
    <ReadOnlyStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riRead" Width="100%" />
    <FocusedStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riFocused" Width="100%" />
    <DisabledStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riDisabled" Width="100%" />
    <InvalidStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riError" Width="100%" />
    <HoveredStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riHover" Width="100%" />
    <EnabledStyle  HorizontalAlign="Center" 
        CssClass="riTextBox riEnabled" Width="100%" />
        </DateInput>

<DatePopupButton ImageUrl="images/calendar.png" HoverImageUrl="images/calendar.png"  Height="35px" Width="35px"></DatePopupButton>
    </telerik:RadDatePicker>
 </div>
 </div>
  <div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label5" runat="server" Visible="False" CssClass="lbltt_val"></asp:Label></div>

 <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button5" runat="server" Text="إضغط لإضافة الصنف إلى الفاتورة"/></div>


</asp:Panel>
</div>

</div>

<div  id="header_print" style="border: thick double #2E895B;" runat="server" dir="rtl">

<div class="col-3 col-s-12" style="float: right"><asp:Label ID="Label79" runat="server" CssClass="lbltt_header"></asp:Label></div>

<div id ="Tax_invoice_labs" class="col-3 col-s-12" style="border: medium ridge #C0C0C0; display: inline-block" align="center" runat="server">

<div class="col-3 col-s-12" style="display: inline-block" align="center">
<asp:Label ID="Label20"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label21"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
</div>

<div class="col-3 col-s-12" style="display: inline-block" align="center">
<asp:Label ID="Label24"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label25"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
</div>

<div class="col-3 col-s-12" style="display: inline-block" align="center">
<asp:Label ID="Label28"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label30"  runat="server" CssClass="txttt" Width="48%"></asp:Label>
</div>

</div>
 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label9"  runat="server" Text="التاريخ" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label29" runat="server" CssClass="txttt" Width="48%"></asp:Label>
<asp:Label ID="Label74" runat="server" CssClass="txttt" Width="48%" Visible="False"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label3" runat="server" Text="م.الفاتورة" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label4" runat="server" CssClass="txttt" Width="48%"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label7" runat="server" Text="رقم الفاتورة" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label8" runat="server" CssClass="txttt" Width="48%"></asp:Label>
</div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label6"  runat="server" Text="النوع" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label75" runat="server" CssClass="txttt" Width="48%"></asp:Label>
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label12" runat="server" Text="طريقة الدفع" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label77" runat="server" CssClass="txttt" Width="48%"></asp:Label>
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
<asp:Label ID="Label10" runat="server" Text="الحالة" CssClass="lbltt" Width="48%"></asp:Label>
<asp:Label ID="Label76" runat="server" CssClass="txttt" Width="48%"></asp:Label>  
 </div>

 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
 
 <asp:Label ID="Label73" runat="server" Text="إسم العميل" CssClass="lbltt"></asp:Label>

 </div>
  
 <div class="col-3 col-s-12 col-p-12" style="display: inline-block" align="center">
 
  <asp:Label ID="Label78" runat="server" CssClass="txttt"></asp:Label>

  </div>

 <div align="center" dir="rtl">
 <div class="col-3 col-s-12" align="center">

<asp:Repeater ID="GridView2" runat="server"  DataSourceID="SqlDataSource11">
                                                                    
<HeaderTemplate>

<%--<div class="col-3 col-s-12" align="center" style="clear:both">

<asp:Label ID="Label2" runat="server" Text="تفاصيل الفاتورة" CssClass="lbltt"></asp:Label>
               
</div>
--%>
<div class="col-item showprint">

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label23" runat="server" Text="الصنف" CssClass="lbltt_header"></asp:Label>
               
</div>

</div>

<div class="col-item-detail showprint">

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label9" runat="server" Text="العدد" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label6" runat="server" Text="السعر" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label17" runat="server" Text="الخصم" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label7" runat="server" Text="الإجمالى" CssClass="lbltt_header" Width="30%"></asp:Label>

</div>

</div>

</HeaderTemplate>

<ItemTemplate>
<%--<div class="pagebreak"></div>--%>
<div class="col-3 col-s-12" align="center">
<div class="col-3 col-s-12"  style="border: medium solid #673492; page-break-inside: avoid; clear:both;">

<div class="col-item">

<div class="col-3 col-s-12 hideprint" align="center">

<asp:Label ID="Label23" runat="server" Text="الصنف" CssClass="lbltt_header"></asp:Label>
               
</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Desc_Total") %>' CssClass="txttt"></asp:Label>
               
</div>

</div>
<div class="col-item-detail">

<div class="col-3 col-s-12 hideprint" align="center">
<asp:Label ID="Label9" runat="server" Text="العدد" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label6" runat="server" Text="السعر" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label17" runat="server" Text="الخصم" CssClass="lbltt_header" Width="20%"></asp:Label>

<asp:Label ID="Label7" runat="server" Text="الإجمالى" CssClass="lbltt_header" Width="30%"></asp:Label>
</div>

<div class="col-3 col-s-12" align="center">

<asp:Label ID="Label27" runat="server" Text='<%# Bind("Total_Amount") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label18" runat="server" Text='<%# Bind("InvoiceItem_Price") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label19" runat="server" Text='<%# Bind("InvoiceItem_PriceDiscountRate") %>' CssClass="txttt" Width="20%"></asp:Label>

<asp:Label ID="Label26" runat="server" Text='<%# Bind("Net_Item_price") %>'  CssClass="txttt" Width="30%"></asp:Label>
</div>

</div>
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

<div id="btn_delete_item" class="col-3 col-s-12" align="center">
<asp:Button ID="ImageButton1" runat="server" CssClass="btntt_delete" OnClick="delete_item" Text="حذف الصنف"/>
<asp:Label ID="Label22" runat="server" Text='<%# Bind("InvoiceDetail_Serial") %>' Visible="False"></asp:Label>
</div>
</div> 
                      
</ItemTemplate>

</asp:Repeater>

   </div>
  <div class="col-3 col-s-12"  style="width:100%;overflow:auto"  align="center">

 <div class="col-3 col-s-6" style="float: right">
  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
          CellPadding="4" DataSourceID="SqlDataSource12" ForeColor="Black" 
      ShowHeader="False" BackColor="#CCCCCC" BorderColor="#999999" 
          BorderStyle="Solid" BorderWidth="3px"
          style="width:100%;overflow:auto">
    <Columns>
<asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" SortExpression="title">
        <ItemStyle CssClass="G_lbltt_header" />
        </asp:BoundField>

<asp:BoundField DataField="value" HeaderText="value" ReadOnly="True" SortExpression="value">
        <ItemStyle CssClass="G_txttt" />
        </asp:BoundField>

    </Columns>
      <FooterStyle BackColor="#CCCCCC" />
      <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
      <RowStyle BackColor="White" />
      <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F1F1F1" />
      <SortedAscendingHeaderStyle BackColor="#808080" />
      <SortedDescendingCellStyle BackColor="#CAC9C9" />
      <SortedDescendingHeaderStyle BackColor="#383838" />
     </asp:GridView>
 </div>
  <div class="col-3 col-s-6" style="float: right"> 
  <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource15" ForeColor="Black" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ShowHeader="False"
        style="width:100%;overflow:auto" >
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
                <ItemStyle CssClass="txttt" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black"  ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099"  ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
 </div>
   </div>            
 </div>

</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>

<table align="center" dir="rtl" >
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT Invoice_TypeCode, Invoice_TypeDesc, Invoice_Inventory_Direction FROM INVOICES.InvoiceType WHERE (NOT (Invoice_TypeCode IN (9, 10)))">
    </asp:SqlDataSource>

</td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT PaymentMethod_Code, PaymentMethod_Desc FROM INVOICES.PaymentMethod">
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        SelectCommand="SELECT PERSON.Person.Person_Code, PERSON.Person.Person_Name + ' ** ' + PERSON.PersonType.PersonType_Desc AS Person_Name FROM PERSON.Person INNER JOIN PERSON.PersonType ON PERSON.Person.PersonType_code = PERSON.PersonType.PersonType_code ORDER BY PERSON.Person.PersonType_code">
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        SelectCommand="SELECT Invoice_StatusCode, Invoice_StatusDesc FROM INVOICES.InvoiceStatus">
    </asp:SqlDataSource>

    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="Total_item_desc_search" SelectCommandType="StoredProcedure">
          <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch0" Name="DESC_TOTAL_ITEM" 
              PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT MeasureUnit_Code, MeasureUnit_Desc FROM Items.MeasureUnit">
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="select_percentage" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="Inventory_Transaction_Statistics_For_Item" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField7" Name="Item_Serial" 
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT DeliveryStatus_Code, DeliveryStatus_Desc FROM INVOICES.DeliveryStatus">
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="Items_InvoiceDetail_select_total" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Invoice_Serial" QueryStringField="id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="Invoice_Totals_Sum" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList6" Name="Invoice_TypeCode" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="Label74" DbType="Date" 
                Name="filter_date" PropertyName="Text" />
            <asp:QueryStringParameter Name="Invoice_Serial" QueryStringField="id" 
                Type="Int32" />
            <asp:ControlParameter ControlID="HiddenField4" DefaultValue="" 
                Name="Invoice_Tax_Discount_Flag" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

<asp:SqlDataSource ID="SqlDataSource13" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        SelectCommand="SELECT Invoice_Serial, + CONVERT (nvarchar, Invoice_TypeCode) + '\' + Invoice_FilePath AS Invoice_FilePath FROM INVOICES.Invoice WHERE (Invoice_Serial = @Invoice_Serial)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label4" Name="Invoice_Serial" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT AmountDueMean_Code, AmountDueMean_Desc FROM GENERAL_LEDGER.AmountDueMean">
    </asp:SqlDataSource>
   
    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="GENERAL_LEDGER_Invoice_Trans_Sel" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Invoice_Serial" QueryStringField="id" 
                Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList7" Name="Person_Code" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList6" Name="Invoice_TypeCode" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="Label74" DbType="Date" Name="filter_date" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="HiddenField4" Name="Invoice_Tax_Discount_Flag" 
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:HiddenField ID="HiddenField1" runat="server" />

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:HiddenField ID="HiddenField2" runat="server" />

    </td>
</tr>
</table>

</asp:Content>
