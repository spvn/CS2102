<%@ Page Language="VB" AutoEventWireup="false" CodeFile="user.aspx.vb" Inherits="user" %>

<!DOCTYPE html>
<script runat="server">
    

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        .newStyle2 {
            font-family: Candara;
        }
        .newStyle3 {
            font-family: Candara;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">

            <h2 class="auto-style1">User Page</h2>

        </div>
        <div style="text-align: center">

            <p style="font-weight: 700; text-align: center;">
                <span class="newStyle1">Enter passport number to view current bookings:</span>&nbsp;
                <asp:TextBox ID="passportInput" runat="server" Height="18px" Style="margin-top: 5px" Font-Names="Candara"></asp:TextBox>
                &nbsp;
                <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" Style="height: 26px" Font-Names="Candara" />
            </p>

        </div>
        <div style="text-align: center">

            <p style="font-weight: 700; text-align: center;">
                <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False" Font-Names="Candara"></asp:Label>
            </p>

        </div>
        <div style="text-align: center; margin-left: auto; margin-right: auto; margin-bottom: 100px;">



            <asp:GridView ID="currBookings" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="booking_ID" HorizontalAlign="Center" AutoGenerateEditButton="True" CellPadding="4" GridLines="None" Font-Names="Candara" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="booking_ID" HeaderText="Booking ID" ReadOnly="True" SortExpression="booking_ID" InsertVisible="False" />
                    <asp:BoundField DataField="hotel_ID" HeaderText="Hotel ID" SortExpression="hotel_ID" />
                    <asp:BoundField DataField="room" HeaderText="Room Number" SortExpression="room" />
                    <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true" />
                    <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="end_date" DataFormatString="{0:yyyy/MM/dd}" ApplyFormatInEditMode="true" />

                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM [Booking] WHERE ([c_passport] = ?)"
                DeleteCommand="DELETE FROM Booking WHERE booking_ID=@booking_ID"
                UpdateCommand="UPDATE Booking SET hotel_ID=@hotel_ID, room=@room, c_passport=@c_passport, start_date=str_to_date(@start_date,'%Y/%m/%d'), end_date=str_to_date(@end_date,'%Y/%m/%d') WHERE booking_ID=@booking_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="passportInput" Name="c_passport" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


        <div style="text-align: center;  border: 1px solid black;">



            <span class="newStyle2">



            <strong>Browse Hotels</strong><br />
            </span>
            <asp:Panel ID="Panel1" DefaultButton="Search" runat="server">
                <p class="newStyle3">
                    Hotel name:
                <asp:TextBox ID="hotelnametb" runat="server" Style="text-align: left" Width="106px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Country:
                <asp:TextBox ID="countrytb" runat="server" Width="130px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Stars:
                <asp:TextBox ID="starstb" runat="server" Width="62px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Button ID="Search" runat="server" Text="Search" Font-Names="Candara" />
                </p>
           
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="newStyle1" RepeatDirection="Horizontal" Width="622px">
                    <asp:ListItem Value="wifi">Wifi</asp:ListItem>
                    <asp:ListItem Value="gym">Gym</asp:ListItem>
                    <asp:ListItem Value="swimming_pool">Swmming Pool</asp:ListItem>
                    <asp:ListItem Value="shuttle_bus">Shuttle Bus Service</asp:ListItem>
                    <asp:ListItem Value="spa">Spa</asp:ListItem>
                </asp:CheckBoxList>
                <br /><br />
            </asp:Panel>



            <asp:GridView ID="searchResults" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" GridLines="None" DataKeyNames="hotel_ID" DataSourceID="SqlDataSource1" AllowSorting="True" Font-Names="Candara" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="hotel_ID" HeaderText="Hotel ID" ReadOnly="True" SortExpression="hotel_ID" AccessibleHeaderText="candara" />
                    <asp:BoundField DataField="h_name" HeaderText="Hotel Name" SortExpression="h_name" />
                    <asp:BoundField DataField="stars" HeaderText="Stars" SortExpression="stars" />
                    <asp:BoundField DataField="wifi" HeaderText="Wifi" SortExpression="wifi" />
                    <asp:BoundField DataField="gym" HeaderText="Gym" SortExpression="gym" />
                    <asp:BoundField DataField="swimming_pool" HeaderText="Swmming Pool" SortExpression="swimming_pool" />
                    <asp:BoundField DataField="shuttle_bus" HeaderText="Shuttle Bus Service" SortExpression="shuttle_bus" />
                    <asp:BoundField DataField="spa" HeaderText="Spa" SortExpression="spa" />
                    <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                    <asp:BoundField DataField="postal_code" HeaderText="Postal Code" SortExpression="postal_code" />
                    <asp:CommandField ButtonType="Button" HeaderText="Book A Room" ShowHeader="True" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>"
                SelectCommand="SELECT Hotel.hotel_ID, Hotel.h_name, Hotel.stars, Features.wifi, Features.gym, Features.swimming_pool, Features.shuttle_bus, Features.spa, Hotel.country, Hotel.address, Hotel.postal_code FROM Hotel INNER JOIN Features ON Hotel.hotel_ID = Features.hotel_ID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

