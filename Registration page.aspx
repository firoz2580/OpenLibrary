<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Registration page.aspx.vb"
    Inherits="Registration_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Online library - Registration page</title>
    <meta name="Description" content="This is BCA project developed by National Degree College students. This is an Online library with which you can read books online for free and you can also watch videos online. It is developed as a BCA project not as a commercial Website. 
        This project is made by using the MicroSoft Visual Studio, VB.NET code behind and SQL server database
        NOTE: This website is currently in progress, so we have limited no.of books and video. Soon we'll provide a huge Library Project Members - Shaik Firoz Idrees Ahmed Farooq Khan" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.7-dist/bootstrap.min.js" type="text/javascript"></script><script src="customScript.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            $('#FileUpload1').change(function(){
            var filename = $("#FileUpload1").val();
            var ext = filename.replace(/^.*\./, '');

            if (ext == filename){ext = '';}
            else {ext = ext.toLowerCase();}
            
            if(ext=='jpg' | ext=='jpeg' | ext=='png' | ext=='bmp'){
                $('#Button1').prop('disabled', false);
                $('#divErr').hide();
           }
           else{
               $('#Button1').prop('disabled', true);
               $('#divErr').show();
           }
        });
        });
    </script>

    <style type="text/css">
        *, *:before, *:after {
            box-sizing: border-box;
        }
        html {
            overflow-y: none;
        }
        body {
            background: #c1bdba;
            font-family: 'Titillium Web' , sans-serif;
            background: #092756;
            background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
            background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
            background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
            background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
            background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
        }
        .form {
            background: rgba(19, 35, 47, 0.9);
            padding: 40px;
            max-width: 600px;
            margin: 40px auto;
            border-radius: 4px;
            box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
        }
        h1 {
            text-align: center;
            color: #ffffff;
            font-weight: 300;
            margin: 10px 10px 15px 35px;
        }
        input {
            font-size: 22px;
            display: block;
            width: 100%;
            height: 5%;
            padding: 5px 10px;
            background: none;
            background-image: none;
            border: 1px solid #a0b3b0;
            color: #ffffff;
            border-radius: 0;
            -webkit-transition: border-color .25s ease, box-shadow .25s ease;
            transition: border-color .25s ease, box-shadow .25s ease;
        }
        input:focus, textarea:focus {
            outline: 0;
            border-color: #1ab188;
        }
        .field-wrap {
            position: relative;
            margin-bottom: 25px;
        }
        .top-row:after {
            content: "";
            display: table;
            clear: both;
        }
        .top-row > div {
            float: left;
            width: 48%;
            margin-right: 4%;
        }
        .top-row > div:last-child {
            margin: 0;
        }
        .button {
            border: 0;
            outline: none;
            border-radius: 0;
            padding: 15px 0;
            font-size: 2rem;
            font-weight: 600;
            height: 10%;
            text-transform: uppercase;
            letter-spacing: .1em;
            background: #1ab188;
            color: #ffffff;
            -webkit-transition: all 0.5s ease;
            transition: all 0.5s ease;
            -webkit-appearance: none;
        }
        .button:hover, .button:focus {
            background: #179b77;
        }
        .button-block {
            display: block;
            width: 100%;
        }
        .logo {
            border: 0;
            outline: none;
            border-radius: 0;
            padding-top: 4px;
            padding-left: 30px;
            padding-right: 0px;
            padding-bottom: 5px;
            font-size: 1.7rem;
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
            padding-bottom: 0x;
        }
        p {
            font-size: 22px;
            color: #ddd;
            margin-bottom: 10px;
        }
        #pwd {
            margin-bottom: 10px;
        }
        center {
            display: none;
        }
        a {
            display: none;
        }
        li a {
            display: inline;
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
    <h1 style="display: none;">
        This is BCA project developed by National Degree College students. This is an Online
        library with which you can read books online for free and you can also watch videos
        online. It is developed as a BCA project not as a commercial Website. This project
        is made by using the MicroSoft Visual Studio, VB.NET code behind and SQL server
        database NOTE: This website is currently in progress, so we have limited no.of books
        and video. Soon we'll provide a huge Library Project Members Shaik Firoz Idrees
        Ahmed Farooq Khan</h1>
    <div class="form">
        <div id="signup">
            <h1>Sign Up for Free</h1>
        </div>
        <div class="top-row">
            <div class="field-wrap">
                <input type="text" name="fname" placeholder="First name *" required autocomplete="off" />
            </div>
            <div class="field-wrap">
                <input type="text" name="lname" placeholder="Last name *" required autocomplete="off" />
            </div>
        </div>
        <div class="field-wrap">
            <input type="email" name="email" placeholder="Email Address *" required autocomplete="on" />
        </div>
        <div class="field-wrap" id="pwd">
            <input type="password" name="pword" placeholder="Set A Password *" required autocomplete="off" />
        </div>
        <p align="center"><u>Choose a profile picture</u></p>
        <div class="field-wrap">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div id="divErr" runat="server" style="display: none;">
             <p class="alert alert-danger" runat="server" id="msgErr">Please select a picture file (only .jpg .jpeg .png .bmp types are allowed).</p>
        </div>
        <asp:Button ID="Button1" runat="server" class="button" Text="Get Started" />
        <br />
    </div>
    </form>
</body>
</html>
