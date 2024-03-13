<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Invoice_INS.aspx.vb" Inherits="Invoice_INS" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="hide">
  <asp:Panel ID="Panel1" runat="server" defaultbutton="Button4" 
         Direction="RightToLeft">
 
<div class="col-3 col-s-12"><asp:Label ID="Label5" runat="server" Text="إدخال بيانات فاتورة" CssClass="lbltt_header"></asp:Label></div>
<div class="col-3 col-s-12"><asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label></div>

 <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" Text="نوع الفاتورة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt" ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Invoice_TypeDesc" 
        DataValueField="Invoice_TypeCode" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label33" runat="server" Text="تاريخ الفاتورة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
   <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" Culture="ar-EG" 
        Width="100%" Font-Bold="False" Height="100%" CssClass="txttt" Calendar-MonthLayout="Layout_7rows_x_6columns">
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
        HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="False" />
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
            ShortYearCenturyEnd="2035" EnableAjaxSkinRendering="False" Height="100%">
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

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label40" runat="server" Text="إسم العميل" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="txtSearch" runat="server" onkeyup="FilterItems(this.value)" autofocus="true" Visible="False" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-6" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="Person_Name" 
        DataValueField="Person_Code">
    </asp:DropDownList>
 </div>
 </div>
 

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="م. فاتورة مرتبطة" TextAlign="Left" CssClass="lbltt" /></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox2" runat="server" Font-Bold="False" MaxLength="7" Font-Italic="False" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="صورة ضوئية" TextAlign="Left" CssClass="lbltt" /></div>
 <div class="col-3 col-s-3" style="float: right"><asp:FileUpload ID="FileUpload1" runat="server" CssClass="txttt" Height="100%" /></div>
 </div>

 <div class="col-3 col-s-12"><asp:Label ID="Label39" runat="server" Text="ملاحظات" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-12"><asp:TextBox ID="TextBox3" runat="server"   MaxLength="7" TextMode="MultiLine" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-12" align="center"><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="تسجيل بيانات رئيسية" /></div>

  </asp:Panel>
  </div>
  <div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
      <table align="center" cellspacing="1" dir="rtl" >
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        
        SelectCommand="SELECT Invoice_TypeCode, Invoice_TypeDesc FROM INVOICES.InvoiceType WHERE (NOT (Invoice_TypeCode IN (9, 10)))">
    </asp:SqlDataSource>

</td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        SelectCommand="Person_balance_amounts" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle" class="style1">

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT ISNULL(MAX(Invoice_Serial) + 1, 1) AS Invoice_Serial FROM INVOICES.Invoice">
    </asp:SqlDataSource>

</td>
<td align="center" dir="rtl" valign="middle" class="style1">

    <asp:HiddenField ID="HiddenField1" runat="server" />
    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Invoice_Serial" 
        DataSourceID="SqlDataSource4" PageSize="1" ShowHeader="False" Visible="False">
        <Columns>
            <asp:BoundField DataField="Invoice_Serial" HeaderText="Invoice_Serial" 
                ReadOnly="True" SortExpression="Invoice_Serial" />
        </Columns>
        <PagerSettings Visible="False" />
    </asp:GridView>

</td>
<td align="center" dir="rtl" valign="middle">
 <asp:HiddenField ID="HiddenField2" runat="server" />
    </td>
</tr>
</table>

<script type="text/javascript">

                var ddlText, ddlValue, ddl, lblMesg;
                function CacheItems() {
                    ddlText = new Array();
                    ddlValue = new Array();
                    ddl = document.getElementById("<%=DropDownList5.ClientID %>");

                    for (var i = 0; i < ddl.options.length; i++) {
                        ddlText[ddlText.length] = ddl.options[i].text;
                        ddlValue[ddlValue.length] = ddl.options[i].value;
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

                function AddItem(text, value) {
                    var opt = document.createElement("option");
                    opt.text = text;
                    opt.value = value;
                    ddl.options.add(opt);


                }

             </script>

    </asp:Content>

