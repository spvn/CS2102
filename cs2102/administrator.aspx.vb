Imports MySql.Data.MySqlClient
Imports System.Data

Partial Class administrator


    Inherits System.Web.UI.Page

    Dim tempAdapter As New MySqlDataAdapter()
    Dim tempData As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connStr As String = "Database=akaspvnc_cs2102;Data Source=sql.byethost22.org;User Id=akaspvnc_cs2102;Password=oohjingrocks"
        Dim sqlconn As New MySqlConnection(connStr)
        Dim copyHotelNames As String
        copyHotelNames = "Select hotel_ID, h_name FROM Hotel"


        tempAdapter.SelectCommand = New MySqlCommand(copyHotelNames, sqlconn)



        tempAdapter.Fill(tempData)


        sqlconn.Close()

    End Sub

    Protected Sub hotel_IDinput_TextChanged() Handles hotel_IDinput.TextChanged

        Dim found As Boolean = False

        For Each drow As DataRow In tempData.Rows
            If hotel_IDinput.Text = drow(0).ToString() Then
                hotel_name.Text = drow(1)
                found = True
                Exit For
            End If
        Next

        If found = False Then
            hotel_name.Text = "null"
        End If

    End Sub
End Class
