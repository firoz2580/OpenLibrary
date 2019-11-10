
Partial Class Computers
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        func1()
    End Sub
    Protected Sub Login()
        Try
            Dim obj As New clsLogin
            Dim u As String = Request.Form("usrname")
            Dim p As String = Request.Form("psw")
            Dim res As String = obj.funcLogin(u, p)
            If res Then
                Session("user") = u
            Else
                Response.Write("<script> alert('Incorrect Username or password!')</script>")
            End If
        Catch ex As Exception
            Response.Redirect("errorpage.aspx?msg=" & ex.Message)
        End Try
        func1()
    End Sub
    Protected Sub Logout()
        Session("user") = ""
        func1()
    End Sub
    Private Sub func1()
        If Session("user") = "" Then
            btnLogOut.Visible = False
            divContainer.Visible = True
        Else
            btnLogOut.Visible = True
            divContainer.Visible = False
        End If
    End Sub
End Class
