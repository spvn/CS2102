<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Response.Redirect("administrator.aspx")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <h1>CS2102 Group 22 Hotel Management System</h1>
    
    </div>
        <asp:Button ID="Button1" runat="server" Height="110px" style="z-index: 1; left: 366px; top: 228px; position: absolute; right: 800px;" Text="Administrator" Width="244px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Height="110px" style="z-index: 1; left: 803px; top: 228px; position: absolute; right: 363px" Text="User" Width="244px" />

    </form>
</body>
</html>
