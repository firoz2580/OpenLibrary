Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Script.Serialization
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim da As SqlDataAdapter
    Dim js As New JavaScriptSerializer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'MsgBox(Request.RawUrl())
        'MsgBox(Request.Url.AbsolutePath)
        Response.Clear()
        Response.ContentType = "text/xml"
        'If Request.Url.AbsolutePath = "/Open%20Library/APIgetBooks.aspx" Or Request.Url.AbsolutePath = "openlibrary.somee.com/APIgetBooks.aspx" Then
        If Request.QueryString("q") = "login" Then
            Call login(Request.QueryString("one"), Request.QueryString("two"))
        ElseIf Request.QueryString("q") = "logout" Then
            Call Logout()
        ElseIf Request.QueryString("q") = "checkSession" Then
            Call CheckSession()
        Else
            Call getBooksData(Request.QueryString("disLen"), Request.QueryString("disStart"), Request.QueryString("sortCol"), Request.QueryString("sortDir"), Request.QueryString("search"))
        End If
        'Else
        'Dim o As New message
        'o.errormsg = "You are not authorized to get this request"
        'Response.Write(js.Serialize(o))
        'End If
    End Sub
    <WebMethod()> _
    Public Sub getBooksData(ByVal disLen As Integer, ByVal disStart As Integer, ByVal sortCol As Integer, ByVal sortDir As String, ByVal search As String)
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        con.Open()
        Dim cmd = New SqlCommand("getFilteredBooks", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@displayLen", disLen)
        cmd.Parameters.AddWithValue("@displayStart", disStart)
        cmd.Parameters.AddWithValue("@sortCol", sortCol)
        cmd.Parameters.AddWithValue("@sortDir", sortDir)
        cmd.Parameters.AddWithValue("@search", search)

        Dim books As New List(Of Columnfields)
        Dim rdr As SqlDataReader
        rdr = cmd.ExecuteReader()
        While rdr.Read
            Dim obj As New Columnfields
            obj.rowNum = rdr(0)
            obj.totalRec = rdr(1)
            obj.id = rdr(2)
            obj.title = rdr(3)
            obj.subtitle = rdr(4)
            obj.authors = rdr(5)
            obj.cat = rdr(6)
            obj.avg = rdr(7)
            books.Add(obj)
        End While
        Response.Clear()
        Response.ContentType = "text/xml"
        Context.Response.Write(js.Serialize(books))
    End Sub
    <WebMethod()> _
    Public Sub login(ByVal u As String, ByVal p As String)
        Dim obj As New clsLogin
        Dim ret As String = obj.funcLogin(u, p)
        Response.Clear()
        Response.ContentType = "text/xml"
        If ret = "True" Then
            Dim prop As New LoginProperties
            prop.UserName = u
            prop.Auth = "success"
            Session("user") = u
            'MsgBox(Session("user"))
            Context.Response.Write(js.Serialize(prop))
        Else
            Dim prop As New LoginProperties
            prop.UserName = ""
            prop.Auth = "failed"
            Session("user") = ""
            Context.Response.Write(js.Serialize(prop))
        End If
    End Sub
    <WebMethod()> _
    Public Sub Logout()
        Session("user") = ""
        Response.Clear()
        Response.ContentType = "text/xml"
        Context.Response.Write("done")
    End Sub
    <WebMethod()> _
    Public Sub CheckSession()
        If Session("user") = "" Then
            Context.Response.Write(False)
        Else
            Context.Response.Write(True)
        End If
    End Sub
End Class
Public Class LoginProperties
    Public UserName, Auth As String
End Class
Public Class message
    Public errormsg As String
End Class