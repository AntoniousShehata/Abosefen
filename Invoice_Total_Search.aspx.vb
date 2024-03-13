Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Collections.Generic

Partial Class Invoice_Total_Search
   Inherits Master_code

    Private PageSize As Integer = 1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearch.Visible = True
        Label1.Visible = False

        If Not IsPostBack Then

            DropDownList1.DataBind()
            DropDownList2.DataBind()
            DropDownList4.DataBind()
            DropDownList5.DataBind()
            DropDownList6.DataBind()
            DropDownList7.DataBind()

            Me.GetCustomersPageWise(1)
            Me.DataList1_DataBound(DataList1, New System.EventArgs())

            Button1.Text = "محركات البحث"
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
            img.Style.Add("display", "none")

            For i As Integer = 0 To DataList1.Items.Count - 1
                Dim linkparent10 As Button = CType(DataList1.Items.Item(i).FindControl("Button4"), Button)
                If Request.QueryString("url") = "1" Then
                    linkparent10.Visible = True
                ElseIf Request.QueryString("url") = "2" Then
                    linkparent10.Visible = False
                End If
            Next

        End If

    End Sub

    Protected Sub details(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim linkparent As Repeater = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Repeater2"), Repeater)
        Dim linkparent2 As GridView = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Gridview5"), GridView)
        Dim GridView3 As GridView = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Gridview3"), GridView)
        Dim HiddenField5 As HiddenField = CType(DataList1.Items.Item(item.ItemIndex).FindControl("HiddenField5"), HiddenField)

        Dim i2 As Integer = 1

        For i As Integer = 0 To GridView3.Rows.Count - 1

            If i = GridView3.Rows.Count - 1 Then

                'GridView3.Rows(i).Cells(1).Visible = False
                GridView3.Rows(i).Cells(0).Attributes.Add("colspan", "2")
                If GridView3.Rows(i).Cells(0).Text = "&nbsp;" And HiddenField5.Value = 0 Then
                    GridView3.Rows(i).Cells(0).Visible = False
                ElseIf GridView3.Rows(i).Cells(0).Text <> "&nbsp;" And HiddenField5.Value = 0 Then
                    GridView3.Rows(i).Cells(0).Visible = True
                ElseIf GridView3.Rows(i).Cells(0).Text <> "&nbsp;" And HiddenField5.Value <> 0 Then
                    GridView3.Rows(i).Cells(0).Visible = True
                    'Label82.Text = GridView3.Rows(i - 1).Cells(1).Text
                ElseIf GridView3.Rows(i).Cells(0).Text = "&nbsp;" And HiddenField5.Value <> 0 Then
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


        For i As Integer = 0 To linkparent2.Rows.Count - 1

            If i = linkparent2.Rows.Count - 1 And linkparent2.Rows.Count > 1 Then
                linkparent2.Visible = True
                linkparent2.Rows(i - 1).Cells(1).Visible = False
                linkparent2.Rows(i - 1).Cells(2).Visible = False
                linkparent2.Rows(i - 1).Cells(0).Attributes.Add("colspan", "3")

                linkparent2.Rows(i).Cells(1).Visible = False
                linkparent2.Rows(i).Cells(2).Visible = False
                linkparent2.Rows(i).Cells(0).Attributes.Add("colspan", "3")

                Dim lblparent1 As Label = CType(linkparent2.Rows(i).FindControl("Label1"), Label)


            Else
                linkparent2.Visible = False
            End If

        Next

        Dim bttn As Button = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Button5"), Button)

        If linkparent.Visible = False Then
            GridView3.Visible = True
            linkparent2.Visible = True
            linkparent.Visible = True
            bttn.Text = "X | تفاصيل الفاتورة"
        Else
            GridView3.Visible = False
            linkparent2.Visible = False
            linkparent.Visible = False
            bttn.Text = "V | تفاصيل الفاتورة"
        End If
        linkparent.DataBind()

    End Sub

    Protected Sub details_related(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim linkparent As Repeater = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Repeater1"), Repeater)

        Dim bttn As Button = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Button6"), Button)


        If linkparent.Visible = False Then

            linkparent.Visible = True
            bttn.Text = "X | فاتورة ذات صلة"
        Else
            linkparent.Visible = False
            bttn.Text = "V | فاتورة ذات صلة"
        End If
        linkparent.DataBind()

    End Sub

    Protected Sub OnRowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

        If (e.Row.RowType = DataControlRowType.DataRow) Then

            Dim ddlStatus As DropDownList = CType(e.Row.FindControl("DropDownList6"), DropDownList)
            ddlStatus.DataSource = GetData("SELECT [TransReviewStatus_Code] ,[TransReviewStatus_Desc] FROM [STORES].[TransReviewStatus]")
            ddlStatus.DataTextField = "TransReviewStatus_Desc"
            ddlStatus.DataValueField = "TransReviewStatus_Code"
            ddlStatus.DataBind()

            Dim ddlStatus_Desc As String = CType(e.Row.FindControl("Label61"), Label).Text
            ddlStatus.SelectedValue = ddlStatus_Desc


            If ddlStatus.SelectedValue = 1 Then
                ddlStatus.Enabled = False
            End If


        End If
    End Sub

    Private Sub GetCustomersPageWise(pageIndex As Integer)

        Using cmd As New SqlCommand("Invoice_Invoice_SEARCH_Inventory_Permission", mysqlcon)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = mysqlcon

            cmd.Parameters.AddWithValue("@Invoice_Serial", TextBox4.Text)
            cmd.Parameters.AddWithValue("@Invoice_TypeCode", DropDownList1.SelectedValue)
            cmd.Parameters.AddWithValue("@Invoice_Number", TextBox5.Text)
            cmd.Parameters.AddWithValue("@Invoice_Date", RadDatePicker1.SelectedDate.ToString)
            cmd.Parameters.AddWithValue("@PaymentMethod_Code", DropDownList2.SelectedValue)
            cmd.Parameters.AddWithValue("@Related_Invoice_Serial", TextBox2.Text)
            cmd.Parameters.AddWithValue("@Person_Code", DropDownList5.SelectedValue)
            cmd.Parameters.AddWithValue("@Invoice_StatusCode", DropDownList4.SelectedValue)
            cmd.Parameters.AddWithValue("@Invoice_Notes", TextBox3.Text)
            cmd.Parameters.AddWithValue("@TransReviewStatus_Code", DropDownList7.SelectedValue)
            cmd.Parameters.AddWithValue("@Store_Serial", DropDownList6.SelectedValue)
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex)
            cmd.Parameters.AddWithValue("@PageSize", PageSize)
            cmd.Parameters.AddWithValue("@Item_Serial", DropDownList8.SelectedValue)
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4)
            cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
            mysqlcon.Open()
            Dim idr As IDataReader = cmd.ExecuteReader()
            DataList1.DataSource = idr
            DataList1.DataBind()
            idr.Close()
            mysqlcon.Close()
            Dim recordCount As Integer = Convert.ToInt32(cmd.Parameters("@RecordCount").Value)
            Me.PopulatePager(recordCount, pageIndex)
        End Using

        Me.DataList1_DataBound(DataList1, New System.EventArgs())
    End Sub

    Private Sub PopulatePager(ByVal recordCount As Integer, ByVal currentPage As Integer)

        Dim pages As New List(Of ListItem)()
        Dim startIndex As Integer, endIndex As Integer
        Dim pagerSpan As Integer = 5

        'Calculate the Start and End Index of pages to be displayed.
        Dim dblPageCount As Double = CDbl(CDec(recordCount) / Convert.ToDecimal(PageSize))
        Dim pageCount As Integer = CInt(Math.Ceiling(dblPageCount))
        startIndex = If(currentPage > 1 AndAlso currentPage + pagerSpan - 1 < pagerSpan, currentPage, 1)
        endIndex = If(pageCount > pagerSpan, pagerSpan, pageCount)
        If currentPage > pagerSpan Mod 2 Then
            If currentPage = 2 Then
                endIndex = 5
            Else
                endIndex = currentPage + 2
            End If
        Else
            endIndex = (pagerSpan - currentPage) + 1
        End If

        If endIndex - (pagerSpan - 1) > startIndex Then
            startIndex = endIndex - (pagerSpan - 1)
        End If

        If endIndex > pageCount Then
            endIndex = pageCount
            startIndex = If(((endIndex - pagerSpan) + 1) > 0, (endIndex - pagerSpan) + 1, 1)
        End If

        'Add the First Page Button.
        If currentPage > 1 Then
            pages.Add(New ListItem("الفاتورة الاولى", "1"))
        End If

        'Add the Previous Button.
        If currentPage > 1 Then
            pages.Add(New ListItem("<<", (currentPage - 5).ToString()))
        End If

        For i As Integer = startIndex To endIndex
            pages.Add(New ListItem(i.ToString(), i.ToString(), i <> currentPage))
        Next

        'Add the Next Button.
        If currentPage < pageCount Then
            pages.Add(New ListItem(">>", (currentPage + 5).ToString()))
        End If

        'Add the Last Button.
        If currentPage <> pageCount Then
            pages.Add(New ListItem("الفاتورة الاخيرة", pageCount.ToString()))
        End If
        rptPager.DataSource = pages
        rptPager.DataBind()
    End Sub

    Protected Sub Page_Changed(sender As Object, e As EventArgs)

        Dim pageIndex As Integer = Integer.Parse(TryCast(sender, LinkButton).CommandArgument)
        Me.GetCustomersPageWise(pageIndex)
        Me.DataList1_DataBound(DataList1, New System.EventArgs())

    End Sub

    Protected Sub Invoice(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim lblparent10 As Label = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Invoice_SerialLabel"), Label)

        Response.Redirect("Invoice_Detail_INS.aspx?id=" + lblparent10.Text + "&go=3")

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

        search_div.Style.Add("display", "block")
        rptPager_div.Style.Add("display", "none")
        Panel2.Style.Add("display", "none")
        header_print.Style.Add("display", "none")
        Button1.Text = "نتائج البحث"
        img.Style.Add("display", "block")

    End Sub

    Protected Sub DataList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.ItemDataBound

        For i2 As Integer = 0 To DataList1.Items.Count - 1
            Dim lblparent10 As Label = CType(DataList1.Items.Item(i2).FindControl("Label1"), Label)
            Dim linkparent10 As Button = CType(DataList1.Items.Item(i2).FindControl("Button1"), Button)
            Dim repeater1 As Repeater = CType(DataList1.Items.Item(i2).FindControl("repeater1"), Repeater)
            Dim repeater2 As Repeater = CType(DataList1.Items.Item(i2).FindControl("repeater2"), Repeater)

            repeater1.Visible = False
            repeater2.Visible = False

            If lblparent10.Text = "" Then
                linkparent10.Visible = False

            Else
                linkparent10.Visible = True

            End If

        Next

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Button1.Text = "محركات البحث" Then
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "none")
            Panel2.Style.Add("display", "block")
            header_print.Style.Add("display", "none")
            Button1.Text = "نتائج البحث"
            img.Style.Add("display", "none")
        Else
            Me.GetCustomersPageWise(1)
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
            header_print.Style.Add("display", "block")
            Button1.Text = "محركات البحث"
            img.Style.Add("display", "none")
        End If

    End Sub

End Class
