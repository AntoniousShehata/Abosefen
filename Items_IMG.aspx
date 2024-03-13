<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Items_IMG.aspx.vb" Inherits="Items_IMG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                              <asp:Image ID="Image2" runat="server" Height="100%" Width="100%"  ImageUrl='<%# eval("Item_img") %>' />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    SelectCommand="SELECT ITEMS.ItemPhoto.Item_Serial, ITEMS.ItemPhoto.ItemPhoto_Serial, 'IMG\' + CONVERT (nvarchar, ITEMS.Item.Origin_Code) + '\' + CONVERT (nvarchar, ITEMS.Item.Company_Code) + '\' + CONVERT (nvarchar, ITEMS.Item.Category_Code) + '\' + CONVERT (nvarchar, ITEMS.Item.Model_Code) + '\' + CONVERT (nvarchar, ITEMS.Item.SubCategory_Code) + '\' + CONVERT (nvarchar, ITEMS.Item.Item_Serial) + '\' + ITEMS.ItemPhoto.ItemPhoto_Path AS Item_img FROM ITEMS.ItemPhoto INNER JOIN ITEMS.Item ON ITEMS.ItemPhoto.Item_Serial = ITEMS.Item.Item_Serial WHERE (ITEMS.ItemPhoto.Item_Serial = @Item_Serial)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Item_Serial" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
          
</asp:Content>

