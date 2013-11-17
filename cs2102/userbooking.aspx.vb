Imports MySql.Data.MySqlClient
Imports System.Data


Partial Class userbooking
    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            Dim roomData As New DataTable()
            Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
            Dim sqlconn As New MySqlConnection(connStr)
            Dim selectedID = Request.QueryString("id")
            hotel_IDinput.Text = selectedID
            Dim selectedName = Request.QueryString("name")
            hotel_nameinput.Text = selectedName

            Dim query As String
            query = "Select room_number, category, price FROM Rooms WHERE hotel_ID =@hotel_ID"

            Dim cmd = New MySqlCommand(query, sqlconn)

            cmd.Parameters.AddWithValue("@hotel_ID", selectedID)

            tempAdapter.SelectCommand = cmd

            tempAdapter.Fill(roomData)

            Dim distinct = (From row In roomData.AsEnumerable()
            Select row.Field(Of String)("category")).Distinct().ToList()

            categorylist.DataSource = distinct
            categorylist.DataBind()

            Dim selectedCat = categorylist.SelectedValue

            Dim roomnumbers = roomData.Select("category = '" + selectedCat + "'").CopyToDataTable()

            roomlist.DataSource = roomnumbers
            roomlist.DataTextField = "room_number"
            roomlist.DataBind()

            ViewState("roomData") = roomData

            Dim price = roomData.Select("room_number= '" + roomlist.SelectedValue + "'")(0).Item(2).ToString()

            pricelabel.Text = "Cost per night: $" & price

            sqlconn.Close()
        End If


    End Sub


    Protected Sub c_passportinput_TextChanged() Handles c_passportinput.TextChanged

        If c_passportinput.Text <> "" Then
            Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
            Dim sqlconn As New MySqlConnection(connStr)
            Dim custTable As New DataTable
            Dim foundCustomer As Boolean = False
            Dim customerQuery As String = "SELECT c_name, c_country, c_creditcard, c_email, c_phone FROM Customer WHERE c_passport = " & c_passportinput.Text

            tempAdapter.SelectCommand = New MySqlCommand(customerQuery, sqlconn)
            tempAdapter.Fill(custTable)

            If custTable.Rows.Count > 0 Then
                c_nameinput.Text = custTable.Rows(0)(0)
                c_countryinput.Text = custTable.Rows(0)(1)
                c_creditcardinput.Text = custTable.Rows(0)(2)
                c_emailinput.Text = custTable.Rows(0)(3)
                c_phoneinput.Text = custTable.Rows(0)(4)
                foundCustomer = True
            Else
                foundCustomer = False
            End If

            ViewState("foundCustomer") = foundCustomer
            sqlconn.Close()
        End If
    End Sub


    Protected Sub submitButton_Click() Handles submitButton.Click

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)

        If c_passportinput.Text = "" Then
            errorLabel.Text = "ERROR: Please enter a passport number!"
            errorLabel.Visible = True
            Return
        End If

        If c_nameinput.Text = "" Then
            errorLabel.Text = "ERROR: Please enter your name!"
            errorLabel.Visible = True
            Return
        End If

        If c_creditcardinput.Text = "" Then
            errorLabel.Text = "ERROR: Please enter your credit card number!"
            errorLabel.Visible = True
            Return
        End If


        Dim startDate As String = start_dateinput.SelectedDate
        Dim endDate As String = end_dateinput.SelectedDate

        If startDate > endDate Then
            errorLabel.Text = "ERROR: Start date is later than end date, please enter valid period!"
            errorLabel.Visible = True
            Return
        End If

        Dim checkDatesStr As String = "SELECT start_date, end_date FROM Booking WHERE hotel_ID = @hotel_ID and room = @room"

        Dim checkDateCmd As New MySqlCommand(checkDatesStr, sqlconn)
        sqlconn.Open()

        checkDateCmd.Parameters.AddWithValue("@hotel_ID", hotel_IDinput.Text)
        checkDateCmd.Parameters.AddWithValue("@room", roomlist.SelectedValue)

        Dim dateCheckAdapter As New MySqlDataAdapter()
        dateCheckAdapter.SelectCommand = checkDateCmd

        Dim dateTable As New DataTable

        dateCheckAdapter.Fill(dateTable)

        For Each drow As DataRow In dateTable.Rows
            If (startDate >= CType(drow(0), Date) And startDate <= CType(drow(1), Date)) Or
                (endDate >= CType(drow(0), Date) And endDate <= CType(drow(1), Date)) Or
                (startDate <= CType(drow(0), Date) And endDate >= CType(drow(1), Date)) Then
                errorLabel.Text = "ERROR: Room is not available for the time period specified! Booking not added. Please try another room."
                errorLabel.Visible = True
                Return
            End If
        Next

        errorLabel.Visible = False

        Dim insertstr As String
        Dim foundCustomer As Boolean = ViewState("foundCustomer")
        Dim cmd As New MySqlCommand

        If foundCustomer = False Then
            insertstr = "INSERT INTO Customer (c_name, c_passport, c_country, c_creditcard, c_email, c_phone) VALUES (@c_name, @c_passport, @c_country, @c_creditcard, @c_email, @c_phone);"
            cmd = New MySqlCommand(insertstr, sqlconn)
            cmd.Parameters.AddWithValue("@c_name", c_nameinput.Text)
            cmd.Parameters.AddWithValue("@c_passport", c_passportinput.Text)
            cmd.Parameters.AddWithValue("@c_country", c_countryinput.Text)
            cmd.Parameters.AddWithValue("@c_creditcard", c_creditcardinput.Text)
            cmd.Parameters.AddWithValue("@c_email", c_emailinput.Text)
            cmd.Parameters.AddWithValue("@c_phone", c_phoneinput.Text)
            cmd.ExecuteNonQuery()
        End If



        insertstr = "INSERT INTO Booking (hotel_ID, room, c_passport, start_date, end_date) VALUES (@hotel_ID, @room, @c_passport, @start_date, @end_date);"

        cmd = New MySqlCommand(insertstr, sqlconn)


        cmd.Parameters.AddWithValue("@hotel_ID", hotel_IDinput.Text)
        cmd.Parameters.AddWithValue("@room", roomlist.SelectedValue)
        cmd.Parameters.AddWithValue("@c_passport", c_passportinput.Text)
        cmd.Parameters.AddWithValue("@start_date", start_dateinput.SelectedDate.ToString("yyyy/MM/dd"))
        cmd.Parameters.AddWithValue("@end_date", end_dateinput.SelectedDate.ToString("yyyy/MM/dd"))

        cmd.ExecuteNonQuery()

        sqlconn.Close()

    End Sub

    Protected Sub categorylist_SelectedIndexChanged(sender As Object, e As EventArgs) Handles categorylist.SelectedIndexChanged
        Dim selectedCat = categorylist.SelectedValue
        Dim roomData As DataTable = ViewState("roomData")
        Dim roomnumbers = roomData.Select("category = '" + selectedCat + "'").CopyToDataTable()
        roomlist.DataSource = roomnumbers
        roomlist.DataTextField = "room_number"
        roomlist.DataBind()

        Dim price = roomData.Select("room_number= '" + roomlist.SelectedValue + "'")(0).Item(2).ToString()

        pricelabel.Text = "Cost per night: $" & price
    End Sub

    Protected Sub roomlist_SelectedIndexChanged(sender As Object, e As EventArgs) Handles roomlist.SelectedIndexChanged
        Dim roomData As DataTable = ViewState("roomData")

        Dim price = roomData.Select("room_number= '" + roomlist.SelectedValue + "'")(0).Item(2).ToString()

        pricelabel.Text = "Cost per night: $" & price
    End Sub
End Class
