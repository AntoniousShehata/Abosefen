<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Persons_LedgerAccounts_Search.aspx.vb" Inherits="Persons_LedgerAccounts_Search" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="hide">
<asp:Panel ID="Panel3" runat="server" defaultbutton="Button7" Direction="RightToLeft">

<div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label5" runat="server" Text="حسابات عملاء و موردين" CssClass="lbltt_header"></asp:Label></div>

<div class="col-3 col-s-12" style="display: inline-block" ><asp:TextBox ID="txtSearch0" runat="server" onkeyup="FilterItems(this.value)" autofocus="true" Visible="False" CssClass="txttt"></asp:TextBox></div>

<div class="col-3 col-s-12" style="display: inline-block" >
<asp:DropDownList CssClass="droptt"  ID="DropDownList17" runat="server" 
DataSourceID="SqlDataSource16" DataTextField="Person_Name" DataValueField="Person_Code">
<asp:ListItem Value="-1">إختر العميل</asp:ListItem>
</asp:DropDownList>
</div>
<div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button7" runat="server" Text="إستعلام"/></div>

</asp:Panel>
</div>

<div id="header_print" style="border: thick double #2E895B;width:100%;overflow:auto"" dir="rtl" >  

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label6" runat="server" CssClass="lbltt_header"></asp:Label></div>

<asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource18" ForeColor="Black" BackColor="#CCCCCC" 
         BorderColor="#999999" BorderStyle="Solid" 
        BorderWidth="3px" CellSpacing="2" ShowHeader="False" style="width:100%;overflow:auto">
        <Columns>
            <asp:BoundField DataField="AmountDueMean_Desc" HeaderText="وسيلة الدفع" SortExpression="AmountDueMean_Desc" ></asp:BoundField>
            <asp:BoundField DataField="DueMean_Reference_Number" HeaderText="كود العملية أو رقم الحساب" SortExpression="DueMean_Reference_Number"></asp:BoundField>
            <asp:BoundField DataField="Trans_Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="التاريخ" SortExpression="Trans_Date"></asp:BoundField>
            <asp:BoundField DataField="Amount_Due" HeaderText="المبالغة المدفوعة" SortExpression="Amount_Due"></asp:BoundField>
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
 <div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
<table align="center" dir="rtl">
<tr>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        SelectCommand="Person_balance_amounts" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    </td>
<td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource18" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="GENERAL_LEDGER_Trans_Sel_1" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Invoice_Serial" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList17" Name="Person_Code" 
                PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
</tr>
</table>

 <script type="text/javascript">
     var ddlText, ddlValue, ddl, lblMesg;
     function CacheItems() {
         ddlText = new Array();
         ddlValue = new Array();
         ddl = document.getElementById("<%=DropDownList17.ClientID %>");

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

