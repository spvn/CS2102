<%@ Page Language="VB" AutoEventWireup="false" CodeFile="administrator.aspx.vb" Inherits="administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">

            <h1>Administrator Page</h1>

        </div>
        <div style="text-align: center">

            <h2 class="auto-style1">View Current Bookings</h2>

        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="booking_ID" AutoGenerateEditButton="True">
            <Columns>
                <asp:BoundField DataField="booking_ID" HeaderText="Booking ID" ReadOnly="True" SortExpression="booking_ID" />
                <asp:BoundField DataField="hotel_ID" HeaderText="Hotel ID" SortExpression="hotel_ID" />
                <asp:BoundField DataField="h_name" HeaderText="Hotel Name" SortExpression="h_name" />
                <asp:BoundField DataField="room" HeaderText="Room Number" SortExpression="room" />
                <asp:BoundField DataField="c_passport" HeaderText="Passport Number" SortExpression="c_passport" />
                <asp:BoundField DataField="c_name" HeaderText="Customer Name" SortExpression="c_name" />
                <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true" />
                <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="end_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true" />
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>"
            SelectCommand="SELECT Booking.booking_ID, Booking.hotel_ID, Booking.room, Booking.c_passport, Booking.start_date, Booking.end_date, Hotel.h_name, Customer.c_name FROM Booking, Hotel, Customer WHERE Hotel.hotel_ID = Booking.hotel_ID and Customer.c_passport=Booking.c_passport"
            UpdateCommand="UPDATE Booking SET hotel_ID=@hotel_ID, room=@room, c_passport=@c_passport, start_date=str_to_date(@start_date,'%Y/%m/%d'), end_date=str_to_date(@end_date,'%Y/%m/%d') WHERE booking_ID=@booking_ID"
            DeleteCommand="DELETE FROM Booking WHERE booking_ID=@booking_ID" InsertCommand="INSERT INTO Booking (booking_ID, hotel_ID, room, c_passport, start_date, end_date)
                            VALUES(@booking_ID, @hotel_ID, @room, @c_passport, @start_date, @end_date)"></asp:SqlDataSource>
        <br /><asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        <br /><br />

        <div id ="newBooking">

            <asp:Button ID="addBooking" runat="server" Text="Add New Booking" />

            <br />
        </div>
    </form>
</body>
</html>
