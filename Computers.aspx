<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Computers.aspx.vb" Inherits="Computers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Computers</title>
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
		<h1 class="logoH1"> Open Library </h1>
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
                                  <button id="btnlogin" runat="server" onserverclick="Login" class="w3-button w3-block w3-green w3-section w3-padding">Login</button> 
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
            <div class="col-xs-6 col-md-3">
                <div class="top-part">
                    <img src="img/grid%20pics/programming.jpg" alt="Programming" class="img-responsive center-block" />
                    <h2 class="">Programming</h2>
                </div>
                <div class="bottom-part">
                    <ul class="features">
                        <li><a href="select type.aspx?cat=fundamentals"><strong>C</strong></a></li>
                        <li><a href="select type.aspx?cat=programming"><strong>C++</strong></a></li>
                        <li><a href="select type.aspx?cat=database"><strong>Java</strong></a></li>
                        <li><a href="select type.aspx?cat=web"><strong>Python</strong></a></li>
                    </ul>
                    <a class="w3-btn w3-margin-bottom btn-lg w3-orange" href="select type.aspx?cat=Programming">See more</a>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="top-part">
                    <img src="img/grid%20pics/database.png" alt="Database" class="img-responsive center-block" />
                    <h2 class="">Databases</h2>
                </div>
                <div class="bottom-part">
                    <ul class="features">
                        <li><a href="select type.aspx?subCat=horror"><strong>SQL</strong></a></li>
                        <li><a href="select type.aspx?subCat=love"><strong>PL\SQL</strong></a></li>
                        <li><a href="select type.aspx?subcat=crime"><strong>MS Access</strong></a></li>
                        <li><a href="select type.aspx?subcat=fairy"><strong>MongoDB</strong></a></li>
                    </ul>
                    <a class="w3-btn w3-margin-bottom btn-lg w3-orange" href="select type.aspx?cat=Database">See more</a>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div   class="top-part">
                    <img src="img/grid%20pics/fundamentals.jpg" alt="Fundamentals" class="img-responsive center-block" />
                    <h2 class="">Fundamentals</h2>
                </div>
                <div class="bottom-part ">
                    <ul class="features">
                        <li><a href="select type.aspx?subcat=painting"><strong>Basics</strong></a></li>
                        <li><a href="select type.aspx?subcat=stories"><strong>Computer History</strong></a></li>
                        <li><a href="select type.aspx?subcat=animals"><strong>Storages</strong></a></li>
                        <li><a href="select type.aspx?subcat=comics"><strong>Processors</strong></a></li>
                    </ul>
                    <a class="w3-btn w3-margin-bottom btn-lg w3-orange" href="select type.aspx?cat=Fundamentals">See more</a>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div   class="top-part">
                    <img src="img/grid%20pics/web.png" alt="Web Technologies" class="img-responsive center-block" />
                    <h2 class="">Web Technologies</h2>
                </div>
                <div class="bottom-part">
                    <ul class="features">
                        <li><a href="select type.aspx?subcat=cricket"><strong>HTML</strong></a></li>
                        <li><a href="select type.aspx?subcat=soccer"><strong>CSS</strong></a></li>
                        <li><a href="select type.aspx?subcat=tennis"><strong>Java Script</strong></a></li>
                        <li><a href="select type.aspx?subcat=hockey"><strong>ASP.NET</strong></a></li>
                    </ul>
                    <a class="w3-btn w3-margin-bottom btn-lg w3-orange" href="select type.aspx?cat=Web">See more</a>
                </div>
            </div>
        </div>
        </div>
    </form>
   </body>
</html>
