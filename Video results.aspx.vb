Imports System.Data.SqlClient
Partial Class Video_results
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim field As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        func1()
        videoModal.Style.Add("display", "none")
        If Not IsPostBack Then
            If Request.QueryString("subcat") <> "" Then
                field = Request.QueryString("subcat")
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
            videoModal.Attributes.Item("class") = "modal in"
            videoModal.Style.Add("display", "block")
            myIframe.Attributes.Item("src") = e.CommandArgument
            modelTitle.InnerText = obj.getTitle("videoTable", e.CommandArgument)
        End If
    End Sub

    Public Sub SearchClick() Handles btnSearch.ServerClick
        If searchtxt.Text <> Request.QueryString("cat") & Request.QueryString("subCat") Then
            GridView1.DataSourceID = "ManualSearch_SqlDataSource"
        Else
            Response.Redirect("Video results.aspx")
        End If
    End Sub

    Protected Sub Button1_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        If Session("user") = "" Then
            id01.Style.Add("display", "block")
        Else
            con.Open()
            If e.CommandName = "add" Then
                cmd = New SqlCommand("select * from favorites where email='" & Session("user") & "' and VideoID=" & e.CommandArgument & ";", con)
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                If dr.Read Then
                    Response.Write("<script> alert('Already added to favorites')</script>")
                    con.Close()
                Else
                    con.Close()
                    Insertion(e.CommandArgument)
                End If
            End If
        End If
    End Sub
    Public Sub Insertion(ByVal vID As String)
        Dim insertCmd As String
        Dim fId As Integer = New Random().Next(100, 9000)
        cmd = New SqlCommand("select VideoID from favorites where favoriteID='" & fId & "'", con)
        con.Open()
        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader
        If dr.Read Then
            fId = New Random().Next()
        End If
        con.Close()
        insertCmd = "insert into favorites(VideoID,email,type,favoriteID) values(" & vID & ",'" & Session("user") & "','Video'," & fId.ToString & ");"
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
