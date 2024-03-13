Imports System.Data.SqlClient
Imports System.Data

Partial Class Person_INS
       Inherits Master_code

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click

        If DropDownList1.SelectedValue = 0 Then
            Label1.Text = "إختر طبيعة العميل أولا"
            Label1.Visible = True
        ElseIf DropDownList2.SelectedValue = 0 Then
            Label1.Text = "إختر نوع العميل أولا"
            Label1.Visible = True
        ElseIf TextBox2.Text = "" Then
            Label1.Text = "برجاء إدخال إسم العميل"
            Label1.Visible = True
        ElseIf TextBox3.Text = "" Then
            Label1.Text = "برجاء إدخال ملاحظات عن العميل"
            Label1.Visible = True
        ElseIf TextBox4.Text = "" Then
            Label1.Text = "برجاء إدخال عنوان العميل"
            Label1.Visible = True
        Else
            Label1.Text = ""
            Label1.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[Person_INS]"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@PersonType_code", SqlDbType.Int, 4)
            parm0.Value = DropDownList1.SelectedValue

            Dim parm1 As New SqlParameter("@PersonGender_Code", SqlDbType.Int, 4)
            parm1.Value = DropDownList2.SelectedValue

             Dim parm2 As New SqlParameter("@Person_Name", SqlDbType.NVarChar, -1)
            parm2.Value = TextBox2.Text

            Dim parm3 As New SqlParameter("@Person_Detail", SqlDbType.NVarChar, -1)
            parm3.Value = TextBox3.Text

            Dim parm4 As New SqlParameter("@Person_Address", SqlDbType.NVarChar, -1)
            parm4.Value = TextBox4.Text

           
            cmd.Parameters.Add(parm0)
            cmd.Parameters.Add(parm1)
            cmd.Parameters.Add(parm2)
            cmd.Parameters.Add(parm3)
            cmd.Parameters.Add(parm4)
         
            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()

            DropDownList1.SelectedValue = 0
            DropDownList2.SelectedValue = 0

            TextBox2.Text = ""
            TextBox3.Text = ""
            TextBox4.Text = ""
            GridView1.DataBind()
            GridView1.SelectedIndex = -1
            cmd.Parameters.Clear()

        End If
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click

        If DropDownList3.SelectedValue = 0 Then
            Label1.Text = "برجاء إختيار نوع التليفون"
            Label1.Visible = True
        ElseIf TextBox5.Text = "" Then
            Label1.Text = "برجاء تسجيل تليفون للعميل"
            Label1.Visible = True
        Else
            Label1.Text = ""
            Label1.Visible = False

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[dbo].[PersonPhone_INS]"
            cmd.Connection = mysqlcon

            Dim parm0 As New SqlParameter("@Person_Code", SqlDbType.Int, 4)
            parm0.Value = GridView1.SelectedDataKey.Value

            Dim parm1 As New SqlParameter("@PersonPhone_number", SqlDbType.NVarChar, -1)
            parm1.Value = TextBox5.Text

            Dim parm2 As New SqlParameter("@PhoneType_Code", SqlDbType.Int, 4)
            parm2.Value = DropDownList3.SelectedValue

            cmd.Parameters.Add(parm0)
            cmd.Parameters.Add(parm1)
            cmd.Parameters.Add(parm2)
            
            mysqlcon.Open()
            cmd.ExecuteNonQuery()
            mysqlcon.Close()

            DropDownList3.SelectedValue = 0
            TextBox5.Text = ""
            Panel1.Visible = False
            GridView1.DataBind()
            GridView1.SelectedIndex = -1
            cmd.Parameters.Clear()

        End If
        GridView1.DataBind()
        GridView1.SelectedIndex = -1
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Panel1.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        GridView1.DataBind()
        
    End Sub
End Class
