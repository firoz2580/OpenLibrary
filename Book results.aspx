<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Book results.aspx.vb" Inherits="Book_results" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Results</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    <link href="css/w3css.css" rel="stylesheet" type="text/css" />
    <link href="css/Custom%20styles.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap.min.js" type="text/javascript"></script><script src="customScript.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
        $("#btnmdlClose").click(function(){
            $('#bookModal').hide();
            $('#myIframe').removeAttr( "src" );
        });
        $('.modal-content, .modal-body, #myIframe').css({"minHeight": "520px", "minWidth": "300px"});
        
        $('.modal-content').resizable({
            alsoResize: ".modal-body",
            containment: "document",
            grid: [ 20, 10 ],
            minHeight: 520,
            minWidth: 300
        });
        $('.modal-dialog').draggable();
        $("#searchtxt").keypress(function (e){
            if (e.which == 13) {
            e.preventDefault();
            __doPostBack('btnSearch','')
            };
        });
    });
    </script>
<style type="text/css">
    .modal-content, .modal-body, #myIframe {
        min-width: 300px;
        min-height: 560px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="searchtxt">
    <div class="logo">
        <h1 class="logoH1">
            Open Library
        </h1>
    </div>
    <nav class="navbar navbar-default">
    		<div class="navbar-header">
    		    <button class="navbar-toggle" type="button" data-target="#mainNavbar" data-toggle="collapse">Menu</button>
    		</div>
    		<div class="navbar-collapse collapse" id="mainNavbar">
    		    <ul class="nav navbar-nav navbar-right ">
					<li><a href="index.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li class="active"><a href="Book results.aspx" ><span class="glyphicon glyphicon-book"></span> Search a book</a></li>
					<li><a href="Video results.aspx" ><span class="glyphicon glyphicon-film"></span> Search a Video</a></li>
					<li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"><span class="glyphicon glyphicon-heart"></span> Favorites<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Favorite Books.aspx">Books</a></li>
                                <li><a href="Favorite Videos.aspx">Videos</a></li>
                            </ul>
                        </li>
					<li><a href="my account.aspx" ><span class="glyphicon glyphicon-user"></span> My Account</a></li>
					<li><a href="About.aspx" ><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
					<li runat="server" id="w3login"><input type="button" runat="server" name="btnLogOut" onserverclick="Logout" value="Logout" id="btnLogOut" class="w3-button btn w3-green w3-large w3-margin-right" />
					<div runat="server" id="divContainer" class="w3-container">
                        <input onclick="document.getElementById('id01').style.display='block'" class="w3-button btn w3-green w3-large" type="button" value="Login" />
                        <div id="id01" runat="server" class="w3-modal">
                            <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
                                <div class="w3-center"><br />
                                    <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
                                    <img src="img\img_avatar3.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top" />
                                </div>
                                <div class="w3-container">
                                <div class="w3-section">
                                  <label><b>Username</b></label>
                                  <input id="username" class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="usrname" required />
                                  <label><b>Password</b></label>
                                  <input id="pass" class="w3-input w3-border" type="password" placeholder="Enter Password" name="psw" required />
                                  <asp:Button id="btnlogin" runat="server" OnClick="Login" class="w3-button w3-block w3-green w3-section w3-padding" Text="Login"></asp:Button> 
                                  <div runat="server" id="progress" class="progress progress-bar-info progress-striped w3-margin-top active" style="display:none;"><div class="progress-bar"style="width:100%;">Please wait...</div></div>
                                </div>
                                </div>
                                  <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                    <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red btn btn-lg">Cancel</button>
                                    <span class="w3-right"><a class="btn btn-lg w3-blue" href="Registration page.aspx">Sign up</a></span>
                                  </div>
                            </div>
                        </div>
                     </div></li>
				  </ul>
        </div>
	</nav>
    <div class="container">
        <div class="row">
            <div class=" col-xs-10 col-xs-offset-2 col-md-3 col-md-offset-9 ">
                <div class="input-group">
                    <asp:TextBox ID="searchtxt" runat="server" CssClass="form-control"
                        placeholder="Enter Book Name"></asp:TextBox>
                    <div class="input-group-btn">
                        <button type="submit" style="height: 34px;" id="btnSearch" class="btn btn-info" runat="server"
                            onserverclick="SearchClick">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" col-md-4 col-md-offset-4 ">
               <div class="alert alert-info alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>New!</strong> <a href="Books.htm" class="alert-link"> Try the new version of this page</a>
               </div>
                <h1 class="text-center " style="color: #1cbdba;">Search results</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="table-responsive img-rounded ">
                    <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False"
                        DataSourceID="AllBooks_SqlDataSource" AllowSorting="True" AllowPaging="True"
                        UseAccessibleHeader="False" EnableViewState="False" CellPadding="2" BackColor="LightGoldenrodYellow"
                        BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
                        <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
                        <Columns>
                            <asp:TemplateField HeaderText="<u>Book Name</u>" SortExpression="bname">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="aspnetForm.target='_blank';"
                                        CommandArgument='<%# Eval("filepath") %>' CommandName="view" Text='<%# Eval("bname") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Font-Underline="False" HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="authorName" HeaderText="Author Name" SortExpression="authorName"
                                HeaderStyle-Font-Underline="false" ConvertEmptyStringToNull="False">
                                <HeaderStyle Font-Underline="False"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="cat" HeaderText="Category" SortExpression="cat" ConvertEmptyStringToNull="False">
                                <HeaderStyle Font-Underline="False"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="subCat" HeaderText="Book about" SortExpression="subCat"
                                HeaderStyle-Wrap="False">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Favorites">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Button1" runat="server" CssClass="img-responsive" Style="height: 32px;"
                                        CommandArgument='<%# Eval("BookID") %>' CommandName="add" OnCommand="Button1_Command"
                                        ImageUrl="img/op_favorite_add.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <PagerStyle Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="AllBooks_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:firozLibraryDB %>"
            SelectCommand="SELECT * FROM [BooksTable]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ByCat_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:firozLibraryDB %>"
            SelectCommand="SELECT BookID, bname, authorName, cat, subCat, filepath, type FROM BooksTable WHERE ([cat] = @cat)">
            <SelectParameters>
                <asp:ControlParameter ControlID="searchtxt" Name="cat" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BySubCat_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:firozLibraryDB %>"
            SelectCommand="SELECT * FROM [BooksTable] WHERE ([subCat] = @subCat)">
            <SelectParameters>
                <asp:ControlParameter ControlID="searchtxt" Name="subCat" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ManualSearch_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:firozLibraryDB %>"
            SelectCommand="SELECT BookID, bname, authorName, cat, subCat, filepath, type FROM BooksTable WHERE (bname LIKE '%' + @bname + '%') OR (authorName LIKE '%' + @authorName + '%') OR (cat LIKE '%' + @cat + '%') OR (subCat LIKE '%' + @subCat + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="searchtxt" Name="bname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="searchtxt" Name="authorName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="searchtxt" Name="cat" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="searchtxt" Name="subCat" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="modal" id="bookModal" runat="server" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <img id="btnmdlClose" src="img\op_exit.png" class="img-responsive" alt="X" style="float: right;
                            height: 38px; width: 38px;" />
                        <h4 class="modal-title" runat="server" id="modelTitle"></h4>
                    </div>
                    <div class="modal-body img-responsive container">
                        <iframe id="myIframe" class="col-xs-12 img-responsive" style="height: inherit;" runat="server"
                            frameborder="0" scrolling="yes" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
