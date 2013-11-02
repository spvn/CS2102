<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <h1>User Page</h1>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="hotel_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="h_name" HeaderText="Hotel" SortExpression="h_name"></asp:BoundField>
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
                <asp:BoundField DataField="stars" HeaderText="stars" SortExpression="stars"></asp:BoundField>
                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country"></asp:BoundField>
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                <asp:BoundField DataField="postal_code" HeaderText="postal_code" SortExpression="postal_code"></asp:BoundField>
                <asp:CommandField HeaderText="Add Booking" SelectText="Book NOW!" ShowHeader="True" ShowSelectButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString %>" ProviderName="<%$ ConnectionStrings:akaspvnc_cs2102ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Hotel]"></asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server">
        </asp:FormView>
    </form>
</body>
</html>
