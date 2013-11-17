Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class administrator


    Inherits System.Web.UI.Page


    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Dim row = GridView1.Rows(e.RowIndex)
        Dim startDate = (CType((row.Cells(7).Controls(0)), TextBox)).Text
        Dim endDate = (CType((row.Cells(8).Controls(0)), TextBox)).Text
        Dim hotel = (CType((row.Cells(2).Controls(0)), TextBox)).Text
        Dim room = (CType((row.Cells(4).Controls(0)), TextBox)).Text
        Dim bookingid As String = row.Cells(1).Text

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)

        Dim checkDatesStr = "SELECT start_date, end_date FROM Booking WHERE hotel_ID = @hotel_ID and room = @room and booking_id <> @booking_id"

        Dim checkDateCmd As New MySqlCommand(checkDatesStr, sqlconn)
        sqlconn.Open()

        checkDateCmd.Parameters.AddWithValue("@hotel_ID", hotel)
        checkDateCmd.Parameters.AddWithValue("@room", room)
        checkDateCmd.Parameters.AddWithValue("@booking_id", bookingid)

        Dim dateCheckAdapter As New MySqlDataAdapter()
        dateCheckAdapter.SelectCommand = checkDateCmd

        Dim dateTable As New DataTable

        dateCheckAdapter.Fill(dateTable)

        For Each drow As DataRow In dateTable.Rows
            If (startDate >= CType(drow(0), Date) And startDate <= CType(drow(1), Date)) Or
                (endDate >= CType(drow(0), Date) And endDate <= CType(drow(1), Date)) Or
                (startDate <= CType(drow(0), Date) And endDate >= CType(drow(1z), Date)) Then
                errorLabel.Text = "Room is not available for the time period specified!"
                errorLabel.Visible = True
                e.Cancel = True
                Return
            End If
        Next

        errorLabel.Text = "Record Successfully Updated!"
        errorLabel.Visible = True
        sqlconn.Close()
    End Sub
    
    Protected Sub addBooking_Click(sender As Object, e As EventArgs) Handles addBooking.Click
        Response.Redirect("adminbooking.aspx")
    End Sub
End Class
