Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class Invoice_INS
    Inherits Master_code

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        GridView1.DataBind()
        If Not IsPostBack Then
            RadDatePicker1.SelectedDate = Date.Now
            CheckBox1.Checked = True
            CheckBox2.Checked = True

            txtSearch.Visible = True
            Label1.Visible = False
        End If

        DropDownList5_DataBound(DropDownList5, New System.EventArgs())
     
    End Sub
    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click

        If DropDownList1.SelectedValue = 0 Then
            Label1.Text = "إختر نوع الفاتورة"
            Label1.Visible = True
        ElseIf RadDatePicker1.SelectedDate Is Nothing Then
            Label1.Text = "إختر تاريخ الفاتورة"
            Label1.Visible = True
        ElseIf RadDatePicker1.SelectedDate > Date.Now Then
            Label1.Text = "تاريخ الفاتورة غير مناسب"
            Label1.Visible = True
        ElseIf DropDownList5.SelectedValue = 0 And DropDownList5.Visible = True Then
            Label1.Text = "إختر إسم العميل"
            Label1.Visible = True
        ElseIf Not IsNumeric(TextBox2.Text) And CheckBox2.Checked = True And CheckBox2.Visible = True Then
            Label1.Text = "أرقام فقط فى م. فاتورة ذات الصلة"
            Label1.Visible = True
        ElseIf (DropDownList1.SelectedValue = 4 Or DropDownList1.SelectedValue = 6 Or DropDownList1.SelectedValue = 8) And TextBox2.Text = "" Then
            Label1.Text = "يجب ربط فواتير " + DropDownList1.SelectedItem.Text + " بفواتيرها الاصلية "
            Label1.Visible = True
        ElseIf FileUpload1.FileName = "" And CheckBox1.Checked = True And FileUpload1.Visible = True Then
            Label1.Text = "برجاء رفع صورة ضوئية للفاتورة"
            Label1.Visible = True
        Else

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Related_Invoice_Serial_VAL]"
            cmd.Connection = mysqlcon

            Dim rm0 As New SqlParameter("@validate", SqlDbType.Int, 4)
            rm0.Direction = ParameterDirection.Output

            Dim rm1 As New SqlParameter("@Invoice_TypeCode", SqlDbType.Int, 4)
            rm1.Value = DropDownList1.SelectedValue

            Dim rm2 As New SqlParameter("@Related_Invoice_Serial", SqlDbType.Int, 4)
            If TextBox2.Text = "" Then
                rm2.Value = DBNull.Value
            Else
                rm2.Value = TextBox2.Text
            End If

            Dim rm3 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            rm3.Direction = ParameterDirection.Output

            cmd.Parameters.Add(rm0)
            cmd.Parameters.Add(rm1)
            cmd.Parameters.Add(rm2)
            cmd.Parameters.Add(rm3)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            HiddenField2.Value = rm3.Value.ToString

            If rm0.Value = 9 Then
                Label1.Text = "لا يمكن الربط بمسلسل هذه الفاتورة"
                Label1.Visible = True
            Else

                mysqlcon.Close()
                cmd.Parameters.Clear()
                Label1.Text = ""
                Label1.Visible = False

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "[dbo].[Invoice_Invoice_INS]"
                cmd.Connection = mysqlcon

                GridView1.DataBind()
                GridView1.SelectedIndex = 0

                Dim parm0 As New SqlParameter("@Invoice_Serial", SqlDbType.Int, 4)
                parm0.Direction = ParameterDirection.Output

                Dim parm1 As New SqlParameter("@Invoice_TypeCode", SqlDbType.Int, 4)
                parm1.Value = DropDownList1.SelectedValue

                Dim parm2 As New SqlParameter("@Invoice_Date", SqlDbType.Date)
                parm2.Value = RadDatePicker1.SelectedDate

                Dim parm4 As New SqlParameter("@Related_Invoice_Serial", SqlDbType.Int, 4)
                If TextBox2.Text = "" Then
                    parm4.Value = DBNull.Value
                Else
                    parm4.Value = TextBox2.Text
                End If

                Dim parm5 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
                If (DropDownList1.SelectedValue = 4 Or DropDownList1.SelectedValue = 6 Or DropDownList1.SelectedValue = 8) Then
                    parm5.Value = HiddenField2.Value
                Else
                    parm5.Value = DropDownList5.SelectedValue
                End If

                Dim parm6 As New SqlParameter("@Invoice_FilePath", SqlDbType.NVarChar, -1)
                If FileUpload1.FileName = "" Or FileUpload1.Visible = False Then
                    parm6.Value = DBNull.Value
                Else
                    savePath = "D:\AbosefenApp\Invoices\" + DropDownList1.SelectedValue + "\" + GridView1.SelectedDataKey.Value.ToString
                    ext = Path.GetExtension(Path.GetFileName(FileUpload1.PostedFile.FileName.ToString))
                    fileupload_all(FileUpload1.PostedFile.FileName.ToString, FileUpload1.PostedFile.InputStream)

                    FileUpload1.SaveAs(savePath)
                    parm6.Value = GridView1.SelectedDataKey.Value.ToString + ext
                End If

                Dim parm7 As New SqlParameter("@Invoice_Notes", SqlDbType.NVarChar, -1)
                parm7.Value = TextBox3.Text

                cmd.Parameters.Add(parm0)
                cmd.Parameters.Add(parm1)
                cmd.Parameters.Add(parm2)
                cmd.Parameters.Add(parm4)
                cmd.Parameters.Add(parm5)
                cmd.Parameters.Add(parm6)
                cmd.Parameters.Add(parm7)

                mysqlcon.Open()
                cmd.ExecuteNonQuery()
                mysqlcon.Close()
                cmd.Parameters.Clear()
                HiddenField1.Value = parm0.Value
                Response.Redirect("Invoice_Detail_INS.aspx?id=" + HiddenField1.Value + "&go=1")
              
            End If
           
        End If

    End Sub

    Protected Sub CheckBox2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged

        If CheckBox2.Checked = True Then
            TextBox2.Enabled = True
            TextBox2.Text = ""
        Else
            TextBox2.Enabled = False
            TextBox2.Text = ""
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        If DropDownList1.SelectedValue = 11 Or DropDownList1.SelectedValue = 12 Then
            txtSearch.Visible = False
            txtSearch.Text = ""
            DropDownList5.SelectedIndex = 0
            DropDownList5.Visible = False
            Label40.Visible = False
            CheckBox2.Visible = False
            CheckBox2.Checked = True
            TextBox2.Visible = False
            TextBox2.Text = ""
          CheckBox1.Checked = True
            CheckBox1.Visible = False
            FileUpload1.Visible = False
            TextBox3.Text = ""
        ElseIf (DropDownList1.SelectedValue = 4 Or DropDownList1.SelectedValue = 6 Or DropDownList1.SelectedValue = 8) Then
            txtSearch.Visible = False
            txtSearch.Text = ""
            DropDownList5.SelectedIndex = 0
            DropDownList5.Visible = False
            Label40.Visible = False
            CheckBox2.Visible = True
            CheckBox2.Checked = True
            TextBox2.Visible = True
            TextBox2.Text = ""
            CheckBox1.Checked = True
            CheckBox1.Visible = True
            FileUpload1.Visible = True
            TextBox3.Text = ""
        Else
            txtSearch.Visible = True
            txtSearch.Text = ""
            DropDownList5.SelectedIndex = 0
            DropDownList5.Visible = True
            Label40.Visible = True
            CheckBox2.Visible = True
            CheckBox2.Checked = True
            TextBox2.Visible = True
            TextBox2.Text = ""
            CheckBox1.Checked = True
            CheckBox1.Visible = True
            FileUpload1.Visible = True
            TextBox3.Text = ""
        End If
    End Sub

    Protected Sub DropDownList5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.DataBound

        For i As Integer = 0 To DropDownList5.Items.Count - 1

            Dim dropdesc As String = DropDownList5.Items.Item(i).Text

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
                DropDownList5.Items.Item(i).Attributes.Add("style", "color:Red")

            ElseIf finalnumber = 0 Then
                DropDownList5.Items.Item(i).Attributes.Add("style", "color:black")

            Else
                DropDownList5.Items.Item(i).Attributes.Add("style", "color:green")
            End If

        Next
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.SelectedIndexChanged

        DropDownList5_DataBound(DropDownList5, New System.EventArgs())

    End Sub

End Class
