<%@ Page Language="VB" AutoEventWireup="false" CodeFile="select type.aspx.vb" Inherits="select_book_type" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select type</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    <link href="css/w3css.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/Custom%20styles.css" rel="stylesheet" type="text/css" />

    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap.min.js" type="text/javascript"></script><script src="customScript.js" type="text/javascript"></script>
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
                        <div id="id01" class="w3-modal">
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
                                  <input type="submit" id="btnlogin" runat="server" onserverclick="Login" class="w3-button w3-block w3-green w3-section w3-padding" value="Login" />
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
    <div class=" container">
        <div class="row">
            <div class="col-xs-12 col-md-5 col-md-offset-4">
                <h2>Select type of Result you want!</h2>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info btn-lg w3-margin">1. Book</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info btn-lg w3-margin">2. Video</asp:LinkButton>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
