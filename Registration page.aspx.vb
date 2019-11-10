Imports System.Data.SqlClient
Partial Class Registration_page
    Inherits System.Web.UI.Page
    Dim CON As SqlConnection
    Dim CMD As SqlCommand
    Dim DR As SqlDataReader
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            CMD = New SqlCommand("select * from userAccounts where email=@email", CON)
            CMD.Parameters.AddWithValue("@email", Request.Form("email"))
            CON.Open()
            DR = CMD.ExecuteReader
            If DR.Read Then
                msgErr.InnerText = "Email ID already exists"
                divErr.Style.Add("display", "block")
                CON.Close()
            Else
                CON.Close()
                Call saveRecord()
            End If
        Catch ex As Exception
            Response.Redirect("errorpage.aspx?msg=" & ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CON = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
        Session("user") = ""
    End Sub
    Sub saveRecord()
        Dim str As String
        If Request.Form("fname") <> "" And Request.Form("lname") <> "" And Request.Form("email") <> "" And Request.Form("pword") <> "" Then
            str = "insert into userAccounts(fname, lname, email, password) values(" & "'" & Request.Form("fname") & "','" & Request.Form("lname") & "','" & Request.Form("email") & "','" & Request.Form("pword") & "');"
            CMD = New SqlCommand(str, CON)
            CON.Open()
            CMD.ExecuteNonQuery()
            Session("user") = Request.Form("email")
            Session.Timeout = 580
            CON.Close()
            If FileUpload1.HasFile Then
                FileUpload1.PostedFile.SaveAs(Server.MapPath("dp\") & Session("User") & ".jpg")
            End If
            Response.Write("<script> alert('your account has created!'); window.location.href='index.aspx'; </script>")
        Else
            msgErr.InnerText = "Please fill all required fields (*)"
            divErr.Style.Add("display", "block")
        End If
    End Sub
End Class
