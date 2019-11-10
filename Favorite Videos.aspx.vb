Imports System.Data.SqlClient
Partial Class Favorite_Videos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        videoModal.Style.Add("display", "none")
        If Not IsPostBack Then
            func1()
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If Session("user") = "" Then
            id01.Style.Add("display", "block")
        Else
            If e.CommandName = "view" Then
                Dim obj As New clsLogin
                myIframe.Attributes.Add("src", e.CommandArgument)
                'myIframe.Attributes.Item("class") = "book-file"
                videoModal.Attributes.Item("class") = "modal in"
                videoModal.Style.Add("display", "block")
                myIframe.Attributes.Item("src") = e.CommandArgument
                modelTitle.InnerText = obj.getTitle("videoTable", e.CommandArgument)
            End If
        End If
    End Sub
    Protected Sub Button1_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim con As SqlConnection
        Dim cmd As SqlCommand
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        con.Open()
        If e.CommandName = "remove" Then
            Dim deleteStr As String
            deleteStr = "delete from favorites where VideoID=" & e.CommandArgument & " and email='" & Session("user") & "';"
            cmd = New SqlCommand(deleteStr, con)
            cmd.ExecuteNonQuery()
            Response.Redirect("favorite videos.aspx")
        End If
    End Sub
    Private Sub func1()
        If Session("user") = "" Then
            btnLogOut.Visible = False
            divContainer.Visible = True
            'divRow.InnerHtml() = "<div class=""w3-large alert alert-info text-center""><p>You are not logged in! <a href=""#"" onclick=""$('#id01').css('display','block');"">click here</a> to log in.</p></div>"
            mainContainer.Visible = False
            divRow.Visible = True
        Else
            btnLogOut.Visible = True
            divContainer.Visible = False
            mainContainer.Visible = True
            divRow.Visible = False
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
