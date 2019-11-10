Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Script.Serialization
' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://openlibrary.somee.com/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class APIwebservice
    Inherits System.Web.Services.WebService
    Dim con As SqlConnection
    Dim da As SqlDataAdapter
    <WebMethod()> _
    Public Sub GetId(ByVal id As String, ByVal title As String, ByVal subtitle As String, ByVal authors As String, ByVal cat As String, ByVal avg As String)
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        con.Open()
        Dim cmd = New SqlCommand("spInsertAll1", con)
        Dim auths As String = ""
        Dim cats As String = ""
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@id", id)
        cmd.Parameters.AddWithValue("@title", title)
        If subtitle = "undefined" Then
            subtitle = ""
        End If
        cmd.Parameters.AddWithValue("@subtitle", subtitle)
        If authors = "undefined" Then
            authors = ""
        End If
        cmd.Parameters.AddWithValue("@authors", authors)
        If cat = "undefined" Then
            cat = ""
        End If
        cmd.Parameters.AddWithValue("@cat", cat)
        If avg = "undefined" Then
            avg = ""
        End If
        cmd.Parameters.AddWithValue("@avg", avg)
        cmd.ExecuteNonQuery()
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
        Dim js As New JavaScriptSerializer
        Context.Response.Write(js.Serialize(books))
    End Sub

    '    <WebMethod()> _
    'Public Sub insertion(ByVal obj As Columnfields)
    '        con = New SqlConnection(ConfigurationManager.ConnectionStrings("sqlConString").ToString)
    '        con.Open()
    '        Dim cmd = New SqlCommand("spInsertAll", con)
    '        Dim auths As String = ""
    '        Dim cats As String = ""
    '        cmd.CommandType = CommandType.StoredProcedure
    '        cmd.Parameters.AddWithValue("@id", obj.id)
    '        cmd.Parameters.AddWithValue("@title", obj.title)
    '        cmd.Parameters.AddWithValue("@subtitle", obj.subtitle)
    '        Try
    '            For i As Integer = 0 To obj.authors.Length() - 1
    '                auths += obj.authors(i) & ", "
    '            Next
    '        Catch ex As Exception
    '            auths = ""
    '        End Try
    '        cmd.Parameters.AddWithValue("@authors", auths)
    '        Try
    '            For i As Integer = 0 To obj.cat.Length() - 1
    '                cats += obj.cat(i) & ", "
    '            Next
    '        Catch ex As Exception
    '            cats = ""
    '        End Try
    '        cmd.Parameters.AddWithValue("@cat", cats)
    '        cmd.Parameters.AddWithValue("@avg", obj.avg)
    '        'MsgBox(cats)   
    '        cmd.ExecuteNonQuery()
    '    End Sub
End Class
Public Class Columnfields
    Public id, title, authors, cat, rowNum, totalRec As String
    Public avg As String = ""
    Public subtitle As String = ""
End Class
