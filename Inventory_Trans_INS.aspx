<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Inventory_Trans_INS.aspx.vb" Inherits="Inventory_Trans_INS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



   <div id="hide" class="col-3 col-s-12" style="display: inline-block" dir="rtl">
  
 <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label5" runat="server" Text="إدخال آذونات تحويل بين مخازن" CssClass="lbltt_header"></asp:Label></div>
    
    <asp:Panel ID="Panel1" runat="server" defaultbutton="Button5">
  
     <div class="col-3 col-s-12" style="display: inline-block" > 
  <div class="col-3 col-s-6" style="float: right">
  <asp:TextBox ID="txtSearch0" runat="server" onkeyup="FilterItemsY(this.value)" autofocus="true" Visible="False" CssClass="txttt"></asp:TextBox>
   </div>
     <div class="col-3 col-s-6" style="float: right">
   <asp:DropDownList CssClass="droptt"  ID="DropDownList5" runat="server" 
        DataSourceID="SqlDataSource5" DataTextField="DESC_TOTAL_ITEM" 
        DataValueField="Item_Serial" AutoPostBack="True">
    </asp:DropDownList>
    </div>
     </div>
  
   <div class="col-3 col-s-12 txttt" style="display: inline-block" > 
     <div class="col-3 col-s-6 txttt" style="float: right"> 
<asp:Label ID="Label6" runat="server" Text="التحويل من مخزن" CssClass="lbltt_header"></asp:Label>

  <asp:GridView ID="GridView1" runat="server"
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataSourceID="SqlDataSource1" 
                    GridLines="Horizontal" Width="100%" 
             AutoGenerateColumns="False" DataKeyNames="Store_Serial">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="إختر"/>
                      
                        <asp:TemplateField HeaderText="المخزن" SortExpression="Store_Name">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Store_Name") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Store_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الرصيد المتاح" SortExpression="Amount_Final">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Amount_Final") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount_Final") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666"  ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966"  ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
  </div>

    <div class="col-3 col-s-6 txttt" style="float: right"> 

 <asp:Label ID="Label7" runat="server" Text="التحويل إلى مخزن" CssClass="lbltt_header"></asp:Label>
   
  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataKeyNames="Store_Serial" DataSourceID="SqlDataSource1" 
                    GridLines="Horizontal" Width="100%">
                    <Columns>
                        <asp:CommandField SelectText="إختر" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="المخزن" SortExpression="Store_Name">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Store_Name") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Store_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الرصيد المتاح" SortExpression="Amount_Final">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Amount_Final") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount_Final") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666"  ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966"  ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
   </div>
    </div>

       <div class="col-3 col-s-12" style="display: inline-block" > 

   <div class="col-3 col-s-6" style="float: right"><asp:TextBox ID="TextBox1" runat="server" Visible="False" CssClass="txttt"></asp:TextBox></div>
   
   <div class="col-3 col-s-6" style="float: right" align="center"><asp:Button CssClass="btntt"  ID="Button5" runat="server" Text="إتمام عملية التحويل" /></div>
   
     </div> 
      
   <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label62" runat="server" CssClass="lbltt"></asp:Label></div>
    
    <div class="col-3 col-s-12" style="display: inline-block;width:100%;overflow:auto">
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Invoice_Serial_IN" 
        DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            style="width:100%;overflow:auto">
        <Columns>
            <asp:TemplateField HeaderText="رقم آذن التحويل" SortExpression="Invoice_Number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Invoice_Number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Invoice_Number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ آذن التحويل" SortExpression="Invoice_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Invoice_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Invoice_Date", "{0: yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الصنف" SortExpression="ITEM_DESC">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ITEM_DESC") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ITEM_DESC") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكمية " SortExpression="Item_Amount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Item_Amount") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Item_Amount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="من مخزن" SortExpression="Store_Name_OUT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Store_Name_OUT") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Store_Name_OUT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="إلى مخزن" SortExpression="Store_Name_IN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Store_Name_IN") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Store_Name_IN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الموظف المسئول" SortExpression="Person_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Person_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Person_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000"  ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66"  ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    </div>
  
    </asp:Panel>
   </div>
   <div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
    <table align="center" cellspacing="1" dir="rtl" >
        <tr>
            <td align="center" dir="rtl" valign="middle">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="Inventory_Transaction_Statistics_For_Item" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList5" Name="Item_Serial" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
            <td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        
        
        
        SelectCommand="Total_item_desc_transfer_screen" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

            </td>
            <td align="center" dir="rtl" valign="middle">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="InventoryTransactions_Transfers_IN_OUT" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList5" DefaultValue="0" 
                Name="Item_Serial" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
  
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" valign="middle">

                <asp:HiddenField ID="HiddenField1" runat="server" />

            </td>
            <td align="center" dir="rtl" valign="middle">

                <asp:HiddenField ID="HiddenField2" runat="server" />
            </td>
            <td align="center" dir="rtl" valign="middle">

                &nbsp;</td>
        </tr>
    </table>



    







    <script type="text/javascript">

        var ddlTextY, ddlValueY, ddlY;
        function CacheItems() {

            ddlTextY = new Array();
            ddlValueY = new Array();
            ddlY = document.getElementById("<%=DropDownList5.ClientID %>");

            for (var g = 0; g < ddlY.options.length; g++) {
                ddlTextY[ddlTextY.length] = ddlY.options[g].text;
                ddlValueY[ddlValueY.length] = ddlY.options[g].value;
            }
        }
        window.onload = CacheItems;


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
            var optY = document.createElement("option");

            optY.text = text;
            optY.value = value;

            ddlY.options.add(optY);
        }

                </script>
</asp:Content>

