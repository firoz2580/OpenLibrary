Imports System.Data.SqlClient
Partial Class after_login
    Inherits System.Web.UI.Page
    Dim dr As SqlDataReader
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim strPassword As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        func1()
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        If Session("user") <> "" Then
            Dim dpLink As String = Server.MapPath("dp\" & Session("user") & ".jpg")
            If FileIO.FileSystem.FileExists(dpLink) Then
                DpImg.Attributes.Add("src", "dp\" & Session("user") & ".jpg")
            Else
                DpImg.Attributes.Add("src", "img\img_avatar3.png")
            End If
            'DpImg.Attributes.Add("src", "dp\" & Session("user") & ".jpg")
            con.Open()
            cmd = New SqlCommand("select * from userAccounts where email='" & Session("user") & "'", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                Label1.Text = "<code><u>Welcome</u> </code>" & dr.Item(0) & " " & dr.Item(1)
                Label2.Text = "<code><u>Your Email ID</u>:</code>" & Session("user")
                If Not IsPostBack Then
                    txtFn.Text = dr.Item(0)
                    txtLn.Text = dr.Item(1)
                    strPassword = dr.Item(3).ToString
                End If
            End If
            con.Close()
        End If
    End Sub

    Protected Sub btnUpdate_click()
        Try
            con.Open()
            Dim cmd2 As SqlCommand
            If txtFn.Text = "" Then
                Response.Write("<script>alert('First name can't be empty.');</script>")
                Exit Sub
            End If
            If txtLn.Text = "" Then
                Response.Write("<script>alert('Last name can't be empty.');</script>")
                Exit Sub
            End If
            If txtPwd.Text = "" Then
                cmd2 = New SqlCommand("update userAccounts set fname='" & txtFn.Text & "',lname='" & txtLn.Text & "',password='" & strPassword & "' where email='" & Session("user") & "'", con)
            Else
                cmd2 = New SqlCommand("update userAccounts set fname='" & txtFn.Text & "',lname='" & txtLn.Text & "',password='" & txtPwd.Text & "' where email='" & Session("user") & "'", con)
            End If
            cmd2.ExecuteNonQuery()
        Catch ex As Exception
            Response.Redirect("errorpage.aspx?msg=" & ex.Message)
        End Try
        'cmd2.ExecuteNonQuery()
        con.Close()
        Response.Redirect("My account.aspx")
    End Sub

    Protected Sub uploadPic()
        If FileUpload1.HasFile Then
            Try
                FileUpload1.PostedFile.SaveAs(Server.MapPath("dp\") & Session("User") & ".jpg")
            Catch ex As Exception
                Response.Redirect("errorpage.aspx?msg=" & ex.Message)
            End Try
        End If
    End Sub
    Protected Sub Login()
        Dim obj As New clsLogin
        Dim u As String = Request.Form("usrname")
        Dim p As String = Request.Form("psw")
        Dim res As String = obj.funcLogin(u, p)
        If res Then
            Session("user") = u
            Response.Redirect("My account.aspx")
        Else
            Response.Write("<script> alert('Incorrect Username or password!')</script>")
        End If
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
            alertDiv.Visible = True
            divRow.Visible = False
            'divRow.InnerHtml() = "<div class=""w3-large alert alert-info text-center""><p>You are not logged in! <a href=""#"" onclick=""$('#id01').css('display','block');"">click here</a> to log in.</p></div>"
        Else
            btnLogOut.Visible = True
            divContainer.Visible = False
            alertDiv.Visible = False
            divRow.Visible = True
        End If
    End Sub
End Class