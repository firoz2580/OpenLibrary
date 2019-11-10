<%@ Page Language="VB" AutoEventWireup="false" CodeFile="errorpage.aspx.vb" Inherits="errorpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="img/school-20book-20clipart-school-books-clipart.ico" />
    <link href="bootstrap-3.3.7-dist/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <br /><br />
        <p class="alert alert-danger">
            <b>Something went wrong! This request can't beprocessed.</b><br />
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
        <br />
        <a href="index.aspx">Home</a>
    </div>
    </form>
</body>
</html>
