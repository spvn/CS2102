<%@ Page Language="VB" AutoEventWireup="false" CodeFile="user.aspx.vb" Inherits="user" %>

<!DOCTYPE html>
<script runat="server">
    

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">

            <h1>User Page</h1>

        </div>
        <div style="text-align: center">

            <p style="font-weight: 700; text-align: center;">
                Enter passport number to view current bookings:&nbsp;
                <asp:TextBox ID="passportInput" runat="server" Height="18px" Style="margin-top: 5px"></asp:TextBox>
                &nbsp;
                <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" Style="height: 26px" />
            </p>

        </div>
        <div style="text-align: center">

            <p style="font-weight: 700; text-align: center;">
                <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
            </p>

        </div>
        <div style="text-align: center">

            <p style="font-weight: 700; text-align: left;">Current Bookings</p>

        </div>

        <asp:GridView ID="currBookings" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="booking_ID" AutoGenerateEditButton="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="booking_ID" HeaderText="booking_ID" ReadOnly="True" SortExpression="booking_ID" InsertVisible="False" />
                <asp:BoundField DataField="hotel_ID" HeaderText="hotel_ID" SortExpression="hotel_ID" />
                <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
                <asp:BoundField DataField="c_passport" HeaderText="c_passport" SortExpression="c_passport" />
                <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true"/>
                <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true"/>

                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [Booking] WHERE ([c_passport] = ?)"
            DeleteCommand="DELETE FROM Booking WHERE booking_ID=@booking_ID"
            UpdateCommand="UPDATE Booking SET hotel_ID=@hotel_ID, room=@room, c_passport=@c_passport, start_date=str_to_date(@start_date,'%Y/%m/%d'), end_date=str_to_date(@end_date,'%Y/%m/%d') WHERE booking_ID=@booking_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="passportInput" Name="c_passport" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div style="text-align: center">

            <p style="font-weight: 700">&nbsp;</p>

        </div>
        <div style="text-align: center">



            <asp:Panel ID="Panel1" DefaultButton="Search" runat="server">
                <p style="text-align: left">
                    Hotel name:
                <asp:TextBox ID="hotelnametb" runat="server" Style="text-align: left" Width="106px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Country:
                <asp:TextBox ID="countrytb" runat="server" Width="130px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Stars:
                <asp:TextBox ID="starstb" runat="server" Width="62px"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="Search" runat="server" Text="Search" />
                </p>
            </asp:Panel>

        </div>
        <div style="text-align: center">

            <p style="text-align: left; font-weight: 700;">Search Results:</p>

        </div>
        <asp:GridView ID="searchResults" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="hotel_ID" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="hotel_ID" HeaderText="Hotel ID" ReadOnly="True" SortExpression="hotel_ID" />
                <asp:BoundField DataField="h_name" HeaderText="Hotel Name" SortExpression="h_name" />
                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                <asp:BoundField DataField="stars" HeaderText="Stars" SortExpression="stars" />
                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="postal_code" HeaderText="Postal Code" SortExpression="postal_code" />
                <asp:CommandField ButtonType="Button" HeaderText="Book A Room" ShowHeader="True" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM [Hotel]"></asp:SqlDataSource>
    </form>
</body>
</html>

