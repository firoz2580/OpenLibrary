Partial Class select_book_type
    Inherits System.Web.UI.Page
    Dim str As String
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        If Request.QueryString("cat") <> "" Then
            str = Request.QueryString("cat")
            Response.Redirect("Book results.aspx?cat=" & str)
        End If
        If Request.QueryString("subCat") <> "" Then
            str = Request.QueryString("subCat")
            Response.Redirect("Book results.aspx?subCat=" & str)
        End If
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        If Request.QueryString("cat") <> "" Then
            str = Request.QueryString("cat")
            Response.Redirect("Video results.aspx?cat=" & str)
        End If
        If Request.QueryString("subCat") <> "" Then
            str = Request.QueryString("subCat")
            Response.Redirect("Video results.aspx?subCat=" & str)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            func1()
        End If
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
End Class
