<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LogIn page.aspx.vb" Inherits="_Default" AspCompat="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="google-site-verification" content="cE7Da8dsmISQhnFuwScbOJ1-ClnnidMAtsl1YUjp1E0" />
  <meta name="Description" content="This is BCA project developed by National Degree College students. This is an Online library with which you can read books online for free and you can also watch videos online. It is developed as a BCA project not as a commercial Website. This project is made by using the MicroSoft Visual Studio, VB.NET code behind and SQL server database. NOTE: This website is currently in progress, so we have limited no.of books and video. Soon we'll provide a huge Library. Project Members Shaik Firoz Idrees Ahmed Farooq Khan" />
  <meta name="keywords" content="National degree college, Nandyal, BCA, Project, BCA project, BCA Degree Project, Library project, Degree Project, Rayalaseema University, RU Project" />
  <title>Open Library - Log In</title>
  <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
<style type="text/css">
.btn {
	display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5;     background-repeat: repeat-x;
    border: 1px solid #e6e6e6;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    cursor: pointer;
    margin-left: 0em;
    background-image: linear-gradient(top, #ffffff, #e6e6e6);
}
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] 
{
	box-shadow: inset 0 40px 0 0 rgba(20, 196, 148, 1);
}
.btn-large 
{
	padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px;
}
.btn:hover  {
	color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear;
}
.btn-primary, .btn-primary:hover {
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; 
}
.btn-primary.active  {
	color: rgba(255, 255, 255, 0.75); 
}
.btn-primary {
	background-color: #4a77d4;
	background-repeat: repeat-x;
    border: 1px solid #3762bc;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5);
    background-image: linear-gradient(top, #6eb6de, #4a77d4);
    }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] {
	filter: none; background-color: #4a77d4; 
}
.btn-block {
	width: 100%; display:block; 
}
* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }
html { width: 100%; height:100%; overflow:hidden; }
body { 
	width: 100%;
	height:100%;
	font-family: 'Open Sans', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
.login { 
	margin: 2% 0 0 37%;
	width:300px;
	height:319px;
}
.login h1{
	color: #ffffff;
	text-shadow: 0 0 10px rgba(0,0,0,0.3);
	letter-spacing:1px;
	font-weight: 500;
    margin: 10px 0px 36px 0px;
    height: 23px;
}
input { 
	width: 100%; 
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
	-webkit-transition: box-shadow .5s ease;
	-moz-transition: box-shadow .5s ease;
	-o-transition: box-shadow .5s ease;
	-ms-transition: box-shadow .5s ease;
	transition: box-shadow .5s ease;
}
input:focus {
	 box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); 
}
.logo {
    border: 0;
    outline: none;
    border-radius: 0;
    padding-top:5px ;
    padding-left:30px ;
    padding-right:0px ;
    padding-bottom: 5px ;
    font-size: 3rem;
    font-weight: 600;
    text-transform: uppercase;
    background: #1ab188;
    color: #ffffff;
    -webkit-transition: all 0.9s ease;
    transition: all 0.9s ease;
    -webkit-appearance: none;
}
.logoH1 {
    letter-spacing: 15px;
    padding-top: 15px;
}
h1 {
    text-align: center;
    color: #ffffff;
    font-weight: 300;
    margin: 10px 10px 15px 35px;
}
center { display:none;}
a {display:none;}
li a{display:inline;}
.new {display:inline;}
.regLink, reqLink:visited {
    display:block;
	color: #0397cc;
	font-size:18px;
    padding-left:60px;
    padding-top:23px;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-webkit-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
a:hover, a:focus {
	color: #ff7b29;
}
</style>
</head>
<body>
    <form id="form1" class="login-form" runat="server">
   <div class="logo">
		<h1 class="logoH1"> Open Library </h1>
	</div>
	<h1 style="display:none;">This is BCA project developed by National Degree College students. This is an Online library with which you can read books online for free and you can also watch videos online. It is developed as a BCA project not as a commercial Website. 
This project is made by using the MicroSoft Visual Studio, VB.NET code behind and SQL server database
NOTE: This website is currently in progress, so we have limited no.of books and video. Soon we'll provide a huge Library
Project Members
Shaik Firoz
Idrees Ahmed
Farooq Khan</h1>
	 <div class="login">
        <h1>Login to library</h1>
	    <input type="text" name="e" placeholder="Enter E-mail ID" runat="server" id="name" required="required" />
        <input type="password" name="p" placeholder="Password"  runat="server" id="password" required="required" />
        <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" Text="LogIn" />
        <a href="Registration page.aspx" class="regLink">Create a new account</a>
        <a href="index.aspx" class="regLink">Guest login</a>
    </div>
</form>
</body>
</html>