Imports System.Data.SqlClient
Imports System.Data
Imports Telerik.Web.UI
Imports System.IO

Partial Class Item_INS
    Inherits Master_code

    Protected Sub details(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim lblparent10 As Label = CType(GridView1.Items.Item(item.ItemIndex).FindControl("Label1"), Label)

        Response.Redirect("Items_IMG.aspx?id=" + lblparent10.Text)

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click

        If DropDownList1.SelectedValue = 0 Then
            Label1.Text = "إختر بلد المنشأ"
            Label1.Visible = True
        ElseIf DropDownList2.SelectedValue = 0 Then
            Label1.Text = "إختر الشركة المصنعة"
            Label1.Visible = True
        ElseIf DropDownList3.SelectedValue = 0 Then
            Label1.Text = "إختر التصنيف"
            Label1.Visible = True
        ElseIf DropDownList4.SelectedValue = 0 Then
            Label1.Text = "إختر التصنيف الفرعى"
            Label1.Visible = True
        ElseIf DropDownList5.SelectedValue = 0 Then
            Label1.Text = "إختر الموديل"
            Label1.Visible = True
        ElseIf DropDownList6.SelectedValue = 0 Then
            Label1.Text = "إختر اللون"
            Label1.Visible = True
        ElseIf DropDownList7.SelectedValue = 0 Then
            Label1.Text = "إختر الخامة"
            Label1.Visible = True
        ElseIf DropDownList8.SelectedValue = 0 Then
            Label1.Text = "إختر المقاسات"
            Label1.Visible = True
        ElseIf TextBox2.Text = "" Then
            Label41.Text = DropDownList1.SelectedValue + DropDownList2.SelectedValue + DropDownList3.SelectedValue + DropDownList4.SelectedValue + DropDownList5.SelectedValue + DropDownList6.SelectedValue + DropDownList7.SelectedValue + DropDownList8.SelectedValue
            Label1.Text = "برجاء إدخال كود الصنف او الكود المقترح : " + Label41.Text.Substring(0, 8)
            Label1.Visible = True
        ElseIf TextBox2.Text.Length < 8 Then
            Label41.Text = DropDownList1.SelectedValue + DropDownList2.SelectedValue + DropDownList3.SelectedValue + DropDownList4.SelectedValue + DropDownList5.SelectedValue + DropDownList6.SelectedValue + DropDownList7.SelectedValue + DropDownList8.SelectedValue
            Label1.Text = "برجاء إدخال كود صنف مكون من 8 حروف و ارقام / كود مقترح : " + Label41.Text.Substring(0, 8)
            Label1.Visible = True
        ElseIf TextBox1.Text = "" Then
            Label1.Text = "يرجاء إدخال وصف الصنف"
            Label1.Visible = True
        Else
            Label1.Text = ""
            Label1.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Item_Item_INS]"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@Item_Desc", SqlDbType.NVarChar, -1)
            parm0.Value = TextBox1.Text

            Dim parm1 As New SqlParameter("@Item_code", SqlDbType.NVarChar, -1)
            parm1.Value = TextBox2.Text

            Dim parm2 As New SqlParameter("@Origin_Code", SqlDbType.Int, 4)
            parm2.Value = DropDownList1.SelectedValue

            Dim parm3 As New SqlParameter("@Company_Code", SqlDbType.Int, 4)
            parm3.Value = DropDownList2.SelectedValue

            Dim parm4 As New SqlParameter("@Category_Code", SqlDbType.Int, 4)
            parm4.Value = DropDownList3.SelectedValue

            Dim parm5 As New SqlParameter("@SubCategory_Code", SqlDbType.Int, 4)
            parm5.Value = DropDownList4.SelectedValue

            Dim parm6 As New SqlParameter("@Model_Code", SqlDbType.Int, 4)
            parm6.Value = DropDownList5.SelectedValue

            Dim parm7 As New SqlParameter("@Color_Code", SqlDbType.Int, 4)
            parm7.Value = DropDownList6.SelectedValue

            Dim parm8 As New SqlParameter("@Material_Code", SqlDbType.Int, 4)
            parm8.Value = DropDownList7.SelectedValue

            Dim parm9 As New SqlParameter("@Size_Code", SqlDbType.Int, 4)
            parm9.Value = DropDownList8.SelectedValue

            Dim parm10 As New SqlParameter("@dublicate_validate", SqlDbType.NVarChar, -1)
            parm10.Direction = ParameterDirection.Output

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
            Label1.Visible = True
            Label1.Text = parm10.Value
            mysqlcon.Close()
            GridView1.DataBind()
            cmd.Parameters.Clear()
        End If
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Response.Redirect("Invoice_Detail_INS.aspx?id=" + Request.QueryString("id") + "&go=" + Request.QueryString("go") + "")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("go") Is Nothing Then
            Button6.Visible = False
        Else
            Button6.Visible = True
        End If

        If Not IsPostBack Then

            Label41.Visible = False
            DropDownList1.DataBind()
            DropDownList2.DataBind()
            DropDownList3.DataBind()
            DropDownList4.DataBind()
            DropDownList5.DataBind()
            DropDownList6.DataBind()
            DropDownList7.DataBind()
            DropDownList8.DataBind()
            'DropDownList1.SelectedValue = 5
            'DropDownList2.SelectedValue = 3
            'DropDownList3.SelectedValue = 13
            'DropDownList1.Enabled = False
            'DropDownList2.Enabled = False
            'DropDownList3.Enabled = False

        End If

    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click

        If HiddenField1.Value Is Nothing Then
            Label1.Text = "برجاء إختيار الصنف أولا لإضافة الصور الخاصة به"
            Label1.Visible = True
        Else
            Label1.Visible = False
            Label1.Text = ""

            Dim Loop1 As Integer
            Dim TempFileName As String
            Dim ShouldOverwrite As Boolean = True
            Dim MyFileCollection As UploadedFileCollection = RadUpload1.UploadedFiles

            For Loop1 = 0 To MyFileCollection.Count - 1

                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "[dbo].[ItemPhoto_INS]"
                cmd.Connection = mysqlcon

                Dim parm0 As New SqlParameter("@Item_Serial", SqlDbType.Int, 4)
                parm0.Value = HiddenField1.Value

                Dim parm1 As New SqlParameter("@DataPath", SqlDbType.NVarChar, 500)
                parm1.Direction = ParameterDirection.Output

                Dim parm2 As New SqlParameter("@ext_file", SqlDbType.NVarChar, -1)
                parm2.Value = MyFileCollection(Loop1).GetExtension

                Dim parm3 As New SqlParameter("@identity_img", SqlDbType.Int, 4)
                parm3.Direction = ParameterDirection.Output

                cmd.Parameters.Add(parm0)
                cmd.Parameters.Add(parm1)
                cmd.Parameters.Add(parm2)
                cmd.Parameters.Add(parm3)

                mysqlcon.Open()
                cmd.ExecuteNonQuery()

                ' Create a new file name.
                TempFileName = parm1.Value.ToString + parm3.Value.ToString + MyFileCollection(Loop1).GetExtension
                ' Save the file.
                MyFileCollection(Loop1).SaveAs(TempFileName, ShouldOverwrite)
                mysqlcon.Close()
                cmd.Parameters.Clear()

            Next
            Button7.Visible = False
            RadUpload1.Visible = False
        End If
    End Sub

    Protected Sub photo_upload(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim lblparent10 As Label = CType(GridView1.Items.Item(item.ItemIndex).FindControl("Label1"), Label)

        HiddenField1.Value = lblparent10.Text

        RadUpload1.Visible = True
        Button7.Visible = True

    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.ItemDataBound

        For i2 As Integer = 0 To GridView1.Items.Count - 1
            Dim lblparent101 As Label = CType(GridView1.Items.Item(i2).FindControl("Label6"), Label)
            Dim linkparent101 As Button = CType(GridView1.Items.Item(i2).FindControl("Button2"), Button)

            If lblparent101.Text = "0" Then
                linkparent101.Visible = False

            Else
                linkparent101.Visible = True

            End If

        Next

    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click

        If DropDownList9.SelectedValue = 0 Or textbox5.Text = "" Then

        Else
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "Items_Tree_Ins"
            cmd.Connection = mysqlcon
            cmd.Parameters.AddWithValue("@filter", DropDownList9.SelectedValue)
            cmd.Parameters.AddWithValue("@Desc", textbox5.Text)
            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()

            If DropDownList9.SelectedValue = 1 Then
                DropDownList1.DataBind()
            ElseIf DropDownList9.SelectedValue = 2 Then
                DropDownList2.DataBind()
            ElseIf DropDownList9.SelectedValue = 3 Then
                DropDownList3.DataBind()
            ElseIf DropDownList9.SelectedValue = 4 Then
                DropDownList5.DataBind()
            ElseIf DropDownList9.SelectedValue = 5 Then
                DropDownList4.DataBind()
            ElseIf DropDownList9.SelectedValue = 6 Then
                DropDownList6.DataBind()
            ElseIf DropDownList9.SelectedValue = 7 Then
                DropDownList7.DataBind()
            End If

            DropDownList9.SelectedValue = 0
            textbox5.Text = ""
        End If

        'document.getElementById("layer1").style.visibility = "visible"

    End Sub

End Class
