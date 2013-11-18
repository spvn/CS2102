<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Response.Redirect("administrator.aspx")
    End Sub
    
    Protected Sub Button2_Click() Handles Button2.Click
        Response.Redirect("user.aspx")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-family: Candara;
            color: #0066CC
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <h1><span class="newStyle1">CS2102 Group 22 Hotel Management System</span></h1>
    
    </div>
        <asp:Button ID="Button1" runat="server" Height="110px" style="z-index: 1; left: 366px; top: 228px; position: absolute; right: 422px;" Text="Administrator" Width="244px" OnClick="Button1_Click" BackColor="#0066CC" BorderStyle="Double" Font-Names="Candara" Font-Size="Large" ForeColor="#CCFFFF" />
        <asp:Button ID="Button2" runat="server" Height="110px" style="z-index: 1; top: 228px; position: absolute; right: -14px" Text="User" Width="244px" BackColor="#0066CC" BorderStyle="Double" Font-Names="Candara" Font-Size="Large" ForeColor="#CCFFFF" />

    </form>
</body>
</html>
