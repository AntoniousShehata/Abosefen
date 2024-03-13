<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="GENERAL_LEDGER_INS.aspx.vb" Inherits="GENERAL_LEDGER_INS" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">  
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="hide">

<div class="footer" id="footer">
<div class="col-3 col-s-12" style="display: inline-block" align="center">
<asp:Button CssClass="btntt"  ID="Button1" runat="server" Text="تسجيل معاملات دفتر يومية"/>
</div>
</div>



<div id="ledger_Transfers" style="border: thick double #2E895B" runat="server" dir="rtl">
<asp:Panel ID="Panel2" runat="server" defaultbutton="Button6">

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label86" runat="server" Text="تسجيل معاملات دفتر يومية" CssClass="lbltt_header"></asp:Label></div>


<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label11" runat="server" Visible="False" CssClass="lbltt_val"></asp:Label></div>

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label89" 
         runat="server" Text="نوع المعاملة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList16" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="TransType_Direction_Desc" 
        DataValueField="TransType_Direction" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label87" 
         runat="server" Text="تصنيف المعاملة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
    <asp:DropDownList CssClass="droptt"  ID="DropDownList14" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="TransTypeCat_Desc" 
        DataValueField="TransTypeCat_Code" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label88" 
         runat="server" Text="المعاملة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
    <asp:DropDownList CssClass="droptt"  ID="DropDownList15" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="TransType_Desc" 
        DataValueField="TransType_Code" AutoPostBack="True">
    </asp:DropDownList> 
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label81" 
         runat="server" Text="وسلية الدفع" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList13" runat="server" 
        DataSourceID="SqlDataSource14" DataTextField="AmountDueMean_Desc" 
        DataValueField="AmountDueMean_Code" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 </div>
 
   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label90" 
         runat="server" Text="إسم العميل"  CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="txtSearch" runat="server" onkeyup="FilterItems(this.value)" autofocus="true" Visible="False" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-6" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource15" DataTextField="Person_Name" 
        DataValueField="Person_Code" AutoPostBack="True">
    </asp:DropDownList>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label83" 
         runat="server" Text="مبلغ المعاملة" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox10" runat="server" CssClass="txttt"></asp:TextBox></div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label84" 
         runat="server" Text="رقم الحساب/العملية" Visible="False" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox11" runat="server" Visible="False" CssClass="txttt"></asp:TextBox></div>
 </div>

 <div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label85" 
         runat="server" Text="ملاحظات" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="TextBox12" runat="server" TextMode="MultiLine" CssClass="txttt"></asp:TextBox></div>
  <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button6" runat="server" Text="تسجيل فى دفتر اليومية"/>
</div>

</asp:Panel>
</div>

<asp:Panel ID="Panel1" runat="server" defaultbutton="Button7">

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label5" runat="server" Text="دفتر اليومية" CssClass="lbltt_header"></asp:Label></div>
 

  <div class="col-3 col-s-12" style="display: inline-block" dir="rtl" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label3" runat="server" Text="تاريخ اليومية" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
  <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" 
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
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label93" runat="server" Text="وسلية الدفع" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList18" runat="server" 
        DataSourceID="SqlDataSource17" DataTextField="AmountDueMean_Desc" 
        DataValueField="AmountDueMean_Code">
    </asp:DropDownList>
 </div>
 </div>
 
<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label91" runat="server" Text="بحث بكلمة فى الوصف" CssClass="lbltt"></asp:Label></div>
<div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="TextBox13" runat="server" CssClass="txttt"></asp:TextBox></div>

<div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button7" runat="server" Text="إستعلام"/></div>

</asp:Panel>
</div>
<div id="header_print" runat="server" style="border: thick double #2E895B;" dir="rtl"> 

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label94" 
        runat="server" CssClass="lbltt_header"></asp:Label></div>

<div class="col-3 col-s-12" style="display: inline-block;width:100%;overflow:auto">
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" style="width:100%;overflow:auto">
        <Columns>
            <asp:TemplateField HeaderText="كود المعاملة" InsertVisible="False" SortExpression="Trans_Code">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Trans_Code") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Trans_Code") %>' CssClass="txttt"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ المعاملة" SortExpression="Trans_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Trans_Date") %>' ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Trans_Date", "{0: yyyy/MM/dd}") %>' CssClass="txttt"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تفاصيل المعاملة" SortExpression="Final_Desc">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Final_Desc") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Final_Desc") %>' CssClass="lbltt_header"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="وارد" SortExpression="Amount_IN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Amount_IN") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount_IN") %>'  CssClass="txttt"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="صادر" SortExpression="Amount_OUT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Amount_OUT") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Amount_OUT") %>' CssClass="lbltt_header"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="إجماليات">
            <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" CssClass="txttt"></asp:Label>
                </ItemTemplate>
           </asp:TemplateField>
           </Columns>
               <HeaderStyle BackColor="Maroon" Font-Bold="True" Font-Names="Arial" 
              Font-Size="16pt" ForeColor="White" HorizontalAlign="Center" 
                VerticalAlign="Middle" />
           </asp:GridView>
    </div>

 </div>
 <div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
<table align="center" dir="rtl">
<tr>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="GENERAL_LEDGER_Transactions_SEL" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadDatePicker1" Name="GENERAL_LEDGER_DATE" 
                PropertyName="SelectedDate" Type="DateTime" DefaultValue="1900-01-01" />
            <asp:ControlParameter ControlID="TextBox13" DefaultValue="X" Name="FINAL_DESC" 
                PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="-1" Name="Person_Code" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList18" DefaultValue="0" 
                Name="AmountDueMean_Code" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT TransTypeCat_Code, TransTypeCat_Desc FROM GENERAL_LEDGER.TransTypeCat">
    </asp:SqlDataSource>
</td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT TransType_Direction, TransType_Direction_Desc FROM GENERAL_LEDGER.TransType_Direction">
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT TransType_Code, TransType_Desc FROM GENERAL_LEDGER.TransType WHERE (TransType_Direction = @TransType_Direction) AND (TransTypeCat_Code = @TransTypeCat_Code)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList16" Name="TransType_Direction" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList14" Name="TransTypeCat_Code" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        
        SelectCommand="SELECT PERSON.Person.Person_Code, PERSON.Person.Person_Name + ' ** ' + PERSON.PersonType.PersonType_Desc AS Person_Name, PERSON.PersonType.PersonType_code FROM PERSON.Person INNER JOIN PERSON.PersonType ON PERSON.Person.PersonType_code = PERSON.PersonType.PersonType_code WHERE (PERSON.Person.PersonType_code = @PersonType_code) AND (@PersonType_code = 2) OR (PERSON.Person.PersonType_code = 0) OR (PERSON.Person.PersonType_code = 0) AND (@PersonType_code = 0) OR (@PersonType_code = 1) ORDER BY PERSON.Person.PersonType_code">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList14" Name="PersonType_code" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT AmountDueMean_Code, AmountDueMean_Desc FROM GENERAL_LEDGER.AmountDueMean">
    </asp:SqlDataSource>
    </td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">

    &nbsp;</td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource17" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        SelectCommand="SELECT AmountDueMean_Code, AmountDueMean_Desc FROM GENERAL_LEDGER.AmountDueMean ">
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">

    &nbsp;</td>
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

