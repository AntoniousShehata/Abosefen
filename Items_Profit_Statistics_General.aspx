<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Items_Profit_Statistics_General.aspx.vb" Inherits="Items_Profit_Statistics_General" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <div id="hide">
   <asp:Panel ID="Panel1" runat="server" defaultbutton="Button4"> 

  <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label5" runat="server" Text="تفاصيل دليل ارباح" CssClass="lbltt_header"></asp:Label></div>

 <div class="col-3 col-s-12" style="display: inline-block" dir="rtl">
 <asp:DropDownList ID="DropDownList6" runat="server" CssClass="droptt">
        <asp:ListItem Value="0">إختر</asp:ListItem>
        <asp:ListItem Value="1">أصناف تم البيع منها</asp:ListItem>
        <asp:ListItem Value="9">أصناف لم يتم بيعها</asp:ListItem>
    </asp:DropDownList>
 </div>
<div class="col-3 col-s-12" style="display: inline-block" dir="rtl">
    <asp:TextBox ID="txtSearch0" runat="server" CssClass="txttt"></asp:TextBox></div>

<div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="الإستعلام"/></div>

</asp:Panel>
</div>

<div id="header_print" style="border: thick double #2E895B;" dir="rtl" > 


 <div class="col-3 col-s-12">
     <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource1">

<ItemTemplate>
<div class="col-3 col-s-12"><asp:Label ID="Label1" runat="server" Text='<%# Bind("ITEM_CODE_DESC") %>' CssClass="lbltt"></asp:Label></div>
                           
<div class="col-3 col-s-12"><asp:Label ID="Label2" runat="server" Text='<%# Bind("ITEM_ALL_DESC") %>' CssClass="lbltt_header"></asp:Label></div>
                           
<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label10" runat="server" Text="متوسط سعر شراء" CssClass="lbltt" Width="23%"></asp:Label>

<asp:Label ID="Label4" runat="server" Text="متوسط سعر البيع" CssClass="lbltt" Width="23%"></asp:Label>

<asp:Label ID="Label6" runat="server" Text="كمية البيع الكلى" CssClass="lbltt" Width="23%"></asp:Label>

<asp:Label ID="Label14" runat="server" Text="ارباح البيع للقطعة" CssClass="lbltt" Width="23%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label3" runat="server" Text='<%# Bind("PURCHASES_AVERAGE_PRICE") %>' CssClass="txttt"  Width="23%"></asp:Label>

<asp:Label ID="Label11" runat="server" Text='<%# Bind("SALES_AVERAGE_PRICE") %>' CssClass="txttt" Width="23%"></asp:Label>

<asp:Label ID="Label12" runat="server" Text='<%# Bind("Amount_SOLD") %>' CssClass="txttt" Width="23%"></asp:Label>

<asp:Label ID="Label13" runat="server" Text='<%# Bind("Amount_SOLD_PROFIT") %>' CssClass="txttt" Width="23%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label15" runat="server" Text="كمية الشراء الإجمالى" CssClass="lbltt" Width="30%"></asp:Label>

<asp:Label ID="Label16" runat="server" Text="تكلفة الشراء الاجمالى" CssClass="lbltt" Width="30%"></asp:Label>

<asp:Label ID="Label17" runat="server" Text="نسبة الربح للقطعة" CssClass="lbltt" Width="30%"></asp:Label>

</div>

<div class="col-3 col-s-12" align="center">
<asp:Label ID="Label19" runat="server" Text='<%# Bind("Amount_PURCHASED") %>' CssClass="txttt"  Width="30%"></asp:Label>

<asp:Label ID="Label20" runat="server" Text='<%# Bind("TOTAL_PURCHASE_COST") %>' CssClass="txttt" Width="30%"></asp:Label>

<asp:Label ID="Label21" runat="server" Text='<%# Bind("Profits_PERCENTAGE") %>' CssClass="txttt" Width="30%"></asp:Label>

</div>
                         
</ItemTemplate>
                      
</asp:Repeater>

</div>
</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
    <table align="center" cellspacing="1" dir="rtl">

        <tr>
            <td align="center" dir="rtl" valign="middle">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="Items_Profit_Statistics_General_Desc" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                       <asp:ControlParameter ControlID="txtSearch0" Name="ITEM_ALL_DESC_filter" 
                          PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList6" Name="Amount_SOLD_filter" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

