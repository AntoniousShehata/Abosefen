Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Data

Partial Class Persons_LedgerAccounts_Search
    Inherits Master_code

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        txtSearch0.Visible = True
        If Not IsPostBack Then
            DropDownList17.DataBind()
            DropDownList17_DataBound(DropDownList17, New System.EventArgs())
        End If
        DropDownList17_DataBound(DropDownList17, New System.EventArgs())
    End Sub
    Protected Sub Gridview5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView5.DataBound

        For i As Integer = 0 To GridView5.Rows.Count - 1

            If i = GridView5.Rows.Count - 1 And GridView5.Rows.Count > 1 Then
                GridView5.Visible = True
                GridView5.Rows(i - 1).Cells(1).Visible = False
                GridView5.Rows(i - 1).Cells(2).Visible = False
                GridView5.Rows(i - 1).Cells(0).Attributes.Add("colspan", "3")
                GridView5.Rows(i - 1).BackColor = Color.ForestGreen
                GridView5.Rows(i - 1).ForeColor = Color.White
                GridView5.Rows(i - 1).Cells(0).HorizontalAlign = HorizontalAlign.Center
                GridView5.Rows(i - 1).Cells(0).Font.Bold = True
                GridView5.Rows(i - 1).Cells(0).Font.Size = 20
                GridView5.Rows(i - 1).Cells(0).Font.Name = "Arabic Typesetting"


                GridView5.Rows(i).Cells(1).Visible = False
                GridView5.Rows(i).Cells(2).Visible = False
                GridView5.Rows(i).Cells(0).Attributes.Add("colspan", "3")
                GridView5.Rows(i).BackColor = Color.Maroon
                GridView5.Rows(i).ForeColor = Color.White
                GridView5.Rows(i).Cells(0).HorizontalAlign = HorizontalAlign.Center
                GridView5.Rows(i).Cells(0).Font.Bold = True
                GridView5.Rows(i).Cells(0).Font.Size = 22
                GridView5.Rows(i).Cells(0).Font.Name = "Arabic Typesetting"
              
            Else
                GridView5.Visible = False
            End If

        Next

    End Sub
    Protected Sub DropDownList17_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList17.DataBound

        For i As Integer = 0 To DropDownList17.Items.Count - 1

            Dim dropdesc As String = DropDownList17.Items.Item(i).Text

            Dim number_validate As Array = dropdesc.Split("=")

            Dim x As Integer = 0
            Dim finalnumber As String = ""

            While x < number_validate.Length
                If x > 0 Then
                    finalnumber += number_validate(x).ToString + "="
                End If
                x = x + 1
            End While

            If finalnumber.Length > 0 Then
                finalnumber = finalnumber.Substring(0, finalnumber.Length - 1)
            End If


            If finalnumber < 0 Then
                DropDownList17.Items.Item(i).Attributes.Add("style", "color:Red")

            ElseIf finalnumber = 0 Then
                DropDownList17.Items.Item(i).Attributes.Add("style", "color:black")

            Else
                DropDownList17.Items.Item(i).Attributes.Add("style", "color:green")
            End If

        Next
    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click
        DropDownList17_DataBound(DropDownList17, New System.EventArgs())
        Label6.Text = " حساب " + DropDownList17.SelectedItem.Text
    End Sub
End Class
