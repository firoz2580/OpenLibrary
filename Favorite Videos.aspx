<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Favorite Videos.aspx.vb"
    Inherits="Favorite_Videos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Favorite Videos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    <link href="css/w3css.css" rel="stylesheet" type="text/css" />
    <link href="css/Custom%20styles.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap.min.js" type="text/javascript"></script><script src="customScript.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
       $("#btnmdlClose").click(function(){
           $('#videoModal').hide();
           $('#myIframe').removeAttr( "src" );
       });
       $('.modal-content, .modal-body, #myIframe').css({"minHeight": "360px", "minWidth": "280px"});
       $('.modal-content').resizable({
         alsoResize: ".modal-body",
         containment: "document",
         grid: [ 20, 10 ],
         minHeight: 360,
         minWidth: 280
        });
        $('.modal-dialog').draggable();
    });
    </script>
    
<style type="text/css">
    .modal-content, .modal-body, #myIframe {
        min-width: 300px;
        min-height: 300px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
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
					<li><a href="Book results.aspx" ><span class="glyphicon glyphicon-book"></span> Search a book</a></li>
					<li><a href="Video results.aspx" ><span class="glyphicon glyphicon-film"></span> Search a Video</a></li>
					<li class="dropdown active">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button"><span class="glyphicon glyphicon-heart"></span> Favorites<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Favorite Books.aspx">Books</a></li>
                                <li class="active"><a href="Favorite Videos.aspx">Videos</a></li>
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
                                <form defaultbutton="btnlogin">
                                  <label><b>Username</b></label>
                                  <input id="username" class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="usrname" required />
                                  <label><b>Password</b></label>
                                  <input id="pass" class="w3-input w3-border" type="text" placeholder="Enter Password" name="psw" required />
                                  <asp:Button id="btnlogin" runat="server" OnClick="Login" class="w3-button w3-block w3-green w3-section w3-padding" Text="Login"></asp:Button> 
                                  <div runat="server" id="progress" class="progress progress-bar-info progress-striped w3-margin-top active" style="display:none;"><div class="progress-bar"style="width:100%;">Please wait...</div></div>
                                  </form>
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
    <div runat="server" id="divRow">
        <div class="w3-large alert alert-info text-center">
            <p>You are not logged in! <a href="#" onclick="$('#id01').css('display','block');">click here</a> to log in.</p>
        </div>
    </div>
    <div class="container" runat="server" id="mainContainer">
        <div class="row">
            <div class=" col-md-4 col-md-offset-4 ">
                <h1 class="text-center" style="color: #1cbdba;">
                    Search results</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="table-responsive img-rounded ">
                    <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True" EnableTheming="True"
                        UseAccessibleHeader="False" EnableViewState="False" CellPadding="2" BackColor="LightGoldenrodYellow"
                        BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
                        <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
                        <Columns>
                            <asp:TemplateField HeaderText="<u>Video Name</u>" SortExpression="bname">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="aspnetForm.target='_blank';"
                                        CommandArgument='<%# Eval("videoLink") %>' CommandName="view" Text='<%# Eval("VideoTitle  ") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Font-Underline="False" HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="cat" HeaderText="Category" SortExpression="cat" ConvertEmptyStringToNull="False">
                                <HeaderStyle Font-Underline="False"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="subCat" HeaderText="Book about" SortExpression="subCat" />
                            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                            <asp:TemplateField HeaderText="Favorite">
                                <ItemTemplate><%--
                                    <asp:Button ID="Button1" runat="server" CssClass="btn w3-button btn-primary " CommandArgument='<%# Eval("VideoID") %>'
                                        CommandName="remove" OnCommand="Button1_Command" Text="Remove" />--%>
                                    <asp:ImageButton ID="Button1" runat="server" CssClass="img-responsive" Style="height: 32px;"
                                        CommandArgument='<%# Eval("VideoID") %>' CommandName="remove" OnCommand="Button1_Command"
                                        ImageUrl="img/op_favorite_remove.png" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:firozLibraryDB %>"
            SelectCommand="SELECT VideoTable.VideoID, VideoTable.VideoTitle, VideoTable.Channel, VideoTable.cat, VideoTable.subCat, VideoTable.videoLink, VideoTable.type FROM VideoTable INNER JOIN favorites ON VideoTable.VideoID = favorites.VideoID INNER JOIN userAccounts ON favorites.email = userAccounts.email WHERE (userAccounts.email LIKE '%' + @ses_user + '%')">
            <SelectParameters>
                <asp:SessionParameter Name="ses_user" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="modal" id="videoModal" runat="server" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <img id="btnmdlClose" src="img\op_exit.png" class="img-responsive" alt="X" style="float: right;
                        height: 38px; width: 38px;" />
                    <h4 class="modal-title" runat="server" id="modelTitle"> </h4>
                </div>
                <div class="modal-body img-responsive container">
                    <iframe id="myIframe" class="col-xs-12 img-responsive" style="height: inherit;" runat="server"
                        frameborder="0" scrolling="no" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
