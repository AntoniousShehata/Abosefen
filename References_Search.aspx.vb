Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Collections.Generic

Partial Class References_Search
    Inherits Master_code

    Private PageSize As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Label1.Visible = False

        If Not IsPostBack Then

            DropDownList1.DataBind()
            DropDownList2.DataBind()
            DropDownList4.DataBind()
            RadMonthYearPicker1.DataBind()
            DataList1.DataBind()

            Button1.Text = "محركات البحث"
            search_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
            img.Style.Add("display", "none")

        End If

    End Sub

    Protected Sub DownloadFile(ByVal sender As Object, ByVal e As EventArgs)

        Dim filePath As String = CType(sender, Button).CommandArgument

        If filePath.Contains(".pdf") Then
            Image1.Visible = False
            Response.Redirect("REF\" + filePath)
        Else
            Image1.Visible = True
            Image1.ImageUrl = "REF\" + filePath
        End If

        search_div.Style.Add("display", "block")
        Panel2.Style.Add("display", "none")
        header_print.Style.Add("display", "none")
        Button1.Text = "نتائج البحث"
        img.Style.Add("display", "block")

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Button1.Text = "محركات البحث" Then
            search_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "block")
            header_print.Style.Add("display", "none")
            img.Style.Add("display", "none")
            Button1.Text = "نتائج البحث"

        Else
            search_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
            header_print.Style.Add("display", "block")
            img.Style.Add("display", "none")
            Button1.Text = "محركات البحث"

        End If

    End Sub

End Class
