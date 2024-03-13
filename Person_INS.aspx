<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Person_INS.aspx.vb" Inherits="Person_INS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <div id="hide" dir="rtl">
 <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label5" runat="server" Text="تسجيل عميل جديد" CssClass="lbltt_header"></asp:Label></div>


 <div class="col-3 col-s-12" style="display: inline-block" ><asp:Label ID="Label1" runat="server" CssClass="lbltt_val"></asp:Label></div>
 
<asp:Panel ID="Panel2" runat="server" defaultbutton="Button4">

  <div class="col-3 col-s-12" style="display: inline-block" >
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label31" runat="server" Text="طبيعة العميل" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
 <asp:DropDownList CssClass="droptt"  ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="PersonType_Desc" 
        DataValueField="PersonType_code">
    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label36" runat="server" Text="نوع العميل" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
  <asp:DropDownList CssClass="droptt"  ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="PersonGender_Desc" 
        DataValueField="PersonGender_Code">
    </asp:DropDownList>
 </div>
 </div>

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label39" runat="server" Text="الإسم" CssClass="lbltt"></asp:Label></div>

<div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="TextBox2" runat="server" CssClass="txttt"></asp:TextBox></div>
   
<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label40" runat="server" Text="ملاحظات" CssClass="lbltt"></asp:Label></div>

<div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="TextBox3" runat="server" CssClass="txttt"></asp:TextBox></div>

<div class="col-3 col-s-12" style="display: inline-block"><asp:Label ID="Label41" runat="server" Text="العنوان" CssClass="lbltt"></asp:Label></div>

<div class="col-3 col-s-12" style="display: inline-block"><asp:TextBox ID="TextBox4" runat="server" CssClass="txttt"></asp:TextBox></div>

<div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button4" runat="server" Text="تسجيل بيانات عميل"/></div>

</asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Direction="RightToLeft" Visible="False" defaultbutton="Button5">

  <div class="col-3 col-s-12" style="display: inline-block">
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label42" runat="server" Text="وسيلة الإتصال" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right">
                <asp:DropDownList CssClass="droptt"  ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="PhoneType_Desc" 
                        DataValueField="PhoneType_Code">
                    </asp:DropDownList>
 </div>
 <div class="col-3 col-s-3" style="float: right"><asp:Label ID="Label43" runat="server" Text="تليفون/بريد" CssClass="lbltt"></asp:Label></div>
 <div class="col-3 col-s-3" style="float: right"><asp:TextBox ID="TextBox5" runat="server" CssClass="txttt"></asp:TextBox></div>
 </div>



  <div class="col-3 col-s-12" style="display: inline-block" align="center"><asp:Button CssClass="btntt"  ID="Button5" runat="server" Text="تسجيل وسيلة الإتصال"/></div>

 </asp:Panel>

    
    <div style="width:100%;overflow:auto">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource3" DataKeyNames="Person_Code" 
            style="width:100%;overflow:auto">
                    <Columns>
       <asp:CommandField SelectText="إختر لتسجيل وسيلة إتصال" ShowSelectButton="True" ButtonType="Button" ItemStyle-CssClass="btntt">
<ItemStyle CssClass="btntt"></ItemStyle>
                        </asp:CommandField>
                        <asp:TemplateField HeaderText="الإسم" SortExpression="Person_Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Person_Name") %>' CssClass="txttt"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Person_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="طبيعة العميل" SortExpression="PersonType_Desc">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PersonType_Desc") %>' CssClass="txttt"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PersonType_Desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع العميل" SortExpression="PersonGender_Desc">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("PersonGender_Desc") %>' CssClass="txttt"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("PersonGender_Desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="العنوان" SortExpression="Person_Address">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Person_Address") %>' CssClass="txttt"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Person_Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ملاحظات" SortExpression="Person_Detail">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Person_Detail") %>' CssClass="txttt"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Person_Detail") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="وسيلة اتصال">
                            <ItemTemplate>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="PersonPhone_Code" DataSourceID="SqlDataSource1" 
                                    ShowHeader="False" BackColor="White" BorderColor="#CC9966" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" style="width:100%;overflow:auto">
                                    <Columns>
                                        <asp:BoundField DataField="PhoneType_Desc" 
                                            SortExpression="PhoneType_Desc" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PersonPhone_number" HeaderText="PersonPhone_number" 
                                            SortExpression="PersonPhone_number" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
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
                                <asp:Label ID="Label44" runat="server"  Text='<%# Eval("Person_Code") %>' Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                                    
                                    SelectCommand="SELECT PERSON.PhoneType.PhoneType_Desc, PERSON.PersonPhone.PersonPhone_number, PERSON.PersonPhone.Person_Code, PERSON.PersonPhone.PersonPhone_Code FROM PERSON.PersonPhone INNER JOIN PERSON.PhoneType ON PERSON.PersonPhone.PhoneType_Code = PERSON.PhoneType.PhoneType_Code WHERE (PERSON.PersonPhone.PersonPhone_Status = 1) AND (PERSON.PersonPhone.Person_Code = @Person_Code)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label44" Name="Person_Code" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                       <HeaderStyle BackColor="Maroon" Font-Bold="True" Font-Names="Arial" 
                        Font-Size="16pt" ForeColor="White" HorizontalAlign="Center" 
                        VerticalAlign="Middle" />
                </asp:GridView>
    
    </div>

</div>
<div class="push"><img src="pictures/cover.jpg" align="middle" style="width: 100%" /></div>
<table align="center" dir="rtl" >
<tr>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT PersonType_code, PersonType_Desc FROM PERSON.PersonType">
    </asp:SqlDataSource>
</td>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT PersonGender_Code, PersonGender_Desc FROM PERSON.PersonGender">
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        
        SelectCommand="SELECT PERSON.Person.Person_Name, PERSON.PersonType.PersonType_Desc, PERSON.PersonGender.PersonGender_Desc, PERSON.PersonType.PersonType_code, PERSON.PersonGender.PersonGender_Code, PERSON.Person.Person_Detail, PERSON.Person.Person_Address, PERSON.Person.Person_Code FROM PERSON.Person INNER JOIN PERSON.PersonGender ON PERSON.Person.PersonGender_Code = PERSON.PersonGender.PersonGender_Code INNER JOIN PERSON.PersonType ON PERSON.Person.PersonType_code = PERSON.PersonType.PersonType_code WHERE (PERSON.PersonType.PersonType_code = @PersonType_code) AND (PERSON.PersonGender.PersonGender_Code = @PersonGender_Code) AND (PERSON.Person.Person_Code &lt;&gt; 0) OR (PERSON.PersonType.PersonType_code = @PersonType_code) AND (PERSON.Person.Person_Code &lt;&gt; 0) AND (@PersonType_code = 0) OR (PERSON.PersonGender.PersonGender_Code = @PersonGender_Code) AND (PERSON.Person.Person_Code &lt;&gt; 0) AND (@PersonGender_Code = 0) OR (PERSON.Person.Person_Code &lt;&gt; 0) AND (@PersonType_code = 0) AND (@PersonGender_Code = 0)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" 
                Name="PersonType_code" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="0" 
                Name="PersonGender_Code" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
<td align="center" dir="rtl" valign="middle">
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
        SelectCommand="SELECT PhoneType_Code, PhoneType_Desc FROM PERSON.PhoneType">
    </asp:SqlDataSource>
</td>
</tr>
</table>

    </asp:Content>

