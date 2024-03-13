<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="References_Search.aspx.vb" Inherits="References_Search" %>

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
<div id="search_div" class="col-3 col-s-12" style="display: inline-block" align="center" runat="server">
<asp:Button CssClass="btntt"  ID="Button1" runat="server"/>
</div>
</div>


 <asp:Panel ID="Panel2" runat="server" defaultbutton="Button1"  Direction="RightToLeft" >
 
  <div class="row" >
  <div class="col-3 col-s-12" id="wrapper"><asp:Label ID="Label5" runat="server" CssClass="lbltt_header" Text="البحث عن مرجع"></asp:Label></div>
  <div class="col-3 col-s-12"><asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label></div>
  </div> 

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" CssClass="lbltt" Text="النوع"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="droptt" DataSourceID="SqlDataSource1" DataTextField="ReferencesType_Desc" 
  DataValueField="ReferencesType_Code"></asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label33" runat="server" CssClass="lbltt" Text="التاريخ"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
      <telerik:RadMonthYearPicker ID="RadMonthYearPicker1" Runat="server" Culture="ar-EG" 
                       Width="100%" Height="100%" CssClass="txttt" DateInput-ShortYearCenturyEnd="2035" MonthYearNavigationSettings-OkButtonCaption="تأكيد" MonthYearNavigationSettings-CancelButtonCaption="إلغاء">

                       <DateInput EnableAjaxSkinRendering="False" EnableSingleInputRendering="True" LabelWidth="" 
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
                       <MonthYearNavigationSettings CancelButtonCaption="إلغاء" 
                           OkButtonCaption="تأكيد" TodayButtonCaption="الشهر الحالى" />
       </telerik:RadMonthYearPicker>
 </div>
 </div>

   <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label56" runat="server" CssClass="lbltt" Text="الشركة"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
<asp:DropDownList ID="DropDownList4" runat="server" CssClass="droptt" DataSourceID="SqlDataSource4" DataTextField="Company_Desc" 
DataValueField="Company_Code"></asp:DropDownList>
 </div>
  <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label34" runat="server" CssClass="lbltt" Text="الحالة"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList ID="DropDownList2" runat="server" CssClass="droptt">
 <asp:ListItem Text="سارى" Value="1"></asp:ListItem>
 <asp:ListItem Text="غير سارى" Value="9"></asp:ListItem>
 </asp:DropDownList>
 </div>
 
</div>

 </asp:Panel>
    </div>
  <div id="header_print" runat="server">
 <div class="col-3 col-s-12" align="center">

<asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource2">

<ItemTemplate>
<%-- <div class="col-3 col-s-12">
    <asp:Label ID="Label8" runat="server" Text='<%# Eval("References_Desc") %>' CssClass="lbltt" />
</div>
--%>
<div class="col-3 col-s-12" style="display: inline-block">

<asp:Button ID="Button1" runat="server"  CommandArgument='<%# Eval("References_Path") %>' CssClass="btntt"  OnClick="DownloadFile" Text='<%# Eval("References_Desc") %>' />

</div>
      
</ItemTemplate>

  </asp:Repeater>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
         SelectCommand="References_SEL" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" 
                 Name="ReferencesType_Code" PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="DropDownList4" DefaultValue="0" 
                 Name="Company_Code" PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="RadMonthYearPicker1" DbType="Date" 
                 DefaultValue="1900-01-01" Name="References_Year" PropertyName="SelectedDate" />
             <asp:ControlParameter ControlID="RadMonthYearPicker1" DbType="Date" 
                 DefaultValue="1900-01-01" Name="References_Month" PropertyName="SelectedDate" />
             <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" 
                 Name="References_Status" PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
</div>
</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>

    <table align="center" dir="rtl" >
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
         SelectCommand="SELECT [ReferencesType_Code],[ReferencesType_Desc] FROM [Abosefen].[References].[ReferencesType] where ReferencesType_Code <> 0 order by ReferencesType_Code desc">
    </asp:SqlDataSource>

</td>
<td align="center" dir="rtl" valign="middle" class="style12">

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT [Company_Code],[Company_Desc]FROM [Abosefen].[ITEMS].[Company]">
    </asp:SqlDataSource>
    </td>
</tr>
</table>

</asp:Content>

