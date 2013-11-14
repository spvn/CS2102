Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class user

    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()
    Dim tempData As New DataTable()
    Dim roomTable As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        Dim copyHotelNames As String

        errorLabel.Visible = False
        copyHotelNames = "Select hotel_ID, h_name, description, stars, country, address, postal_code FROM Hotel"

        tempAdapter.SelectCommand = New MySqlCommand(copyHotelNames, sqlconn)
        tempAdapter.Fill(tempData)

        sqlconn.Close()

    End Sub

    Protected Sub submitButton_Click() Handles submitButton.Click

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        sqlconn.Open()

        If passportInput.Text = "null" Then
            errorLabel.Text = "Please enter valid passport number!"
            errorLabel.Visible = True
            Return
        End If

        errorLabel.Visible = False
        Dim selectstr As String
        selectstr = "SELECT * FROM Booking WHERE c_passport = @c_passport"

        Dim cmd As New MySqlCommand(selectstr, sqlconn)


        cmd.Parameters.AddWithValue("@c_passport", passportInput.Text)

        cmd.ExecuteNonQuery()
        sqlconn.Close()

        currBookings.DataBind()

    End Sub


    Protected Sub Search_Click(sender As Object, e As EventArgs) Handles Search.Click
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        sqlconn.Open()
        Dim selectstr As String
        selectstr = "SELECT * FROM Hotel WHERE ((h_name LIKE '%' + @h_name + '%') AND (country LIKE '%' + @country + '%') AND (stars = @stars))"

        Dim cmd As New MySqlCommand(selectstr, sqlconn)

        cmd.Parameters.AddWithValue("@h_name", hotelnametb.Text)
        cmd.Parameters.AddWithValue("@country", countrytb.Text)
        cmd.Parameters.AddWithValue("@stars", starstb.Text)

        cmd.ExecuteNonQuery()
        sqlconn.Close()

        searchResults.DataBind()

    End Sub
End Class
