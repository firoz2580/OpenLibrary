Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim da As SqlDataAdapter
    Dim n As Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        con.Open()
        Dim cmd = New SqlCommand("select * from userAccounts where email='" & name.Value & "' and password='" & password.Value & "'", con)
        'cmd.Parameters.AddWithValue("@email", Request.Form("e"))
        da = New SqlDataAdapter(cmd)
        Dim dt As New Data.DataTable
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Session("user") = name.Value
            Session.Timeout = 580
            Response.Redirect("index.aspx")
        Else
            Response.Write("<script> alert('Incorrect Username or password!')</script>")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("user") = ""
        name.Focus()
    End Sub
End Class
