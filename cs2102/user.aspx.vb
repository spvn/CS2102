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
        copyHotelNames = "Select hotel_ID, h_name, c_passport, c_name FROM Hotel, Customer"

        sqlconn.Close()

    End Sub

End Class
