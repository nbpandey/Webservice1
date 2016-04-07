using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

public partial class TempConvertWSForm4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected async void btnSubmit_Click(object sender, EventArgs e)
    {
        lblTextInF.Text = await GetResponse(txtTempInC.Text);
        txtXmlResponse.Text = await GetResponse(txtTempInC.Text);
    }

    public async Task<string> GetResponse(string input)
    {
        using (var httpClient = new HttpClient())
        {
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:50537/TempConvertWS.asmx");
            string xmlString = @"
                <soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
                  <soap:Body>
                    <CelsiusToFahrenheit xmlns=""http://localhost/"">
                      <Celsius>" + input + @"</Celsius>
                    </CelsiusToFahrenheit>
                  </soap:Body>
                </soap:Envelope>
                ";
            request.Content = new StringContent(xmlString, Encoding.UTF8, "text/xml");
            var response = await httpClient.SendAsync(request);
            return await response.Content.ReadAsStringAsync();
        }
    }
}