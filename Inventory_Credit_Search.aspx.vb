Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Drawing

Partial Class Inventory_Credit_Search
    Inherits Master_code
   
    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click

        If DropDownList6.SelectedValue = 0 And DropDownList5.SelectedValue = 0 Then
            Label6.Text = "بيان بجميع الأصناف بالكود"
        ElseIf DropDownList6.SelectedValue = 0 And DropDownList5.SelectedValue <> 0 Then
            Label6.Text = " رصيد " + DropDownList5.SelectedItem.Text

        ElseIf DropDownList6.SelectedValue <> 0 And DropDownList5.SelectedValue <> 0 Then
            Label6.Text = " رصيد " + DropDownList5.SelectedItem.Text + " - " + DropDownList6.SelectedItem.Text
        End If

    End Sub


End Class
