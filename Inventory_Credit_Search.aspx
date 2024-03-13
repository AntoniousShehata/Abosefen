<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Inventory_Credit_Search.aspx.vb" Inherits="Inventory_Credit_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label5" runat="server" Text="رصيد مخازن" CssClass="lbltt_header"></asp:Label></div>
 
 
  <div id="hide" class="col-3 col-s-12" style="display: inline-block" dir="rtl">
  <asp:Panel ID="Panel1" runat="server" defaultbutton="Button4">
 <div class="col-3 col-s-3" style="float: right">
     <asp:DropDownList CssClass="droptt"  ID="DropDownList6" runat="server">
        <asp:ListItem Value="0">إختر</asp:ListItem>
        <asp:ListItem Value="1">أصناف برصيد</asp:ListItem>
        <asp:ListItem Value="9">أصناف بدون رصيد</asp:ListItem>
     </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right">
    <asp:DropDownList CssClass="droptt"  ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource5" DataTextField="Store_Name" 
        DataValueField="Store_Serial">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-6" style="float: right"><asp:TextBox ID="TextBox1" runat="server" CssClass="txttt"></asp:TextBox></div>
</asp:Panel>
 <div class="col-3 col-s-12"  style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="بحث عن صنف بداخل المخازن"/></div>
 
 </div> 



<div id="header_print" style="border: thick double #2E895B;width:100%;overflow:auto" align="center" dir="rtl" >  

<div class="col-3 col-s-12"  style="display: inline-block"><asp:Label ID="Label6" runat="server" CssClass="lbltt_header"></asp:Label></div>
 

   <asp:Repeater ID="GridView1" runat="server"  DataSourceID="SqlDataSource1">

<ItemTemplate>
<div class="col-3 col-s-12"><asp:Label ID="Label1" runat="server" Text='<%# Bind("item_Code_All") %>' CssClass="lbltt"></asp:Label></div>
                           
<div class="col-3 col-s-12"><asp:Label ID="Label2" runat="server" Text='<%# Bind("item_Desc_All") %>' CssClass="lbltt_header"></asp:Label></div>
                           
<div class="col-3 col-s-12"><asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount_Final") %>' CssClass="txttt"></asp:Label></div>
                         
</ItemTemplate>
                      
</asp:Repeater>

</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>

    <table align="center" cellspacing="1" dir="rtl">
        <tr>
            <td align="center" dir="rtl" valign="middle">

                &nbsp;</td>
            <td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        
        
        SelectCommand="SELECT Store_Serial, Store_Name FROM STORES.Store">
    </asp:SqlDataSource>

            </td>
            <td align="center" dir="rtl" valign="middle">

                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" dir="rtl" valign="middle">

                &nbsp;</td>
            <td align="center" dir="rtl" valign="middle">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="Inventory_Transaction_Statistics_Stores_Serial" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList5" Name="Store_Serial" 
                            PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="X" 
                            Name="item_Desc_All" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList6" Name="Final_Status" 
                            PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center" dir="rtl" valign="middle">

                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

