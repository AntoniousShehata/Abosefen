Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization

Partial Class GENERAL_LEDGER_INS
    Inherits Master_code

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

        For i As Integer = 0 To GridView1.Rows.Count - 1

            Dim lblparent1 As Label = CType(GridView1.Rows(i).FindControl("Label2"), Label)
            Dim lblparent3 As Label = CType(GridView1.Rows(i).FindControl("Label4"), Label)
            Dim lblparent4 As Label = CType(GridView1.Rows(i).FindControl("Label5"), Label)
            Dim lblparent5 As Label = CType(GridView1.Rows(i).FindControl("Label6"), Label)

            lblparent3.BackColor = Color.ForestGreen
            lblparent3.ForeColor = Color.White

            lblparent4.BackColor = Color.Maroon
            lblparent4.ForeColor = Color.White

            lblparent5.BackColor = Color.LightGoldenrodYellow
            lblparent5.ForeColor = Color.Black

            If RadDatePicker1.SelectedDate Is Nothing Then
                If i = 0 Then
                    lblparent1.Text = ""
                    GridView1.HeaderRow.Cells(1).Text = ""
                ElseIf i <> 0 And i = GridView1.Rows.Count - 1 Then
                    lblparent1.Text = ""
                    GridView1.HeaderRow.Cells(1).Text = ""
                ElseIf i <> 0 And i = GridView1.Rows.Count - 1 Then
                    lblparent1.Visible = True
                    GridView1.HeaderRow.Cells(1).Visible = True
                End If

            Else

                lblparent1.Visible = False
                lblparent1.Visible = False
            End If

            If TextBox13.Text = "" Then
                If i = 0 And i <> GridView1.Rows.Count - 1 Then
                    lblparent5.Text = Convert.ToDecimal(lblparent3.Text) - Convert.ToDecimal(lblparent4.Text)
                ElseIf i <> 0 And i <> GridView1.Rows.Count - 1 Then
                    Dim lblparent05 As Label = CType(GridView1.Rows(i - 1).FindControl("Label6"), Label)
                    lblparent5.Text = Convert.ToDecimal(lblparent05.Text) + Convert.ToDecimal(lblparent3.Text) - Convert.ToDecimal(lblparent4.Text)
                ElseIf i <> 0 And i = GridView1.Rows.Count - 1 Then
                    Dim lblparent05 As Label = CType(GridView1.Rows(i - 1).FindControl("Label6"), Label)
                    lblparent5.Text = Convert.ToDecimal(lblparent05.Text)
                End If


            Else
                If i = 0 Then
                    lblparent5.Text = "0"
                    lblparent4.Text = "0"
                    lblparent3.Text = "0"
                ElseIf i <> 0 And i <> GridView1.Rows.Count - 1 Then
                    Dim lblparent05 As Label = CType(GridView1.Rows(i - 1).FindControl("Label6"), Label)
                    lblparent5.Text = Convert.ToDecimal(lblparent05.Text) + Convert.ToDecimal(lblparent3.Text) - Convert.ToDecimal(lblparent4.Text)
                ElseIf i <> 0 And i = GridView1.Rows.Count - 1 Then
                    Dim lblparent05 As Label = CType(GridView1.Rows(i - 1).FindControl("Label6"), Label)
                    lblparent5.Text = Convert.ToDecimal(lblparent05.Text)
                End If

            End If

        Next

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearch.Visible = True

        If Not IsPostBack Then
            ledger_Transfers.Style.Add("display", "none")
            Panel1.Style.Add("display", "block")
            header_print.Style.Add("display", "block")
            Button1.Text = "تسجيل معاملات دفتر يومية"
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Button1.Text = "تسجيل معاملات دفتر يومية" Then
            ledger_Transfers.Style.Add("display", "block")
            Panel1.Style.Add("display", "none")
            header_print.Style.Add("display", "none")
            Button1.Text = "بحث فى دفتر اليومية"
        Else
            ledger_Transfers.Style.Add("display", "none")
            Panel1.Style.Add("display", "block")
            header_print.Style.Add("display", "block")
            Button1.Text = "تسجيل معاملات دفتر يومية"
        End If

    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click

        If DropDownList16.SelectedValue = 0 Then
            Label11.Text = "برجاء إختيار نوع المعاملة"
            Label11.Visible = True
        ElseIf DropDownList14.SelectedValue = 0 Then
            Label11.Text = "برجاء إختيار تصنيف المعاملة"
            Label11.Visible = True
        ElseIf DropDownList15.SelectedValue = 0 Then
            Label11.Text = "برجاء إختيار المعاملة"
            Label11.Visible = True
        ElseIf DropDownList5.SelectedValue = 0 And DropDownList14.SelectedValue = 1 Then
            Label11.Text = "برجاء إختيار العميل"
            Label11.Visible = True
        ElseIf DropDownList5.SelectedValue = 0 And DropDownList14.SelectedValue = 2 Then
            Label11.Text = "برجاء إختيار الموظف"
            Label11.Visible = True
        ElseIf Not IsNumeric(TextBox10.Text) Then
            Label11.Text = "برجاء مبلغ المعاملة"
            Label11.Visible = True
        ElseIf DropDownList13.SelectedValue = 0 Then
            Label11.Text = "برجاء إختيار وسيلة الدفع"
            Label11.Visible = True
        ElseIf TextBox11.Text = "" And DropDownList13.SelectedValue > 1 Then
            Label11.Text = "برجاء تسجيل رقم الحساب او العملية"
            Label11.Visible = True
        Else
            Label11.Text = ""
            Label11.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Invoice_Ledger_Transactions_INS]"
            cmd.Connection = mysqlcon

            cmd.Parameters.AddWithValue("@Invoice_Serial", 0)
            cmd.Parameters.AddWithValue("@Person_Code", DropDownList5.SelectedValue)
            cmd.Parameters.AddWithValue("@AmountDueMean_Code", DropDownList13.SelectedValue)
            cmd.Parameters.AddWithValue("@Amount_Due", TextBox10.Text)
            If DropDownList13.SelectedValue <> 1 Then
                cmd.Parameters.AddWithValue("@DueMean_Reference_Number", TextBox11.Text)
            Else
                cmd.Parameters.AddWithValue("@DueMean_Reference_Number", DBNull.Value)
            End If
            If TextBox12.Text <> "" Then
                cmd.Parameters.AddWithValue("@Trans_Notes", TextBox12.Text)
            Else
                cmd.Parameters.AddWithValue("@Trans_Notes", DBNull.Value)
            End If

            cmd.Parameters.AddWithValue("@TransType_Code", DropDownList15.SelectedValue)

            'cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4)
            'cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()

            DropDownList16.SelectedValue = 0
            DropDownList14.SelectedValue = 0
            DropDownList15.SelectedIndex = -1
            txtSearch.Text = ""
            DropDownList5.SelectedValue = 0
            TextBox10.Text = ""
            DropDownList13.SelectedValue = 0
            TextBox11.Text = ""
            TextBox12.Text = ""

            ledger_Transfers.Style.Add("display", "none")
            Button1.Text = "تسجيل معاملات دفتر يومية"
            cmd.Parameters.Clear()
        End If
        GridView1.DataBind()

    End Sub

    Protected Sub DropDownList13_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList13.SelectedIndexChanged

        If DropDownList13.SelectedValue = 0 Or DropDownList13.SelectedValue = 1 Then
            Label84.Visible = False
            TextBox11.Visible = False
            TextBox11.Text = ""
        Else
            Label84.Visible = True
            TextBox11.Visible = True
            TextBox11.Text = ""
        End If

    End Sub


    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click

        If Not RadDatePicker1.SelectedDate Is Nothing Then
            Dim date_1 As Date
            Dim date_label As String
            Dim day_label As String
            Dim day_1 As Integer
            Dim month_label As String
            Dim year_1 As Integer

            date_1 = RadDatePicker1.SelectedDate

            day_label = date_1.ToString("dddd", New CultureInfo("ar-AE"))
            day_1 = date_1.ToString("dd", New CultureInfo("ar-AE"))
            month_label = date_1.ToString("MMMM", New CultureInfo("ar-AE"))
            year_1 = date_1.ToString("yyyy", New CultureInfo("ar-AE"))
            date_label = " يوم " + day_label + " الموافق " + ConvertToEasternArabicNumerals(day_1) + " " + month_label + " سنة " + ConvertToEasternArabicNumerals(year_1) + " "

            If DropDownList18.SelectedValue = 0 And TextBox13.Text = "" Then
                Label94.Text = " دفتر يومية كامل " + date_label

            ElseIf DropDownList18.SelectedValue <> 0 And TextBox13.Text = "" Then
                Label94.Text = " دفتر يومية " + date_label + " - " + DropDownList18.SelectedItem.Text

            ElseIf DropDownList18.SelectedValue <> 0 And TextBox13.Text <> "" Then
                Label94.Text = " دفتر يومية " + date_label + " - " + DropDownList18.SelectedItem.Text + " و البحث بكلمة " + "(" + TextBox13.Text + " ) "

            ElseIf DropDownList18.SelectedValue = 0 And TextBox13.Text <> "" Then
                Label94.Text = " دفتر يومية " + date_label + " و البحث بكلمة " + "(" + TextBox13.Text + " ) "

            Else
                Label94.Text = "ERROR"

            End If
        Else

            If DropDownList18.SelectedValue = 0 And TextBox13.Text = "" Then
                Label94.Text = " دفتر يومية كامل "

            ElseIf DropDownList18.SelectedValue <> 0 And TextBox13.Text = "" Then
                Label94.Text = " دفتر يومية " + " - " + DropDownList18.SelectedItem.Text

            ElseIf DropDownList18.SelectedValue <> 0 And TextBox13.Text <> "" Then
                Label94.Text = " دفتر يومية " + " - " + DropDownList18.SelectedItem.Text + " و البحث بكلمة " + "(" + TextBox13.Text + " ) "

            ElseIf DropDownList18.SelectedValue = 0 And TextBox13.Text <> "" Then
                Label94.Text = " دفتر يومية " + " و البحث بكلمة " + "(" + TextBox13.Text + " ) "

            Else
                Label94.Text = "ERROR"

            End If

        End If

    End Sub

End Class
