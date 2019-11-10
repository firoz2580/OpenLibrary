<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Book Viewer.aspx.vb" Inherits="Book_Viewer" ValidateRequest="True" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Viewer</title> 
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico">
    <link rel="Stylesheet" href="css/main.css" />
    <link rel="Stylesheet" href="css/base.css" />
<style>
    .book {
    position:relative;
    top:2px;
    left:16%;
    width:860px;
    height:720px;
}
.book iframe
{
	margin:0px;
    height:99.5%;
    width:100%;
}
.book .book-file {
    position:inherit;
    margin:1px;
    height:105%;
    width:100%;
    top:2px;
    left:4px;
}
.video-container .video-file {
    position:inherit;
    width:100%;
    height:100%;
    left:0px;
    top:0px;
}
.video-container {
    width:63%;
    height:440px;
    position:relative;
    top:120px;
    left:18%;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" class="book" id="bookId">
            <iframe id="myIframe" runat="server" frameborder="0" scrolling="yes"></iframe>
        </div>
    </form>
</body>
</html>
        
