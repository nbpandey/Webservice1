<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TempConvertWSForm4.aspx.cs" Inherits="TempConvertWSForm4" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter temperature in celsius: 
            <asp:TextBox ID="txtTempInC" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Call Web Service" OnClick="btnSubmit_Click" /> <br /> <br />
            Temp in farenheit is <asp:Label ID="lblTextInF" runat="server" Text=" " Font-Underline="True"></asp:Label>  <br />
            XML Response: <br />
            <asp:TextBox id="txtXmlResponse" TextMode="multiline" Columns="100" Rows="10" runat="server" Enabled="False" />
        </div>
    </form>
    <p>See: http://www.diogonunes.com/blog/webclient-vs-httpclient-vs-httpwebrequest/ </p>
</body>
</html>
