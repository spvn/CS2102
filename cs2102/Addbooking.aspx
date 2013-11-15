<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Addbooking.aspx.vb" Inherits="Addbooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

            <div id ="newBooking">
            <h2 class="auto-style1">Add New Booking</h2>
  
            <asp:Label ID="Label2" runat="server" Text="Hotel ID"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_IDinput" runat="server" AutoPostBack="True"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Text="Hotel Name"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_nameinput" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Room Number"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="roominput" runat="server" AutoPostBack="True"></asp:TextBox>&nbsp;&nbsp;
            <asp:Label ID="roomCheck" runat="server" Text="Room number invalid!" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Customer Passport"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="c_passportinput" runat="server" AutoPostBack="True"></asp:TextBox><br />
            <asp:Label ID="Label6" runat="server" Text="Customer Name"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="c_nameinput" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <div id="startdate">
            <asp:Label ID="Label8" runat="server" Text="Start Date"></asp:Label>
            <br />
            <asp:Calendar ID="start_dateinput" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                </div>
            <div id="enddate" style="position: relative; left: 400px; margin-top: -210px;">
            <asp:Label ID="Label9" runat="server" Text="End Date"></asp:Label>
            <asp:Calendar ID="end_dateinput" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                </div>
            

            <br /><br />

            <asp:Button ID="submitButton" runat="server" Text="Submit" /><br /><br />
            <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False"></asp:Label>

            <br />
        </div>
</body>
</html>
