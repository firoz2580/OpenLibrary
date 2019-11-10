Imports System.Data.SqlClient
Partial Class Book_results
    Inherits System.Web.UI.Page
    Dim field As String
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        func1()
        bookModal.Style.Add("display", "none")
        If Not IsPostBack Then
            If Request.QueryString("subCat") <> "" Then
                field = Request.QueryString("subCat")
                searchtxt.Enabled = False
                searchtxt.BackColor = Drawing.Color.Gray
                searchtxt.ForeColor = Drawing.Color.Black
                searchtxt.Text = field
                GridView1.DataSourceID = "BySubCat_SqlDataSource"
            End If
            If Request.QueryString("cat") <> "" Then
                searchtxt.Enabled = False
                searchtxt.BackColor = Drawing.Color.Gray
                searchtxt.ForeColor = Drawing.Color.Black
                field = Request.QueryString("cat")
                searchtxt.Text = field
                GridView1.DataSourceID = "ByCat_SqlDataSource"
            End If
            If searchtxt.Enabled = True And searchtxt.Text <> "" Then
                GridView1.DataSourceID = "ManualSearch_SqlDataSource"
            End If
        End If
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("firozLibraryDB").ToString)
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "view" Then
            Dim obj As New clsLogin
            myIframe.Attributes.Add("src", e.CommandArgument)
            bookModal.Attributes.Item("class") = "modal in"
            bookModal.Style.Add("display", "block")
            myIframe.Attributes.Item("src") = e.CommandArgument
            modelTitle.InnerText = obj.getTitle("BooksTable", e.CommandArgument)
        End If
    End Sub

    Public Sub SearchClick() Handles btnSearch.ServerClick
        If searchtxt.Text <> Request.QueryString("cat") & Request.QueryString("subCat") Then
            GridView1.DataSourceID = "ManualSearch_SqlDataSource"
        Else
            Response.Redirect("book results.aspx")
        End If
    End Sub
    Protected Sub Button1_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        con.Open()
        If Session("user") = "" Then
            id01.Style.Add("display", "block")
        Else
            If e.CommandName = "add" Then
                cmd = New SqlCommand("select * from favorites where email='" & Session("user") & "' and BookID=" & e.CommandArgument & ";", con)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                If dr.Read Then
                    Response.Write("<script> alert('Already added to favorites!')</script>")
                    con.Close()
                Else
                    con.Close()
                    Insertion(e.CommandArgument)
                End If
            End If
        End If
    End Sub
    Public Sub Insertion(ByVal bID As String)
        Dim insertCmd As String
        Dim fId As Integer
        cmd = New SqlCommand("select BookID from favorites where favoriteID='" & fId & "'", con)
        con.Open()
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader
        If dr.Read Then
            fId = New Random().Next()
        End If
        con.Close()
        insertCmd = "insert into favorites(BookID,email,type,favoriteID) values(" & bID & ",'" & Session("user") & "','Book'," & fId.ToString & ");"
        con.Open()
        Dim cmd2 As New SqlCommand(insertCmd, con)
        cmd2.ExecuteNonQuery()
        con.Close()
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
                func1()
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
