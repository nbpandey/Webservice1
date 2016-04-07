<%@ WebService Language="VB" Class="TempConvert" %>

Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://localhost/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
Public Class TempConvert : Inherits WebService

    <WebMethod()>
    Public Function FahrenheitToCelsius(ByVal Fahrenheit As String) As String
        Dim fahr
        fahr = Trim(Replace(Fahrenheit, ",", "."))
        If fahr = "" Or IsNumeric(fahr) = False Then Return "Error"
        Return ((((fahr) - 32) / 9) * 5)
    End Function

    <WebMethod()>
    Public Function CelsiusToFahrenheit(ByVal Celsius As String) As String
        Dim cel
        cel = Trim(Replace(Celsius, ",", "."))
        If cel = "" Or IsNumeric(cel) = False Then Return "Error"
        Return ((((cel) * 9) / 5) + 32)
    End Function

End Class

