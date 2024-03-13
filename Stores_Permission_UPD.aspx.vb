Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Collections.Generic

Partial Class Stores_Permission_UPD

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

            Button1.Text = "محركات البحث"
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
        End If

    End Sub

    Protected Sub details(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)

        Dim linkparent As Repeater = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Repeater2"), Repeater)

        Dim bttn As Button = CType(DataList1.Items.Item(item.ItemIndex).FindControl("Button5"), Button)

        If linkparent.Visible = False Then

            linkparent.Visible = True
            bttn.Text = "X | تفاصيل الاذن"
        Else
            linkparent.Visible = False
            bttn.Text = "V | تفاصيل الاذن"
        End If
        linkparent.DataBind()

    End Sub

    Protected Sub OnRowDataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs)
        If (e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem) Then

            'Find the DropDownList in the Row
            Dim ddlStatus As DropDownList = CType(e.Item.FindControl("DropDownList6"), DropDownList)
            ddlStatus.DataSource = GetData("SELECT [TransReviewStatus_Code] ,[TransReviewStatus_Desc] FROM [STORES].[TransReviewStatus]")
            ddlStatus.DataTextField = "TransReviewStatus_Desc"
            ddlStatus.DataValueField = "TransReviewStatus_Code"
            ddlStatus.DataBind()

            Dim ddlStatus_Desc As String = CType(e.Item.FindControl("Label61"), Label).Text
            ddlStatus.SelectedValue = ddlStatus_Desc


            If ddlStatus.SelectedValue = 1 Then
                ddlStatus.Enabled = False
            End If
        End If
    End Sub

    Protected Sub details_Status(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim row As RepeaterItem = TryCast(TryCast(sender, Button).NamingContainer, RepeaterItem)
        Dim Drop As DropDownList = CType(row.FindControl("dropdownlist6"), DropDownList)
        Dim identity As Label = CType(row.FindControl("Label_identity"), Label)

        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "InventoryTransactions_Trans_code_UPD"
        cmd.Connection = mysqlcon

        cmd.Parameters.AddWithValue("@TransReviewStatus_Code", Drop.SelectedValue)
        cmd.Parameters.AddWithValue("@InventoryTrans_Code", identity.Text)

        mysqlcon.Open()
        cmd.ExecuteNonQuery()
        mysqlcon.Close()

        Drop.DataBind()
        If Drop.SelectedValue = 1 Then
            Drop.Enabled = False
        End If

        cmd.Parameters.Clear()
    End Sub

    Private Sub GetCustomersPageWise(ByVal pageIndex As Integer)
  
        Using cmd As New SqlCommand("Invoice_Invoice_SEARCH_Inventory_Permission", mysqlcon)
            cmd.CommandType = CommandType.StoredProcedure

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
            cmd.Parameters.AddWithValue("@Item_Serial", DropDownList8.SelectedValue)
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex)
            cmd.Parameters.AddWithValue("@PageSize", PageSize)
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
            pages.Add(New ListItem("الاذن الاول", "1"))
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
            pages.Add(New ListItem("الاذن الاخير", pageCount.ToString()))
        End If
        rptPager.DataSource = pages
        rptPager.DataBind()
    End Sub

    Protected Sub Page_Changed(ByVal sender As Object, ByVal e As EventArgs)
        Dim pageIndex As Integer = Integer.Parse(TryCast(sender, LinkButton).CommandArgument)
        Me.GetCustomersPageWise(pageIndex)
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Button1.Text = "محركات البحث" Then
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "none")
            Panel2.Style.Add("display", "block")
            header_print.Style.Add("display", "none")
            Button1.Text = "نتائج البحث"
        Else
            Me.GetCustomersPageWise(1)
            search_div.Style.Add("display", "block")
            rptPager_div.Style.Add("display", "block")
            Panel2.Style.Add("display", "none")
            header_print.Style.Add("display", "block")
            Button1.Text = "محركات البحث"
        End If

    End Sub

End Class
