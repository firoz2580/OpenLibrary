Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsLogin
    Dim con As SqlConnection
    Dim da As SqlDataAdapter
    Dim cmd As SqlCommand
    Public id, avg As String

    Public Function funcLogin(ByVal name As String, ByVal password As String) As String
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        con.Open()
        cmd = New SqlCommand("spUserLogin", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@name", name)
        cmd.Parameters.AddWithValue("@password", password)
        da = New SqlDataAdapter(cmd)
        Dim dt As New Data.DataTable
        da.Fill(dt)
        If dt.Rows.Count = 1 Then
            Return "True"
        Else
            Return "False"
        End If
    End Function
    Public Function getTitle(ByVal inn As String, ByVal link As String) As String
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        If inn = "BooksTable" Then
            cmd = New SqlCommand("select Bname from BooksTable where filepath='" & link & "'", con)
        Else
            cmd = New SqlCommand("select VideoTitle from VideoTable where videoLink='" & link & "'", con)
        End If
        con.Open()
        Return cmd.ExecuteScalar()
    End Function
End Class
