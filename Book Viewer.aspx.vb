Partial Class Book_Viewer
    Inherits System.Web.UI.Page
    Dim emLink As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        emLink = Request.QueryString("embed")
        myIframe.Attributes.Item("src") = emLink
        If emLink.FirstOrDefault() = "h" Then
            emLink = Request.QueryString("embed") & "&lpg=" & Request.QueryString("lpg") & "&dq=" & Request.QueryString("dq") & "&pg=" & Request.QueryString("pg") & "&output=" & Request.QueryString("output")
            myIframe.Attributes.Item("class") = "book-file"
            myIframe.Attributes.Item("src") = emLink
        End If
        If emLink.Chars(8) = "w" Then
            bookId.Attributes.Item("class") = "video-container"
            myIframe.Attributes.Item("class") = "video-file"
        End If
        'If Session("user") = "" Then
        'Response.Redirect("login page.aspx")
        'End If
    End Sub
End Class
