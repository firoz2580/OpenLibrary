<%@ Page Language="VB" AutoEventWireup="false" CodeFile="About.aspx.vb" Inherits="About" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    
    <link rel="Stylesheet" href="css\About page StyleSheet.css" />
    <link href="css/w3css.css" rel="stylesheet" type="text/css" />
    <link href="css/Custom%20styles.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap.min.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>

    <script src="customScript.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
        //    var mouseX, mouseY;
        //$('.site-logo img').mousemove(function(e) {
        //    mouseX = e.pageX-50;
        //    mouseY = e.pageY-50;
        //    $('#college2').css({'left':mouseX,'top':mouseY});
        //});
        $('#imgLogo').popover({delay:{show:000, hide:300}});
        $('#spanImg').popover({delay:{show:000, hide:300}});
        
        });
    </script>
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
					<li class="active"><a href="About.aspx" ><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
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
    <section id="info">
   	<div class="row">
   		<div class="col-twelve"><h2 class="h01">About Website</h2></div>   		
   	</div>   	
      <div class="row flex-container">
         <div id="info-flex">
               	<div class="site-logo ">
                    	<img src="img/open_library.png" alt="Image" id="imgLogo" title="<p style='font-size: 1.9rem;' class='text-center'><u>SAI KUMAR</u><br /><small>Head of the computer department</small></p>" data-content="<img alt='Image' id='Img1' class='img-responsive img-rounded' src='img/sai sir.JPG' />" data-html="true" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-animation="true"  />
                    	<div class="site-info">
                    		Open Library <small>v2.1</small>
                    		<span id="spanImg" title="<p style='font-size: 1.9rem;' class='text-center'><u>Imtiyaz Ahamed</u><br /><small>Principal</small></p>" data-content="<img alt=''Image' id='imgpopover' class='img-responsive img-rounded' src='img/intiyaz sir.JPG' />" data-html="true" data-trigger="hover" data-toggle="popover" data-placement="bottom">National Degree College,Nandyal </span>
                    	</div>
                </div>
                  <p id="par">This is an <u>ASP.NET</u> web application developed by National Degree College students. 
                  This web application is an Online library. The concept is about to provide books and videos virtually on the web browser. This website is developed for BCA project, it is not a commercial Website.</p>
                  <p id="par">This project is made by using the <u>MicroSoft Visual Studio</u>, <u>VB.NET</u> code behind and <u>MS SQL server</u> to store and retrive database. We have used <u>JQuery</u> and <u>Bootstrap</u> framework for responsive styling in all devices like desktops, tablets and mobiles.</p>
                  <p id="par"><font>NOTE:</font> This website is currently in progress, so we have limited no.of books and video. Soon we'll provide a huge content.</p>
             	</div>       
      </div>
    <div class="members">
    <h2 style="font-size:2.5rem;">Project Members</h2>
        <p><i style="font-size:2.9rem;"><a href="https://www.facebook.com/firoz2580" target="_blank" style="display:inline; color:green;">Shaik Firoz</a><iframe id="fir" src="https://www.facebook.com/plugins/follow.php?href=https%3A%2F%2Fwww.facebook.com%2Ffiroz2580&width=64&height=20&layout=button&size=small&show_faces=true&appId" width="64" height="20" style="border:none;overflow:hidden; left:14px;" scrolling="no" frameborder="0" allowTransparency="true"></iframe></i></p>
        <p><i style="font-size:2.9rem;"><a href="https://www.facebook.com/idreesahamad" target="_blank" style="display:inline; color:green;">Idrees Ahmed</a><iframe id="idr" src="https://www.facebook.com/plugins/follow.php?href=https%3A%2F%2Fwww.facebook.com%2Fidreesahamad&width=64&height=20&layout=button&size=small&show_faces=true&appId" width="64" height="20" style="border:none;overflow:hidden;" scrolling="no" frameborder="0" allowTransparency="true"></iframe></i></p>
        <p style=" padding-bottom:20px;"><i style="font-size:2.9rem;"><a href="https://www.facebook.com/profile.php?id=100004784595655" target="_blank" style="display:inline; color:green;">Farooq Khan</a><iframe id="far" src="https://www.facebook.com/plugins/follow.php?href=https%3A%2F%2Fwww.facebook.com%2Ffiroz2580&width=64&height=20&layout=button&size=small&show_faces=true&appId" width="64" height="20" style="border:none;overflow:hidden;left:1px;" scrolling="no" frameborder="0" allowTransparency="true"></iframe></i></p>
    </div>
    <h2>National Degree College Facebook Page</h2>
    <iframe id="page" src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FNational-Degree-College-Nandyal%2F129832817057588&width=450&layout=standard&action=like&size=large&show_faces=true&share=true&height=80&appId" width="450" height="80" style="border:none;overflow:hidden; top:10px; left:15px;" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
   </section>
</form>
</body>
</html>
