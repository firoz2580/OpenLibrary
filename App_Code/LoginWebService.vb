'Imports System.Web
'Imports System.Web.Services
'Imports System.Web.Services.Protocols
'Imports System.Data.SqlClient
'Imports System.Data
'Imports System.IO

'' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
'<System.Web.Script.Services.ScriptService()> _
'<WebService(Namespace:="http://openlibrary.somee.com/")> _
'<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
'<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
'Public Class LoginWebService
'    Inherits System.Web.Services.WebService
'    Dim con As SqlConnection
'    Dim da As SqlDataAdapter   
'    Dim n As Integer

'    <WebMethod(True)> _
'    Public Function login(ByVal name As String, ByVal password As String) As RespData
'        MsgBox("login webservice")
'        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
'        con.Open()
'        Dim cmd = New SqlCommand("spUserLogin", con)
'        cmd.CommandType = CommandType.StoredProcedure
'        cmd.Parameters.AddWithValue("@name", name)
'        cmd.Parameters.AddWithValue("@password", password)
'        da = New SqlDataAdapter(cmd)
'        Dim dt As New Data.DataTable
'        da.Fill(dt)
'        Dim obj As New RespData
'        If dt.Rows.Count = 1 Then
'            Session("user") = name
'            obj.result = "Ok"
'            obj.SessionName = Session("user")
'            'Dim str As String = File.ReadAllText(Server.MapPath("") & "\w3 login form.html")
'            obj.htmltags = File.ReadAllText(Server.MapPath("") & "\HTML logout.txt")
'        Else
'            'MsgBox("error")
'            obj.result = "fail"
'            Session("user") = ""
'            obj.htmltags = File.ReadAllText(Server.MapPath("") & "\w3 login form.html")
'        End If
'        Return obj
'    End Function
'    <WebMethod(True)> _
'    Public Function logout() As RespData
'        Session("user") = ""
'        Dim obj As New RespData
'        obj.htmltags = File.ReadAllText(Server.MapPath("") & "\w3 login form.html")
'        Return obj
'    End Function

'    <WebMethod(True)> _
'    Function getData() As RespData
'        Dim obj As New RespData
'        If Session("user") = "" Then
'            obj.htmltags = File.ReadAllText(Server.MapPath("") & "\w3 login form.html")
'        Else
'            obj.htmltags = File.ReadAllText(Server.MapPath("") & "\HTML logout.txt")
'        End If
'        'MsgBox("getdata:" & obj.htmltags)
'        Return obj
'    End Function
'End Class
