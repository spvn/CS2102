Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class user

    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()
    'Dim passportData As New DataTable()
    Dim roomTable As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        If Page.IsPostBack = False Then
            'Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
            'Dim sqlconn As New MySqlConnection(connStr)
            'Dim copyPassports As String

            'copyPassports = "Select c_passport FROM Booking"

            'tempAdapter.SelectCommand = New MySqlCommand(copyPassports, sqlconn)
            'tempAdapter.Fill(passportData)

            'sqlconn.Close()
        Else
            Dim selectQuery As String = ViewState("selectQuery")
            If selectQuery <> "" Then
                SqlDataSource1.SelectCommand = selectQuery
            End If
        End If

    End Sub

    Protected Sub submitButton_Click() Handles submitButton.Click

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        sqlconn.Open()
        errorLabel.Visible = False

        'Dim found As Boolean = False
        'For Each drow As DataRow In passportData.Rows
        '    If passportInput.Text = drow(0).ToString() Then
        '        found = True
        '         Exit For
        '     End If
        'Next

        'If found = False Then
        '    errorLabel.Text = "Please enter existing passport number!"
        '    errorLabel.Visible = True
        '    Return
        'End If

        Dim selectstr As String
        selectstr = "SELECT * FROM Booking WHERE c_passport = @c_passport"

        Dim cmd As New MySqlCommand(selectstr, sqlconn)


        cmd.Parameters.AddWithValue("@c_passport", passportInput.Text)

        cmd.ExecuteNonQuery()
        sqlconn.Close()
        currBookings.DataBind()
        If currBookings.Rows.Count = 0 Then
            errorLabel.Text = "No current bookings found for this passport number"
            errorLabel.Visible = True
        End If


    End Sub
    Protected Sub currBookings_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs) Handles currBookings.RowUpdating
        Dim row = currBookings.Rows(e.RowIndex)

        Dim startDate = (CType((row.Cells(5).Controls(0)), TextBox)).Text
        Dim endDate = (CType((row.Cells(6).Controls(0)), TextBox)).Text
        Dim hotel = (CType((row.Cells(2).Controls(0)), TextBox)).Text
        Dim room = (CType((row.Cells(3).Controls(0)), TextBox)).Text
        Dim bookingid As String = row.Cells(1).Text

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)

        Dim checkDatesStr = "SELECT start_date, end_date FROM Booking WHERE hotel_ID = @hotel_ID and room = @room and booking_id <> @booking"

        Dim checkDateCmd As New MySqlCommand(checkDatesStr, sqlconn)
        sqlconn.Open()

        checkDateCmd.Parameters.AddWithValue("@hotel_ID", hotel)
        checkDateCmd.Parameters.AddWithValue("@room", room)
        checkDateCmd.Parameters.AddWithValue("@booking", bookingid)

        Dim dateCheckAdapter As New MySqlDataAdapter()
        dateCheckAdapter.SelectCommand = checkDateCmd

        Dim dateTable As New DataTable

        dateCheckAdapter.Fill(dateTable)

        For Each drow As DataRow In dateTable.Rows
            If (startDate >= CType(drow(0), Date) And startDate <= CType(drow(1), Date)) Or
                (endDate >= CType(drow(0), Date) And endDate <= CType(drow(1), Date)) Or
                (startDate <= CType(drow(0), Date) And endDate >= CType(drow(1), Date)) Then
                errorLabel.Text = "Room is not available for the time period specified!"
                errorLabel.Visible = True
                e.Cancel = True
                Return
            End If
        Next


        sqlconn.Close()
    End Sub



    Protected Sub Search_Click(sender As Object, e As EventArgs) Handles Search.Click
        'Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        'Dim sqlconn As New MySqlConnection(connStr)
        'sqlconn.Open()
        'Dim selectstr As String
        'selectstr = "SELECT * FROM Hotel WHERE (h_name LIKE '%" & hotelnametb.Text & "%') AND (country LIKE '%" & countrytb.Text & "%') AND (stars LIKE '%" & starstb.Text & "%')"

        'Dim cmd As New MySqlCommand(selectstr, sqlconn)

        'cmd.Parameters.AddWithValue("@h_name", hotelnametb.Text)
        'cmd.Parameters.AddWithValue("@country", countrytb.Text)
        'cmd.Parameters.AddWithValue("@stars", starstb.Text)

        'Dim searchAdapter As New MySqlDataAdapter()
        'searchAdapter.SelectCommand = cmd

        ' searchTable As New DataTable()
        'searchAdapter.Fill(searchTable)

        'searchResults.Sort("", SortDirection.Ascending)
        'searchResults.DataSourceID = ""
        'searchResults.DataSource = searchTable

        Dim selectQuery As String = "SELECT * FROM Hotel WHERE (h_name LIKE '%" & hotelnametb.Text & "%') AND (country LIKE '%" & countrytb.Text & "%') AND (stars LIKE '%" & starstb.Text & "%')"
        SqlDataSource1.SelectCommand = selectQuery
        searchResults.DataBind()

        ViewState("selectQuery") = selectQuery


        'sqlconn.Close()

    End Sub

    Protected Sub searchResults_SelectedIndexChanged() Handles searchResults.SelectedIndexChanged
        Dim selectedID = searchResults.SelectedRow.Cells(0).Text
        Dim selectedName = searchResults.SelectedRow.Cells(1).Text

        Response.Redirect("userbooking.aspx?id=" + selectedID + "&name=" + selectedName)

    End Sub


End Class
