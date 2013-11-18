﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="adminbooking.aspx.vb" Inherits="adminbooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Candara;
            background-color: #99FFCC;
            text-align: center;
        }
        .newStyle1 {
            font-family: Candara;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

            <div id ="newBooking">
            <h2 class="auto-style1">Add a Booking</h2>
  
            <asp:Label ID="Label2" runat="server" Text="Hotel ID" Font-Names="Candara"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_IDinput" runat="server" Width="56px" AutoPostBack="True" Font-Names="Candara"></asp:TextBox>&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Hotel Name" Font-Names="Candara"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="hotel_nameinput" runat="server" ReadOnly="True" Enabled="False" Width="290px" Font-Names="Candara"></asp:TextBox>
                <br />
                <br />
                <span class="newStyle1">Choose the type of room:&nbsp;</span>
                <asp:DropDownList ID="categorylist" runat="server" AutoPostBack="True" Font-Names="Candara">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class = "newStyle1">Room number:&nbsp;</span>
                <asp:DropDownList ID="roomlist" runat="server" Font-Names="Candara">
                </asp:DropDownList>
                &nbsp;<br />
                <br />
                <asp:Label ID="Label14" runat="server" Text="Customer Information" Font-Bold="True" Font-Names="Candara"></asp:Label>
                <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Passport ID" Font-Names="Candara"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="c_passportinput" runat="server" AutoPostBack="True" Font-Names="Candara"></asp:TextBox>&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Name" Font-Names="Candara"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="c_nameinput" runat="server" Font-Names="Candara"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Label10" runat="server" Text="Country" Font-Names="Candara"></asp:Label>
            &nbsp;
                <asp:TextBox ID="c_countryinput" runat="server" Font-Names="Candara"></asp:TextBox>
                <br />
                <asp:Label ID="Label11" runat="server" Text="Credit card Number" Font-Names="Candara"></asp:Label>
                &nbsp;
                <asp:TextBox ID="c_creditcardinput" runat="server" Font-Names="Candara"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Label13" runat="server" Text="Email" Font-Names="Candara"></asp:Label>
            &nbsp;
                <asp:TextBox ID="c_emailinput" runat="server" Font-Names="Candara"></asp:TextBox>
            &nbsp;
                <asp:Label ID="Label12" runat="server" Text="Mobile number" Font-Names="Candara"></asp:Label>
            &nbsp;
                <asp:TextBox ID="c_phoneinput" runat="server" Font-Names="Candara"></asp:TextBox>
                <br />
            <br />
            <div id="startdate">
            <asp:Label ID="Label8" runat="server" Text="Start Date" Font-Names="Candara"></asp:Label>
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
            <div id="enddate" style="position: relative; left: 400px; margin-top: -210px; top: 0px;">
            <asp:Label ID="Label9" runat="server" Text="End Date" Font-Names="Candara"></asp:Label>
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

            <asp:Button ID="submitButton" runat="server" Text="Submit" Font-Names="Candara" />&nbsp;
                <asp:Label ID="sucesslabel" runat="server" Text="Booking Record Added!" Visible="False" Font-Names="Candara"></asp:Label>
                <asp:Button ID="successbutton" runat="server" Text="Go back to admin page" Visible="False" Font-Names="Candara" />
                <br /><br />
            <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False" Font-Names="Candara"></asp:Label>

            <br />
        </div>
    </form>
</body>
</html>
