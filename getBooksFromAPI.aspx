<%@ Page Language="VB" AutoEventWireup="false" CodeFile="getBooksFromAPI.aspx.vb" Inherits="getBooksFromAPI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get Books from API</title>

    <script src="jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        var accKey = "AIzaSyAaXcSLhBfuJFKGhgL3K25DbrvkAxqrKyU";
        $(function () {
            var att = 0, txtTerm = 'world', startInx = 0;
            //    var lodng=$('#loading'),list=$('#bList'),frm=$('#Iframe1'),BK=$('#bk'),btnmore=$('#btnMore'),btnInfo=$('#Binfo');
            func = function () {
                att++;
                $.ajaxSetup({ retryAfter: 200 });
                $.ajax({
                    url: "https://www.googleapis.com/books/v1/volumes",
                    type: 'get',
                    dataType: 'json',
                    data: "q=" + txtTerm + "&maxResults=40&orderBy=relevance&fields=items(id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/categories,volumeInfo/averageRating)",
                    beforeSend: function(){ console.log('sending ' + txtTerm); },
                    complete: function () { },
                    success: function (data) {
                        //console.log(data);
                        for (i = 0; i < data.items.length; i++) {
                            var dID = data.items[i].id, avg = "";
                            try { avg = data.items[i].volumeInfo.averageRating; }
                            catch (e) { avg = "" }
                            var di = data.items[i].volumeInfo;
                            $.ajax({
                                url: 'APIwebservice.asmx/GetId',
                                method: 'post',
                                //contentType:'application/json;charset=utf-8',
                                data: 'id=' + dID + '&title=' + di.title + '&subtitle=' + di.subtitle + '&authors=' + di.authors + '&cat=' + di.categories + '&avg=' + avg,
                                success: function () { console.log('success ' + dID); },
                                error: function (e) { console.log('error ' + dID + ' ' + e.status); }
                            });

                            //                $.ajax({
                            //                    url:'https://www.googleapis.com/books/v1/volumes/'+dID,
                            //                    type:'get',
                            //                    dataType:'json',
                            //                    data:'fields=id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/categories',
                            //                    success:function(data2){
                            //                    var allColsObj={
                            //                        id:data2.id,
                            //                        title:data2.volumeInfo.title,
                            //                        subtitle:data2.volumeInfo.subtitle,
                            //                        authors:data2.volumeInfo.authors,
                            //                        cat:data2.volumeInfo.categories
                            //                        };
                            //                        $.ajax({
                            //                        url:'APIwebservice.asmx/insertion',
                            //                        method:'post',
                            //                        contentType:'application/json;charset=utf-8',
                            //                        data:'{obj:'+JSON.stringify(allColsObj)+'}',
                            //                        success:function(){console.log('success '+dID);},
                            //                        error:function(e){console.log('error '+dID+' '+e.status);}
                            //                        });
                            //                     }
                            //            });
                        }
                    },
                    error: function (e) {
                        if (att < 5) {
                            console.log(att);
                            setTimeout('func()', $.ajaxSetup().retryAfter);
                        }
                        else {
                            var err = "<div class='alert alert-danger'><p class='alert-text'>Something went wrong. Request can't be processed.</p></div>";
                            $(document).html(err);
                        }
                    }   
        });//end ajax
        }//end func
        //func();
        $('#btnSrc').click(function () {
            txtTerm = $('#txtSrc').val();
            func();
        });
        $("#txtSrc").keypress(function (e) {
            if (e.which == 13) {
                e.preventDefault();
                txtTerm = $('#txtSrc').val();
                func();
                $('#txtSrc').val("");
            }
        });

        });//load
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 70px">
            <input type="text" id="txtSrc" />
            <%--<button id="btnSrc" value="Button" >button</button>--%>
            <button type="button" id="btnSrc">Button</button>
        </div>
    </form>
</body>
</html>
