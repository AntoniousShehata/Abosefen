Imports System.Data.SqlClient

Partial Class LogIn
     Inherits Master_code

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack Then
            ''-------------------------------------------Start Reader------------------------------------------------''

            cmd1.CommandText = "SELECT STATUS,PASSWORD,NUMBER FROM HR.OPERATOR WHERE NAME = N'" + TextBox1.Text + "'"
            cmd1.Connection = mysqlcon1

            mysqlcon1.Open()
            Dim rdr As SqlDataReader = cmd1.ExecuteReader()
            'User does not exist
            If (rdr.Read() = False) Then
                Label1.Text = ("إسم مستخدم خطأ")
                'User exists, validate password
            Else
                Dim strDBPassword As String = rdr.GetString(rdr.GetOrdinal("PASSWORD"))
                If (strDBPassword = TextBox2.Text) Then
                    Dim iStatus As Integer = rdr.GetInt32(rdr.GetOrdinal("STATUS"))
                    If (iStatus = 1) Then
                        Dim OPREATORNUMBER As Integer = rdr.GetInt32(rdr.GetOrdinal("NUMBER"))
                        Session("OPR_NUMBER") = OPREATORNUMBER
                        Session("USERNAME") = TextBox1.Text
                        Session("PASS") = strDBPassword
                        ''-------------------------------------------Start Action------------------------------------------------''
                        Button2.Visible = True
                        Label2.Visible = True
                        Label2.Text = ("إسم المستخدم ... " + Session("NAME"))

                        '-----------------------------------'
                        Response.Redirect("Admin_main.aspx")
                        ''-------------------------------------------End Action------------------------------------------------''
                    Else
                        Label1.Visible = True
                        Label1.Text = ("تم إيقاف المستخدم مؤقتا")
                    End If
                Else
                    Label1.Visible = True
                    Label1.Text = ("كلمة مرور خطأ")
                End If
            End If

            rdr.Close()
            mysqlcon1.Close()
            ''-------------------------------------------End Reader------------------------------------------------''
        End If
        If Not IsPostBack Then
            If Session("USERNAME") = "" Then
                Application.Contents.RemoveAll()
                Session.Contents.RemoveAll()
                Session.Abandon()
                Button2.Visible = False
               
                Label4.Visible = False
            Else
                Button2.Visible = False
                Label4.Visible = False
                Label4.Text = ("UserName .. " + Session("NAME"))

            End If
        End If
        Session.Timeout = 10
    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
  
        Application.Contents.RemoveAll()
        Session.Contents.RemoveAll()
        Session.Abandon()
        Response.Redirect("Log In.aspx")
    End Sub

End Class
