Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.Odbc.OdbcDataAdapter
Imports System.Diagnostics.Debug
Imports System.Globalization

Partial Class Site
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Session.Timeout = 300
        
        If Session("USERNAME") = "" Then
            Application.Contents.RemoveAll()
            Session.Contents.RemoveAll()
            Session.Abandon()
            Response.Redirect("Log In.aspx")
        End If
    
    End Sub
  
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Application.Contents.RemoveAll()
        Session.Contents.RemoveAll()
        Session.Abandon()
        Response.Redirect("Log In.aspx")
    End Sub

End Class

