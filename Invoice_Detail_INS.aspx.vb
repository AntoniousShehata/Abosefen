Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Drawing
Imports System.Globalization

Partial Class Invoice_Detail_INS
    Inherits Master_code
    Dim sent_email_status As Integer = 9
 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearch0.Visible = True

        If Not IsPostBack Then

            sent_email_status = 9
            DropDownList6.DataBind()
            DropDownList7.DataBind()
            DropDownList6.Visible = False
            DropDownList7.Visible = False

            'الجزء الخاص بحقول وحدة قياس الصنف و العدد بالوحدة (مغلق) مؤقتا 
            DropDownList9.DataBind()
            DropDownList9.SelectedValue = 1
            TextBox8.Text = "1"
            DropDownList9.Enabled = False
            DropDownList9.Visible = False
            TextBox8.Visible = False
            Label66.Visible = False
            Label67.Visible = False
            '-------------------------------------------------------------------

            add_item_main.Style.Add("display", "none")
            invoice_update.Style.Add("display", "none")
            Button2.Text = "بيانات رئيسية"

            add_item.Style.Add("display", "none")
            Button3.Text = "إضافة صنف"

            ledger_Transfers.Style.Add("display", "none")
            Button7.Text = "تحصيل فواتير"

            header_print.Style.Add("display", "block")
            Button1.Text = "بنود الفاتورة"

            img.Style.Add("display", "none")

            Label34.Text = "بريد إلكترونى"
            Button9.Text = "إرسال الفاتورة"

            RadDatePicker3.SelectedDate = Date.Now

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "Invoice_Invoice_SEL"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@Invoice_Serial", SqlDbType.Int, 4)
            parm0.Value = Request.QueryString("id")

            Dim parm1 As New SqlParameter("@Invoice_TypeCode", SqlDbType.Int, 4)
            parm1.Direction = ParameterDirection.Output

            Dim parm2 As New SqlParameter("@Invoice_Number", SqlDbType.Int, 4)
            parm2.Direction = ParameterDirection.Output

            Dim parm3 As New SqlParameter("@Invoice_Date", SqlDbType.Date)
            parm3.Direction = ParameterDirection.Output

            Dim parm4 As New SqlParameter("@PaymentMethod_Code", SqlDbType.Int, 4)
            parm4.Direction = ParameterDirection.Output

            Dim parm5 As New SqlParameter("@Related_Invoice_Serial", SqlDbType.Int, 4)
            parm5.Direction = ParameterDirection.Output

            Dim parm6 As New SqlParameter("@Invoice_SpecialDiscount", SqlDbType.Decimal)
            parm6.Direction = ParameterDirection.Output
            parm6.Precision = 18
            parm6.Scale = 2

            Dim parm7 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            parm7.Direction = ParameterDirection.Output

            Dim parm8 As New SqlParameter("@Invoice_StatusCode", SqlDbType.Int, 4)
            parm8.Direction = ParameterDirection.Output

            Dim parm9 As New SqlParameter("@Invoice_Notes", SqlDbType.NVarChar, -1)
            parm9.Direction = ParameterDirection.Output

            Dim parm10 As New SqlParameter("@Invoice_Inventory_Direction", SqlDbType.Int, 4)
            parm10.Direction = ParameterDirection.Output

            Dim parm11 As New SqlParameter("@Invoice_Ledger_Direction", SqlDbType.Int, 4)
            parm11.Direction = ParameterDirection.Output

            Dim parm12 As New SqlParameter("@Invoice_Tax_Discount_Flag", SqlDbType.Int, 4)
            parm12.Direction = ParameterDirection.Output

            cmd.Parameters.Add(parm0)
            cmd.Parameters.Add(parm1)
            cmd.Parameters.Add(parm2)
            cmd.Parameters.Add(parm3)
            cmd.Parameters.Add(parm4)
            cmd.Parameters.Add(parm5)
            cmd.Parameters.Add(parm6)
            cmd.Parameters.Add(parm7)
            cmd.Parameters.Add(parm8)
            cmd.Parameters.Add(parm9)
            cmd.Parameters.Add(parm10)
            cmd.Parameters.Add(parm11)
            cmd.Parameters.Add(parm12)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()

            Label4.Text = parm0.Value
            DropDownList6.DataBind()
            DropDownList6.SelectedValue = parm1.Value
            Label8.Text = parm2.Value
            Label74.Text = Convert.ToDateTime(parm3.Value)
            Label29.Text = String.Format("{0:yyyy/MM/dd}", Convert.ToDateTime(parm3.Value))
            DropDownList8.DataBind()
            DropDownList8.SelectedValue = parm4.Value
            TextBox5.Text = parm5.Value.ToString
            If TextBox5.Text = "" Then
                CheckBox2.Checked = False
                TextBox5.Enabled = False
            Else
                CheckBox2.Checked = True
                TextBox5.Enabled = True
            End If
            TextBox4.Text = parm6.Value.ToString
            DropDownList7.DataBind()
            DropDownList7.SelectedValue = parm7.Value
            DropDownList4.DataBind()
            DropDownList4.SelectedValue = parm8.Value
            TextBox6.Text = parm9.Value.ToString
            HiddenField1.Value = parm10.Value
            HiddenField2.Value = parm11.Value

            If parm12.Value = 9 Then
                RadioButton1.Checked = False
                RadioButton2.Checked = True
            Else
                RadioButton1.Checked = True
                RadioButton2.Checked = False
            End If
            HiddenField4.Value = parm12.Value
            mysqlcon.Close()
            cmd.Parameters.Clear()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[PersonPhone_SEL]"
            cmd.Connection = mysqlcon

            cmd.Parameters.AddWithValue("@Person_Code", DropDownList7.SelectedValue)
            cmd.Parameters.Add("@PersonPhone_number", SqlDbType.NVarChar, -1)
            cmd.Parameters("@PersonPhone_number").Direction = ParameterDirection.Output
            cmd.Parameters.AddWithValue("@PhoneType_Code", 5)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            Dim email_rec As String = Convert.ToString(cmd.Parameters("@PersonPhone_number").Value)
            HiddenField5.Value = email_rec.ToString
            TextBox13.Text = email_rec.ToString
            mysqlcon.Close()

        End If


        If Label74.Text > Date.Now.Date And HiddenField1.Value <> 0 Then

            Button5.Visible = False

            For i As Integer = 0 To GridView2.Items.Count - 1
                Dim bttn As Button = CType(GridView2.Items.Item(i).FindControl("ImageButton1"), Button)
                bttn.Visible = False
            Next

            DropDownList7.Enabled = False
            TextBox5.Enabled = False
            DropDownList8.Enabled = False
            DropDownList4.Enabled = False
            FileUpload2.Enabled = False
            CheckBox1.Enabled = False
            CheckBox2.Enabled = False

            'Button4.Visible = False
            TextBox4.Enabled = True
            'TextBox6.Enabled = False
            TextBox9.Enabled = True
            DropDownList10.Enabled = True
            DropDownList12.Enabled = True
            RadDatePicker3.Enabled = True

            Button2.Visible = False
            Button3.Visible = False
        ElseIf DropDownList6.SelectedValue = 11 And HiddenField1.Value <> 0 Or DropDownList6.SelectedValue = 12 And HiddenField1.Value <> 0 Then

            Button5.Visible = True

            For i As Integer = 0 To GridView2.Items.Count - 1
                Dim bttn As Button = CType(GridView2.Items.Item(i).FindControl("ImageButton1"), Button)
                bttn.Visible = False
            Next

            DropDownList7.Enabled = False
            DropDownList4.Enabled = False
            TextBox5.Enabled = False
            DropDownList8.Enabled = False
            FileUpload2.Enabled = False
            CheckBox1.Enabled = False
            CheckBox2.Enabled = False

            'Button4.Visible = False
            TextBox4.Enabled = False
            'TextBox6.Enabled = False
            TextBox9.Enabled = False
            TextBox9.Text = "0"
            DropDownList10.Enabled = False
            DropDownList12.Enabled = False
            RadDatePicker3.Enabled = False

            Button2.Visible = False
            Button3.Visible = True
        ElseIf HiddenField1.Value = 0 Then

            Button5.Visible = True

            For i As Integer = 0 To GridView2.Items.Count - 1
                Dim bttn As Button = CType(GridView2.Items.Item(i).FindControl("ImageButton1"), Button)
                bttn.Visible = True
            Next

            DropDownList7.Enabled = False
            DropDownList4.Enabled = False
            TextBox5.Enabled = False
            DropDownList8.Enabled = False
            FileUpload2.Enabled = False
            CheckBox1.Enabled = False
            CheckBox2.Enabled = False

            TextBox4.Enabled = False
            TextBox9.Enabled = True
            DropDownList10.Enabled = True
            DropDownList12.Enabled = True
            RadDatePicker3.Enabled = True

            Button2.Visible = False
            Button3.Visible = True
        Else
            Button5.Visible = True

            For i As Integer = 0 To GridView2.Items.Count - 1
                Dim bttn As Button = CType(GridView2.Items.Item(i).FindControl("ImageButton1"), Button)
                bttn.Visible = True
            Next

            DropDownList7.Enabled = True
            DropDownList4.Enabled = True
            DropDownList8.Enabled = True
            FileUpload2.Enabled = True
            CheckBox1.Enabled = True
            TextBox4.Enabled = True
            TextBox9.Enabled = True
            DropDownList10.Enabled = True
            DropDownList12.Enabled = True
            RadDatePicker3.Enabled = True

            Button2.Visible = True
            Button3.Visible = True
        End If


        'DropDownList5_DataBound(DropDownList5, New System.EventArgs())

        DropDownList11_DataBound(DropDownList11, New System.EventArgs())

        GridView3.DataBind()


        Label75.Text = DropDownList6.SelectedItem.ToString
        Label76.Text = DropDownList4.SelectedItem.ToString
        Label77.Text = DropDownList8.SelectedItem.ToString
        Label78.Text = DropDownList7.SelectedItem.ToString

        If DropDownList6.SelectedValue = 7 Or DropDownList6.SelectedValue = 8 Then
            Label79.Text = "ماهر فؤاد شحاته فرج لتجارة الادوات الصحية"
            Label20.Text = "10 ش الظاهر - الفجالة, القاهرة"
            Label21.Text = "س.ت./ 14328"
            Label24.Text = "ت: 27868761"
            Label25.Text = "م.ض./ 5/292/11/161"
            Label28.Text = "محمول: 01029552085 / 01226766587"
            Label30.Text = "ض.م./ 498-519-244"
            Tax_invoice_labs.Visible = True
            Label31.Visible = True
            RadioButton1.Visible = True
            RadioButton2.Visible = True
        Else
            Label79.Text = "أبوسيفين و تماف إيرينى للأدوات الصحية"
            Tax_invoice_labs.Visible = False
            Label31.Visible = False
            RadioButton1.Visible = False
            RadioButton2.Visible = False
        End If

        Gridview3_DataBound(GridView3, New System.EventArgs())

    End Sub

    Protected Sub GridView4_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView4.DataBound

        Dim i As Integer = 0

        Dim lblparent As Button = CType(GridView4.Rows(i).FindControl("lnkDownload0"), Button)

        If lblparent.CommandArgument = "" Then
            GridView4.Visible = False

            CheckBox1.Visible = True
            CheckBox1.Checked = True
            FileUpload2.Visible = True
        Else
            GridView4.Visible = True
            CheckBox1.Visible = False
            CheckBox1.Checked = False
            FileUpload2.Visible = False
        End If
    End Sub

    Protected Sub CheckBox2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            TextBox5.Enabled = True
            TextBox5.Text = ""
        Else
            TextBox5.Enabled = False
            TextBox5.Text = ""
        End If
    End Sub
    'Protected Sub DropDownList5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.DataBound

    '    For i As Integer = 0 To DropDownList5.Items.Count - 1

    '        If DropDownList5.Items.Item(i).Value = 0 Then
    '            DropDownList5.Items.Item(i).Attributes.Add("style", "color:Red")
    '        Else
    '            DropDownList5.Items.Item(i).Attributes.Add("style", "color:green")
    '        End If

    '    Next
    'End Sub

    Protected Sub item_select(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim HiddenField6 As HiddenField = CType(Repeateritem.Items.Item(item.ItemIndex).FindControl("HiddenField6"), HiddenField)
        Dim Label1_rep As Label = CType(Repeateritem.Items.Item(item.ItemIndex).FindControl("label1"), Label)

        If HiddenField6.Value = 0 Then
            Response.Redirect("Item_INS.aspx?id=" + Request.QueryString("id") + "&go=" + Request.QueryString("go") + "")
        Else
            HiddenField7.Value = HiddenField6.Value
            Label35.Text = Label1_rep.Text
        End If

        add_item_main.Style.Add("display", "none")
        add_item.Style.Add("display", "block")
        header_print.Style.Add("display", "none")
        invoice_update.Style.Add("display", "none")
        ledger_Transfers.Style.Add("display", "none")
        img.Style.Add("display", "none")

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click

        If DropDownList7.SelectedValue = 0 And DropDownList7.Enabled = True Then
            Label2.Text = "إختر إسم العميل"
            Label2.Visible = True
        ElseIf Not IsNumeric(TextBox4.Text) And TextBox4.Enabled = True Then
            Label2.Text = "برجاء إدخال قيمة الخصم الخاص"
            Label2.Visible = True
        ElseIf DropDownList4.SelectedValue = 0 And DropDownList4.Enabled = True Then
            Label2.Text = "إختر حالة الفاتورة"
            Label2.Visible = True
        ElseIf Not IsNumeric(TextBox5.Text) And CheckBox2.Checked = True And TextBox5.Enabled = True Then
            Label2.Text = "أرقام فقط فى م. فاتورة ذات الصلة"
            Label2.Visible = True
        ElseIf (DropDownList6.SelectedValue = 4 Or DropDownList6.SelectedValue = 6 Or DropDownList6.SelectedValue = 8) And TextBox5.Text = "" Then
            Label2.Text = "يجب ربط فواتير " + DropDownList6.SelectedItem.Text + " بفواتيرها الاصلية "
            Label2.Visible = True
        ElseIf DropDownList8.SelectedValue = 0 And DropDownList8.Enabled = True Then
            Label2.Text = "إختر طريقة الدفع"
            Label2.Visible = True
        ElseIf TextBox6.Text = "" And TextBox6.Enabled = True Then
            Label2.Text = "برجاء إدخال الملاحظات"
            Label2.Visible = True
        ElseIf FileUpload2.FileName = "" And CheckBox1.Checked = True And CheckBox1.Enabled = True Then
            Label2.Text = "برجاء رفع صورة ضوئية للفاتورة"
            Label2.Visible = True
        Else

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Related_Invoice_Serial_VAL]"
            cmd.Connection = mysqlcon

            Dim rm0 As New SqlParameter("@validate", SqlDbType.Int, 4)
            rm0.Direction = ParameterDirection.Output

            Dim rm1 As New SqlParameter("@Invoice_TypeCode", SqlDbType.Int, 4)
            rm1.Value = DropDownList6.SelectedValue

            Dim rm2 As New SqlParameter("@Related_Invoice_Serial", SqlDbType.Int, 4)
            If TextBox5.Text = "" Then
                rm2.Value = DBNull.Value
            Else
                rm2.Value = TextBox5.Text
            End If

            Dim rm3 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            rm3.Direction = ParameterDirection.Output

            cmd.Parameters.Add(rm0)
            cmd.Parameters.Add(rm1)
            cmd.Parameters.Add(rm2)
            cmd.Parameters.Add(rm3)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()

            If rm0.Value = 9 Then
                Label2.Text = "لا يمكن الربط بمسلسل هذه الفاتورة"
                Label2.Visible = True
            Else

                mysqlcon.Close()
                cmd.Parameters.Clear()
                Label2.Text = ""
                Label2.Visible = False

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "[dbo].[Invoice_Invoice_UPD]"
                cmd.Connection = mysqlcon

                Dim parm0 As New SqlParameter("@Invoice_Serial", SqlDbType.Int, 4)
                parm0.Value = Label4.Text

                Dim parm1 As New SqlParameter("@Invoice_StatusCode", SqlDbType.Int, 4)
                parm1.Value = DropDownList4.SelectedValue

                Dim parm2 As New SqlParameter("@Invoice_Date", SqlDbType.Date)
                parm2.Value = Convert.ToDateTime(Label74.Text)

                Dim parm3 As New SqlParameter("@PaymentMethod_Code", SqlDbType.Int, 4)
                parm3.Value = DropDownList8.SelectedValue

                Dim parm4 As New SqlParameter("@Related_Invoice_Serial", SqlDbType.Int, 4)
                If TextBox5.Text = "" Then
                    parm4.Value = DBNull.Value
                Else
                    parm4.Value = TextBox5.Text
                End If

                Dim parm5 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
                parm5.Value = DropDownList7.SelectedValue

                Dim parm6 As New SqlParameter("@Invoice_FilePath", SqlDbType.NVarChar, -1)
                If FileUpload2.FileName = "" And CheckBox1.Checked = False Then
                    parm6.Value = DBNull.Value
                ElseIf CheckBox1.Checked = False Then
                    parm6.Value = DBNull.Value

                Else
                    savePath = "D:\AbosefenApp\Invoices\" + DropDownList6.SelectedValue + "\" + parm0.Value
                    ext = Path.GetExtension(Path.GetFileName(FileUpload2.PostedFile.FileName.ToString))
                    fileupload_all(FileUpload2.PostedFile.FileName.ToString, FileUpload2.PostedFile.InputStream)

                    FileUpload2.SaveAs(savePath)
                    parm6.Value = parm0.Value + ext

                End If

                Dim parm7 As New SqlParameter("@Invoice_SpecialDiscount", SqlDbType.Decimal)
                parm7.Value = TextBox4.Text
                parm7.Precision = 18
                parm7.Scale = 2

                Dim parm8 As New SqlParameter("@Invoice_Notes", SqlDbType.NVarChar, -1)
                parm8.Value = TextBox6.Text

                Dim parm9 As New SqlParameter("@Invoice_Tax_Discount_Flag", SqlDbType.Int, 4)
                If RadioButton1.Checked = True Then
                    parm9.Value = 1
                Else
                    parm9.Value = 9
                End If

                cmd.Parameters.Add(parm0)
                cmd.Parameters.Add(parm1)
                cmd.Parameters.Add(parm2)
                cmd.Parameters.Add(parm3)
                cmd.Parameters.Add(parm4)
                cmd.Parameters.Add(parm5)
                cmd.Parameters.Add(parm6)
                cmd.Parameters.Add(parm7)
                cmd.Parameters.Add(parm8)
                cmd.Parameters.Add(parm9)

                mysqlcon.Open()

                cmd.ExecuteNonQuery()

                mysqlcon.Close()

                GridView4.DataBind()
                'DropDownList5_DataBound(DropDownList5, New System.EventArgs())

                HiddenField4.Value = parm9.Value
                GridView3.DataBind()
                GridView5.DataBind()
                DropDownList4.Enabled = False
                DropDownList8.Enabled = False
                cmd.Parameters.Clear()
                sent_email_status = 9

            End If
        End If
    End Sub

    Protected Sub DropDownList9_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.SelectedIndexChanged

        If DropDownList9.SelectedValue = 0 Then
            TextBox8.Enabled = False
            TextBox8.Text = ""
        ElseIf DropDownList9.SelectedValue = 1 Then
            TextBox8.Enabled = False
            TextBox8.Text = "1"
        ElseIf DropDownList9.SelectedValue > 1 Then
            TextBox8.Enabled = True
            TextBox8.Text = ""
        End If
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click

        Dim dropdesc As String = DropDownList11.SelectedItem.Text

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

        If DropDownList4.SelectedValue = 0 And HiddenField1.Value <> 0 And DropDownList6.SelectedValue <> 11 And DropDownList6.SelectedValue <> 12 Then
            Label5.Text = "إختر حالة الفاتورة من بيانات رئيسية"
            Label5.Visible = True

        ElseIf DropDownList8.SelectedValue = 0 And HiddenField1.Value <> 0 And DropDownList6.SelectedValue <> 11 And DropDownList6.SelectedValue <> 12 Then
            Label5.Text = "إختر طريقة الدفع من بيانات رئيسية"
            Label5.Visible = True

        ElseIf Not IsNumeric(TextBox4.Text) And HiddenField1.Value <> 0 And DropDownList6.SelectedValue <> 11 And DropDownList6.SelectedValue <> 12 Then
            Label5.Text = "إختر قيمة الخصم الخاص من بيانات رئيسية"
            Label5.Visible = True

        ElseIf TextBox6.Text = "" And HiddenField1.Value <> 0 And DropDownList6.SelectedValue <> 11 And DropDownList6.SelectedValue <> 12 Then
            Label5.Text = "إدخل ملاحظات الفاتورة من بيانات رئيسية"

        ElseIf HiddenField7.Value = 0 Then
            Label5.Text = "إختر الصنف أولا"
            Label5.Visible = True
        ElseIf Not IsNumeric(TextBox7.Text) Then
            Label5.Text = "إدخل الكمية المطلوبة"
            Label5.Visible = True
            'ElseIf DropDownList9.SelectedValue = 0 Then
            '    Label5.Text = "إختر وحدة القياس"
            '    Label5.Visible = True
        ElseIf Not IsNumeric(TextBox7.Text) Then
            Label5.Text = "إدخل الكمية المطلوبة"
            Label5.Visible = True
            'ElseIf Not IsNumeric(TextBox8.Text) Then
            '    Label5.Text = "إدخل العدد بالوحدة"
            '    Label5.Visible = True
        ElseIf Not IsNumeric(TextBox9.Text) And TextBox9.Enabled = True Then
            Label5.Text = "إدخل سعر القطعة"
            Label5.Visible = True
        ElseIf DropDownList10.SelectedValue = -1 And DropDownList10.Enabled = True Then
            Label5.Text = "برجاء تحديد نسبة الخصم"
            Label5.Visible = True
        ElseIf DropDownList11.SelectedValue = 0 Then
            Label5.Text = "برجاء تحديد المخزن"
            Label5.Visible = True
        ElseIf Convert.ToInt32(TextBox7.Text) > Convert.ToInt32(finalnumber) And HiddenField1.Value = 9 Then
            Label5.Text = "لا يوجد الكمية المطلوبة فى هذا المخزن"
            Label5.Visible = True
            'ElseIf (TextBox7.Text * TextBox8.Text) > finalnumber And HiddenField1.Value = 9 Then
            '    Label5.Text = "لا يوجد الكمية المطلوبة فى هذا المخزن"
            '    Label5.Visible = True
        ElseIf DropDownList12.SelectedValue = 0 And DropDownList12.Enabled = True Then
            Label5.Text = "برجاء إدخال حالة التسليم"
            Label5.Visible = True
        ElseIf RadDatePicker3.SelectedDate Is Nothing And RadDatePicker3.Enabled = True Then
            Label5.Text = "إختر تاريخ الإستلام"
            Label5.Visible = True
        ElseIf RadDatePicker3.SelectedDate > Date.Now And RadDatePicker3.Enabled = True Then
            Label5.Text = "تاريخ الإستلام غير مناسب"
            Label5.Visible = True
        ElseIf finalnumber = 0 And HiddenField1.Value = 9 Then
            Label5.Text = "لا يوجد رصيد كافى للبيع او للمرتجعات"
            Label5.Visible = True
        Else
            Label5.Text = ""
            Label5.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Invoice_InvoiceDetail_INS]"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@Invoice_Serial", SqlDbType.Int, 4)
            parm0.Value = Request.QueryString("id")

            Dim parm1 As New SqlParameter("@Item_Serial", SqlDbType.Int, 4)
            parm1.Value = HiddenField7.Value

            Dim parm2 As New SqlParameter("@MeasureUnit_Code", SqlDbType.Int, 4)
            parm2.Value = DropDownList9.SelectedValue

            Dim parm3 As New SqlParameter("@ItemUnit_Pieces", SqlDbType.Int, 4)
            parm3.Value = TextBox8.Text

            Dim parm4 As New SqlParameter("@Item_Amount", SqlDbType.Int, 4)
            parm4.Value = TextBox7.Text

            Dim parm5 As New SqlParameter("@InvoiceItem_Price", SqlDbType.Decimal)
            parm5.Value = TextBox9.Text
            parm5.Precision = 18
            parm5.Scale = 2

            Dim parm6 As New SqlParameter("@InvoiceItem_PriceDiscountRate", SqlDbType.Decimal)
            parm6.Value = DropDownList10.SelectedValue

            Dim parm7 As New SqlParameter("@DeliveryStatus_Code", SqlDbType.Int, 4)
            parm7.Value = DropDownList12.SelectedValue

            Dim parm8 As New SqlParameter("@Item_DeliveryDate", SqlDbType.Date)
            parm8.Value = RadDatePicker3.SelectedDate

            Dim parm9 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            parm9.Value = Session("OPR_NUMBER")

            Dim parm10 As New SqlParameter("@Store_Serial", SqlDbType.Int, 4)
            parm10.Value = DropDownList11.SelectedValue

            cmd.Parameters.Add(parm0)
            cmd.Parameters.Add(parm1)
            cmd.Parameters.Add(parm2)
            cmd.Parameters.Add(parm3)
            cmd.Parameters.Add(parm4)
            cmd.Parameters.Add(parm5)
            cmd.Parameters.Add(parm6)
            cmd.Parameters.Add(parm7)
            cmd.Parameters.Add(parm8)
            cmd.Parameters.Add(parm9)
            cmd.Parameters.Add(parm10)

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()


            txtSearch0.Text = ""

            HiddenField7.Value = 0
            TextBox7.Text = ""
            'الجزء الخاص بحقول وحدة قياس الصنف و العدد بالوحدة (مغلق) مؤقتا 
            DropDownList9.SelectedValue = 1
            TextBox8.Text = "1"

            'DropDownList9.SelectedValue = 0
            'TextBox8.Text = ""
            '----------------------------------------------------------------------
            TextBox8.Enabled = False
            TextBox9.Text = ""
            DropDownList10.SelectedIndex = -1
            DropDownList11.SelectedValue = 0
            DropDownList12.SelectedValue = 0
            RadDatePicker3.SelectedDate = Date.Now
            GridView2.DataBind()
            cmd.Parameters.Clear()
            sent_email_status = 9

            add_item_main.Style.Add("display", "block")
            add_item.Style.Add("display", "none")
            header_print.Style.Add("display", "none")
            invoice_update.Style.Add("display", "none")
            ledger_Transfers.Style.Add("display", "none")
            img.Style.Add("display", "none")

        End If
        GridView3.DataBind()
        GridView5.DataBind()
        DropDownList11_DataBound(DropDownList11, New System.EventArgs())

    End Sub

    Protected Sub Gridview3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.DataBound

        Dim i2 As Integer = 1

        For i As Integer = 0 To GridView3.Rows.Count - 1

            If i = GridView3.Rows.Count - 1 Then

                'GridView3.Rows(i).Cells(1).Visible = False
                GridView3.Rows(i).Cells(0).Attributes.Add("colspan", "2")

                If GridView3.Rows(i).Cells(0).Text = "&nbsp;" And HiddenField2.Value = 0 Then
                    Button7.Visible = False
                    GridView3.Rows(i).Cells(0).Visible = False
                ElseIf GridView3.Rows(i).Cells(0).Text <> "&nbsp;" And HiddenField2.Value = 0 Then
                    Button7.Visible = False
                    GridView3.Rows(i).Cells(0).Visible = True
                ElseIf GridView3.Rows(i).Cells(0).Text <> "&nbsp;" And HiddenField2.Value <> 0 Then
                    Button7.Visible = True
                    GridView3.Rows(i).Cells(0).Visible = True
                    'Label82.Text = GridView3.Rows(i - 1).Cells(1).Text
                ElseIf GridView3.Rows(i).Cells(0).Text = "&nbsp;" And HiddenField2.Value <> 0 Then
                    Button7.Visible = False
                    GridView3.Rows(i).Cells(0).Visible = False
                End If
            End If

            If i < GridView3.Rows.Count - 1 Then
                If GridView3.Rows(i).Cells(1).Text = GridView3.Rows(i2).Cells(1).Text Then
                    GridView3.Rows(i2).Visible = False
                End If
            End If
            i2 = i2 + 1


        Next

    End Sub

    Protected Sub delete_item(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim identity_lbl As Label = CType(GridView2.Items.Item(item.ItemIndex).FindControl("Label22"), Label)

        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "InvoiceDetail_InventoryTransactions_Delete"
        cmd.Connection = mysqlcon

        Dim parm0 As New SqlParameter("@InvoiceDetail_Serial", SqlDbType.Int, 4)
        parm0.Value = identity_lbl.Text

        cmd.Parameters.Add(parm0)

        mysqlcon.Open()
        cmd.ExecuteNonQuery()
        mysqlcon.Close()

        GridView2.DataBind()
        GridView3.DataBind()
        GridView5.DataBind()
        DropDownList11.DataBind()
        DropDownList11_DataBound(DropDownList11, New System.EventArgs())

    End Sub

    Protected Sub DropDownList11_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList11.DataBound

        For i As Integer = 0 To DropDownList11.Items.Count - 1

            Dim dropdesc As String = DropDownList11.Items.Item(i).Text

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
                DropDownList11.Items.Item(i).Attributes.Add("style", "color:Red")

            ElseIf finalnumber = 0 Then
                DropDownList11.Items.Item(i).Attributes.Add("style", "color:black")

            Else
                DropDownList11.Items.Item(i).Attributes.Add("style", "color:green")
            End If

        Next
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        invoice_update.Style.Add("display", "block")
        add_item_main.Style.Add("display", "none")
        add_item.Style.Add("display", "none")
        ledger_Transfers.Style.Add("display", "none")
        header_print.Style.Add("display", "none")
        img.Style.Add("display", "none")

    End Sub
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        add_item_main.Style.Add("display", "block")
        add_item.Style.Add("display", "none")
        header_print.Style.Add("display", "none")
        invoice_update.Style.Add("display", "none")
        ledger_Transfers.Style.Add("display", "none")
        img.Style.Add("display", "none")
    End Sub

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click

        ledger_Transfers.Style.Add("display", "block")
        invoice_update.Style.Add("display", "none")
        add_item_main.Style.Add("display", "none")
        add_item.Style.Add("display", "none")
        header_print.Style.Add("display", "none")
        img.Style.Add("display", "none")

    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        header_print.Style.Add("display", "block")
        ledger_Transfers.Style.Add("display", "none")
        invoice_update.Style.Add("display", "none")
        add_item_main.Style.Add("display", "none")
        add_item.Style.Add("display", "none")
        img.Style.Add("display", "none")

    End Sub
    Protected Sub DownloadFile(ByVal sender As Object, ByVal e As EventArgs)

        Dim filePath As String = CType(sender, Button).CommandArgument

        If filePath.Contains(".pdf") Then
            Image1.Visible = False
            Response.Redirect("Invoices\" + filePath)
        Else
            Image1.Visible = True
            Image1.ImageUrl = "Invoices\" + filePath
        End If

        img.Style.Add("display", "block")
        header_print.Style.Add("display", "none")
        ledger_Transfers.Style.Add("display", "none")
        invoice_update.Style.Add("display", "none")
        add_item_main.Style.Add("display", "none")
        add_item.Style.Add("display", "none")
    End Sub


    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click

        If Label82.Text = "0.00" Then
            Label11.Text = "تم تسديد مستحقات هذه الفاتورة بالكامل"
            Label11.Visible = True
            Button7.Visible = False
        ElseIf Not IsNumeric(TextBox10.Text) Then
            Label11.Text = "برجاء إدخال قيمة مناسبة"
            Label11.Visible = True
        ElseIf DropDownList13.SelectedValue = 0 Then
            Label11.Text = "برجاء إختيار وسيلة دفع المبلغ"
            Label11.Visible = True
        ElseIf DropDownList13.SelectedValue <> 1 And TextBox11.Text = "" Then
            Label11.Text = "برجاء إدخال رقم الحساب او كود المعاملة"
            Label11.Visible = True
        Else
            Label11.Text = ""
            Label11.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Invoice_Ledger_Transactions_INS]"
            cmd.Connection = mysqlcon

            cmd.Parameters.AddWithValue("@Invoice_Serial", Request.QueryString("id"))
            cmd.Parameters.AddWithValue("@Person_Code", DropDownList7.SelectedValue)
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

            If HiddenField2.Value = 1 Then
                cmd.Parameters.AddWithValue("@TransType_Code", 1)
            ElseIf HiddenField2.Value = 9 Then
                cmd.Parameters.AddWithValue("@TransType_Code", 2)
            End If

            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()

            GridView5.DataBind()
            DropDownList13.SelectedValue = 0
            TextBox11.Text = ""
            TextBox12.Text = ""
            If Label82.Text = "0.00" Then
                Label11.Text = ""
                Label11.Visible = False

            Else

            End If
            sent_email_status = 9
        End If

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

    Protected Sub Gridview5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView5.DataBound

        For i As Integer = 0 To GridView5.Rows.Count - 1

            If i = GridView5.Rows.Count - 1 And GridView5.Rows.Count > 1 Then
                GridView5.Visible = True
                GridView5.Rows(i - 1).Cells(1).Visible = False
                GridView5.Rows(i - 1).Cells(2).Visible = False
                GridView5.Rows(i - 1).Cells(0).Attributes.Add("colspan", "3")

                GridView5.Rows(i).Cells(1).Visible = False
                GridView5.Rows(i).Cells(2).Visible = False
                GridView5.Rows(i).Cells(0).Attributes.Add("colspan", "3")

                Dim lblparent1 As Label = CType(GridView5.Rows(i).FindControl("Label1"), Label)

                Label82.Text = lblparent1.Text
                TextBox10.Text = lblparent1.Text

                'For i3 As Integer = 0 To GridView2.Items.Count -1
                '    If HiddenField1.Value <> 0 Then
                '        Dim bttn As Button = CType(GridView2.Items.Item(i3).FindControl("ImageButton1"), Button)
                '        bttn.Visible = False
                '        Button3.Visible = False
                '        Button2.Visible = False
                '    Else

                '    End If

                'Next
            Else
                GridView5.Visible = False
            End If

        Next

    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click

        cmd.CommandType = CommandType.Text
        cmd.CommandText = "update [INVOICES].[Invoice] set Invoice_FilePath = NULL WHERE Invoice_Serial = " + Request.QueryString("id") + " "
        cmd.Connection = mysqlcon

        mysqlcon.Open()
        cmd.ExecuteNonQuery()
        mysqlcon.Close()

        GridView4.DataBind()
        cmd.Parameters.Clear()
        Image1.ImageUrl = ""
        img.Style.Add("display", "none")
        header_print.Style.Add("display", "block")

    End Sub

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click

        If sent_email_status = 9 Then

            Dim txtsub As String = "بيانات فاتورة رقم " + Label8.Text + " " + Label75.Text + " " + " بإسم " + DropDownList7.SelectedItem.Text + " بتاريخ " + Label29.Text

            Dim txtbd As String
            txtbd = "تفاصيل الفاتورة"
            For i As Integer = 0 To GridView2.Items.Count - 1
                Dim label_1 As Label = CType(GridView2.Items.Item(i).FindControl("label1"), Label)
                Dim label_27 As Label = CType(GridView2.Items.Item(i).FindControl("label27"), Label)
                Dim label_18 As Label = CType(GridView2.Items.Item(i).FindControl("label18"), Label)
                Dim label_19 As Label = CType(GridView2.Items.Item(i).FindControl("label19"), Label)
                Dim label_26 As Label = CType(GridView2.Items.Item(i).FindControl("label26"), Label)

                txtbd = txtbd & System.Environment.NewLine & System.Environment.NewLine & label_1.Text & System.Environment.NewLine & " عدد: " & label_27.Text & " سعر: " & label_18.Text & " خصم : " & label_19.Text & " إجمالى: " & label_26.Text

            Next
            txtbd = txtbd & System.Environment.NewLine & System.Environment.NewLine & "بإجمالى مبالغ"
            For i As Integer = 0 To GridView5.Rows.Count - 1
                Dim label_4 As Label = CType(GridView5.Rows(i).FindControl("label4"), Label)
                Dim label_2 As Label = CType(GridView5.Rows(i).FindControl("label2"), Label)
                Dim label_01 As Label = CType(GridView5.Rows(i).FindControl("label1"), Label)

                If label_2.Text <> "" Then
                    txtbd = txtbd & System.Environment.NewLine & System.Environment.NewLine & label_4.Text & " تاريخ: " & label_2.Text & " مبلغ: " & label_01.Text
                Else
                    txtbd = txtbd & System.Environment.NewLine & System.Environment.NewLine & label_4.Text & " : " & label_01.Text
                End If

            Next

            SendEmail("antoniousmaher@gmail.com", txtsub, txtbd)
            SendEmail("maher5551@hotmail.com", txtsub, txtbd)

            If TextBox13.Text <> "" And TextBox13.Text <> HiddenField5.Value.ToString Then

                cmd.CommandType = CommandType.Text
                cmd.CommandText = "update [PERSON].[PersonPhone] set PersonPhone_Status = 9 where Person_Code =" + DropDownList7.SelectedValue + " and PhoneType_Code = 5"
                cmd.Connection = mysqlcon

                mysqlcon.Open()
                cmd.ExecuteNonQuery()
                mysqlcon.Close()

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "[dbo].[PersonPhone_INS]"
                cmd.Connection = mysqlcon

                cmd.Parameters.AddWithValue("@Person_Code", DropDownList7.SelectedValue)
                cmd.Parameters.AddWithValue("@PersonPhone_number", TextBox13.Text)
                cmd.Parameters.AddWithValue("@PhoneType_Code", 5)

                mysqlcon.Open()
                cmd.ExecuteNonQuery()
                mysqlcon.Close()

                SendEmail(TextBox13.Text, txtsub, txtbd)
                TextBox13.Text = ""
            ElseIf TextBox13.Text = "" And HiddenField5.Value.ToString <> "" Then

                SendEmail(HiddenField5.Value, txtsub, txtbd)

            Else

            End If

            sent_email_status = 1

        End If

    End Sub

End Class
