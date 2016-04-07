<%@ Page Language="C#" Async="true" %>
<%@ Import Namespace="System.Net.Http" %>

<!DOCTYPE html>

<script runat="server">

    protected async void btnSubmit_Click(object sender, EventArgs e)
    {
        using (var httpClient = new HttpClient())
        {
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:50537/TempConvertWS.asmx");
            string xmlString = @"
                <soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
                  <soap:Body>
                    <CelsiusToFahrenheit xmlns=""http://localhost/"">
                      <Celsius>" + txtTemp.Text + @"</Celsius>
                    </CelsiusToFahrenheit>
                  </soap:Body>
                </soap:Envelope>
                ";
            request.Content = new StringContent(xmlString, Encoding.UTF8, "text/xml");
            var response = await httpClient.SendAsync(request);
            var responseXML = await response.Content.ReadAsStringAsync();
            lblTemp.Text = responseXML;
            txtXmlResponse.Text = responseXML; // it will work becuase one element has data in response.
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Calling Web Services HttpClient
            </h3>
            Enter temperature in Celsius: <asp:TextBox ID="txtTemp" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Call Web Service" OnClick="btnSubmit_Click" /> <br />
            Temperature in Farenheit: <asp:Label ID="lblTemp" runat="server" Text=" " Font-Underline="True"></asp:Label> <br />
            XML Response: <br />
            <asp:TextBox id="txtXmlResponse" TextMode="multiline" Columns="100" Rows="10" runat="server" Enabled="False" />
        </div>
    </form>
    <p> See options at http://www.diogonunes.com/blog/webclient-vs-httpclient-vs-httpwebrequest/ </p>
</body>
</html>
