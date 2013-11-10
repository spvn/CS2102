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
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="booking_ID" AutoGenerateEditButton ="True">
            <Columns>
                <asp:BoundField DataField="booking_ID" HeaderText="Booking ID" ReadOnly="True" SortExpression="booking_ID" />
                <asp:BoundField DataField="hotel_ID" HeaderText="Hotel ID" SortExpression="hotel_ID" />
                <asp:BoundField DataField="h_name" HeaderText="Hotel Name" SortExpression="h_name" />
                <asp:BoundField DataField="room" HeaderText="Room Number" SortExpression="room" />
                <asp:BoundField DataField="c_passport" HeaderText="Passport Number" SortExpression="c_passport" />
                <asp:BoundField DataField="c_name" HeaderText="Customer Name" SortExpression="c_name" />
                <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date" dataformatstring="{0:yyyy/MM/dd}" applyformatineditmode="true" />
                <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="end_date" dataformatstring="{0:yyyy/MM/dd}" applyformatineditmode="true" />
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                             
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>" 
            SelectCommand="SELECT Booking.booking_ID, Booking.hotel_ID, Booking.room, Booking.c_passport, Booking.start_date, Booking.end_date, Hotel.h_name, Customer.c_name FROM Booking, Hotel, Customer WHERE Hotel.hotel_ID = Booking.hotel_ID and Customer.c_passport=Booking.c_passport"
            UpdateCommand ="UPDATE Booking SET hotel_ID=@hotel_ID, room=@room, c_passport=@c_passport, start_date=str_to_date(@start_date,'%Y/%m/%d'), end_date=str_to_date(@end_date,'%Y/%m/%d') WHERE booking_ID=@booking_ID"
            DeleteCommand ="DELETE * FROM Booking WHERE booking_ID=@booking_ID" InsertCommand="INSERT INTO Booking (booking_ID, hotel_ID, room, c_passport, start_date, end_date)
VALUES(@booking_ID, @hotel_ID, @room, @c_passport, @start_date, @end_date)">
        </asp:SqlDataSource>
        <h2 class="auto-style1">Add New Booking</h2>
        <asp:Label ID="Label1" runat="server" Text="Booking ID"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="booking_IDinput" runat="server"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Hotel ID"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_IDinput" runat="server" AutoPostBack="True"></asp:TextBox><br />
        <asp:Label ID="Label5" runat="server" Text="Hotel Name"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_name" runat="server" ReadOnly="True"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Room Number"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="roominput" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Customer Passport"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="c_passportinput" runat="server"></asp:TextBox><br />
        <br />
    </form>
</body>
</html>
