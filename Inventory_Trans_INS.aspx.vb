Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class Inventory_Trans_INS
    Inherits Master_code

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearch0.Visible = True

        GridView1.DataBind()
        GridView2.DataBind()

        If HiddenField1.Value = 0 Then
            GridView1.Visible = False
            TextBox1.Text = ""
            TextBox1.Visible = False
        Else
            GridView1.Visible = True
        End If

        If GridView1.SelectedIndex = -1 Or GridView2.SelectedIndex = -1 Then
            Button5.Visible = False
        Else
            Button5.Visible = True
        End If

    End Sub
    Protected Sub DropDownList5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.DataBound

        For i As Integer = 0 To DropDownList5.Items.Count - 1

            If DropDownList5.Items.Item(i).Value = 0 Then
                DropDownList5.Items.Item(i).Attributes.Add("style", "color:Red")
            Else
                DropDownList5.Items.Item(i).Attributes.Add("style", "color:green")
            End If

        Next

    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.SelectedIndexChanged

        DropDownList5_DataBound(DropDownList5, New System.EventArgs())
        GridView1.SelectedIndex = -1
        GridView2.SelectedIndex = -1
        TextBox1.Text = ""
        TextBox1.Visible = False

        If GridView1.SelectedIndex = -1 Or GridView2.SelectedIndex = -1 Then
            Button5.Visible = False
        Else
            Button5.Visible = True
        End If
    End Sub
    Protected Sub Gridview1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

        Dim count As Integer = GridView1.Rows.Count

        For i As Integer = 0 To GridView1.Rows.Count - 1

            Dim lblparent10 As Label = CType(GridView1.Rows(i).FindControl("Label2"), Label)

            If lblparent10.Text = "0" Or lblparent10.Text.Contains("-") = True Then
                GridView1.Rows(i).Visible = False
                count = count - 1
            Else
                GridView1.Rows(i).Visible = True
            End If

        Next

        HiddenField1.Value = count
    End Sub
    Protected Sub Gridview2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.DataBound

        For i As Integer = 0 To GridView2.Rows.Count - 1
            Dim lblparent10 As Label = CType(GridView1.Rows(i).FindControl("Label1"), Label)

            If lblparent10.Text = "غير محدد" Then
                GridView2.Rows(i).Visible = False
            Else
                GridView2.Rows(i).Visible = True
            End If

        Next

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim lblparent10 As Label = CType(GridView1.SelectedRow.FindControl("Label2"), Label)

        TextBox1.Visible = True
        TextBox1.Text = lblparent10.Text
        DropDownList5_DataBound(DropDownList5, New System.EventArgs())
        If GridView1.SelectedIndex = -1 Or GridView2.SelectedIndex = -1 Then
            Button5.Visible = False
        Else
            Button5.Visible = True
        End If

    End Sub

    Protected Sub txtSearch0_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSearch0.TextChanged

        GridView1.SelectedIndex = -1
        GridView2.SelectedIndex = -1
        TextBox1.Text = ""
        TextBox1.Visible = False
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged

        DropDownList5_DataBound(DropDownList5, New System.EventArgs())
        If GridView1.SelectedIndex = -1 Or GridView2.SelectedIndex = -1 Then
            Button5.Visible = False
        Else
            Button5.Visible = True
        End If
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click

        Dim lblparent10 As Label = CType(GridView1.SelectedRow.FindControl("Label2"), Label)

        If GridView1.SelectedDataKey.Value = GridView2.SelectedDataKey.Value Then
            Label62.Visible = True
            Label62.Text = "لا يمكن التحويل إلى نفس المخزن"
        ElseIf Not IsNumeric(TextBox1.Text) Then
            Label62.Visible = True
            Label62.Text = "إدخل كمية التحويل بالارقام فقط"
        ElseIf TextBox1.Text.Contains(".") = True Then
            Label62.Visible = True
            Label62.Text = "يجب تحويل عدد صحيح كم الكمية فقط"
        ElseIf Convert.ToInt32(TextBox1.Text) > Convert.ToInt32(lblparent10.Text) Then
            Label62.Visible = True
            Label62.Text = "لا توجد كمية كافية للتحويل إلى مخزن آخر"
        Else
            Label62.Visible = False
            Label62.Text = ""

            Dim storeparent1 As Label = CType(GridView1.SelectedRow.FindControl("Label1"), Label)
            Dim storeparent2 As Label = CType(GridView2.SelectedRow.FindControl("Label1"), Label)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Inventory_Transfers_INS]"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@Store_name", SqlDbType.NVarChar, -1)
            parm0.Value = storeparent1.Text

            Dim parm1 As New SqlParameter("@Store_name_2", SqlDbType.NVarChar, -1)
            parm1.Value = storeparent2.Text

            Dim parm2 As New SqlParameter("@Invoice_Serial", SqlDbType.Int, 4)
            parm2.Direction = ParameterDirection.Output

            Dim parm3 As New SqlParameter("@Invoice_Serial_2", SqlDbType.Int, 4)
            parm3.Direction = ParameterDirection.Output

            Dim parm4 As New SqlParameter("@Item_Serial", SqlDbType.Int, 4)
            parm4.Value = DropDownList5.SelectedValue

            Dim parm5 As New SqlParameter("@Item_Amount", SqlDbType.Int, 4)
            parm5.Value = TextBox1.Text

            Dim parm6 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            parm6.Value = Session("OPR_NUMBER")

            Dim parm7 As New SqlParameter("@Store_Serial", SqlDbType.Int, 4)
            parm7.Value = GridView1.SelectedDataKey.Value

            Dim parm8 As New SqlParameter("@Store_Serial_2", SqlDbType.Int, 4)
            parm8.Value = GridView2.SelectedDataKey.Value

            cmd.Parameters.Add(parm0)
            cmd.Parameters.Add(parm1)
            cmd.Parameters.Add(parm2)
            cmd.Parameters.Add(parm3)
            cmd.Parameters.Add(parm4)
            cmd.Parameters.Add(parm5)
            cmd.Parameters.Add(parm6)
            cmd.Parameters.Add(parm7)
            cmd.Parameters.Add(parm8)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            'Label63.Text = parm2.Value
            'HiddenField2.Value = parm3.Value

            mysqlcon.Close()
            GridView1.DataBind()
            GridView2.DataBind()
            GridView3.DataBind()
            GridView1.SelectedIndex = -1
            GridView2.SelectedIndex = -1
            TextBox1.Text = ""
            TextBox1.Visible = False
            Button5.Visible = False
            cmd.Parameters.Clear()
        End If

        DropDownList5_DataBound(DropDownList5, New System.EventArgs())

    End Sub
    Protected Sub Gridview3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.DataBound

        For i As Integer = 0 To GridView3.Rows.Count - 1

            If DropDownList5.SelectedValue = 0 And GridView3.Rows.Count > 0 Then
                GridView3.Rows(i).Cells(2).Visible = True
                GridView3.HeaderRow.Cells(2).Visible = True
            Else
                GridView3.Rows(i).Cells(2).Visible = False
                GridView3.HeaderRow.Cells(2).Visible = False
            End If
        Next

        'For i As Integer = 0 To GridView3.Rows.Count - 1

        '    If GridView2.Rows(i).Cells(1).Text = "غير محدد" Then
        '        GridView2.Rows(i).Visible = False
        '    Else
        '        GridView2.Rows(i).Visible = True
        '    End If

        'Next

    End Sub
End Class
