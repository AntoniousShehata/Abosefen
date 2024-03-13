Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Partial Class Send_Email
    Inherits Master_code

    Protected Sub go_SendEmail(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        SendEmail(txtTo.Text, txtSubject.Text, txtBody.Text)
    End Sub

End Class
