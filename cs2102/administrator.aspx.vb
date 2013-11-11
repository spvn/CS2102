Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class administrator


    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()
    Dim tempData As New DataTable()
    Dim roomTable As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        Dim copyHotelNames As String
        copyHotelNames = "Select hotel_ID, h_name, c_passport, c_name FROM Hotel, Customer"


        tempAdapter.SelectCommand = New MySqlCommand(copyHotelNames, sqlconn)



        tempAdapter.Fill(tempData)

        Dim copyRooms As String
        copyRooms = "Select hotel_ID, room_number FROM Rooms"

        tempAdapter.SelectCommand = New MySqlCommand(copyRooms, sqlconn)
        tempAdapter.Fill(roomTable)


        sqlconn.Close()

    End Sub

    Protected Sub hotel_IDinput_TextChanged() Handles hotel_IDinput.TextChanged

        Dim found As Boolean = False

        For Each drow As DataRow In tempData.Rows
            If hotel_IDinput.Text = drow(0).ToString() Then
                hotel_nameinput.Text = drow(1)
                found = True
                Exit For
            End If
        Next

        If found = False Then
            hotel_nameinput.Text = "null"
        End If

    End Sub

    Protected Sub c_passportinput_TextChanged() Handles c_passportinput.TextChanged
        Dim found As Boolean = False

        For Each drow As DataRow In tempData.Rows
            If c_passportinput.Text = drow(2).ToString() Then
                c_nameinput.Text = drow(3)
                found = True
                Exit For
            End If
        Next

        If found = False Then
            c_nameinput.Text = "null"
        End If
    End Sub

    Protected Sub roominput_TextChanged() Handles roominput.TextChanged
        Dim found = False

        For Each drow As DataRow In roomTable.Rows
            If hotel_IDinput.Text = drow(0).ToString() And roominput.Text = drow(1) Then
                roomCheck.Visible = False
                found = True
                Exit For
            End If
        Next

        If found = False Then
            roomCheck.Visible = True
        End If


    End Sub

    Protected Sub submitButton_Click() Handles submitButton.Click

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)

        If hotel_nameinput.Text = "null" Then
            errorLabel.Text = "Please enter valid Hotel ID!"
            errorLabel.Visible = True
            Return
        End If

        If c_nameinput.Text = "null" Then
            errorLabel.Text = "Please enter valid customer passport number!"
            errorLabel.Visible = True
            Return
        End If

        If roomCheck.Visible = True Then
            errorLabel.Text = "Please enter valid room number!"
            errorLabel.Visible = True
            Return
        End If

        Dim checkDatesStr As String
        Dim startDate As String = start_dateinput.SelectedDate
        Dim endDate As String = end_dateinput.SelectedDate

        checkDatesStr = "SELECT start_date, end_date FROM Booking WHERE hotel_ID = @hotel_ID and room = @room"

        Dim checkDateCmd = New MySqlCommand(checkDatesStr, sqlconn)
        sqlconn.Open()

        checkDateCmd.Parameters.AddWithValue("@hotel_ID", hotel_IDinput.Text)
        checkDateCmd.Parameters.AddWithValue("@room", roominput.Text)

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
                Return
            End If
        Next

        errorLabel.Visible = False

        Dim insertstr As String
        insertstr = "INSERT INTO Booking (hotel_ID, room, c_passport, start_date, end_date) VALUES (@hotel_ID, @room, @c_passport, @start_date, @end_date);"

        Dim cmd = New MySqlCommand(insertstr, sqlconn)


        cmd.Parameters.AddWithValue("@hotel_ID", hotel_IDinput.Text)
        cmd.Parameters.AddWithValue("@room", roominput.Text)
        cmd.Parameters.AddWithValue("@c_passport", c_passportinput.Text)
        cmd.Parameters.AddWithValue("@start_date", start_dateinput.SelectedDate.ToString("yyyy/MM/dd"))
        cmd.Parameters.AddWithValue("@end_date", end_dateinput.SelectedDate.ToString("yyyy/MM/dd"))

        cmd.ExecuteNonQuery()
        sqlconn.Close()

        GridView1.DataBind()

    End Sub

End Class
