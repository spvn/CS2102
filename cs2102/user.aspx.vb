Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class user

    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()
    Dim passportData As New DataTable()
    Dim roomTable As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        Dim copyPassports As String

        copyPassports = "Select c_passport FROM Booking"

        tempAdapter.SelectCommand = New MySqlCommand(copyPassports, sqlconn)
        tempAdapter.Fill(passportData)

        sqlconn.Close()

    End Sub

    Protected Sub submitButton_Click() Handles submitButton.Click

        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        sqlconn.Open()

        Dim found As Boolean = False
        For Each drow As DataRow In passportData.Rows
            If passportInput.Text = drow(0).ToString() Then
                found = True
                Exit For
            End If
        Next

        If found = False Then
            errorLabel.Text = "Please enter existing passport number!"
            errorLabel.Visible = True
            Return
        End If

        Dim selectstr As String
        selectstr = "SELECT * FROM Booking WHERE c_passport = @c_passport"

        Dim cmd As New MySqlCommand(selectstr, sqlconn)


        cmd.Parameters.AddWithValue("@c_passport", passportInput.Text)

        cmd.ExecuteNonQuery()
        sqlconn.Close()
        currBookings.DataBind()

        errorLabel.Visible = False
    End Sub


    Protected Sub Search_Click(sender As Object, e As EventArgs) Handles Search.Click
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks;"
        Dim sqlconn As New MySqlConnection(connStr)
        sqlconn.Open()
        Dim selectstr As String
        selectstr = "SELECT * FROM Hotel WHERE (h_name LIKE '$@h_name')"

        Dim cmd As New MySqlCommand(selectstr, sqlconn)

        cmd.Parameters.AddWithValue("@h_name", hotelnametb.Text)
        cmd.Parameters.AddWithValue("@country", countrytb.Text)
        cmd.Parameters.AddWithValue("@stars", starstb.Text)

        searchResults.DataBind()

        cmd.ExecuteNonQuery()
        sqlconn.Close()

    End Sub
End Class
