<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="INVOICES_IMG.aspx.vb" Inherits="INVOICES_IMG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                              <asp:Image ID="Image2" runat="server" Height="85px" Width="76px"  ImageUrl='<%# eval("FilePath_View") %>' />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AbosefenConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT Invoice_Serial, Invoice_FilePath, 'invoices/' + CONVERT (nvarchar, Invoice_TypeCode) + '/' + Invoice_FilePath AS FilePath_View FROM INVOICES.Invoice WHERE (Invoice_FilePath IS NOT NULL)">
                </asp:SqlDataSource>
      
</asp:Content>

