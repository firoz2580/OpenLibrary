$(function () {
    var att = 0, txtTerm = 'java', startInx = 0;
    var lodng = $('#loading'), list = $('#bList'), frm = $('#Iframe1'), BK = $('#bk'), btnmore = $('#btnMore'), btnInfo = $('#Binfo');
    checkSession();
    func = function () {
        att++;
        $.ajaxSetup({ retryAfter: 200 });
        $.ajax({
            url: "APIgetBooks.aspx",
            method: 'get',
            data: 'disLen=8&disStart=' + startInx + '&sortCol=1&sortDir=asc&search=' + txtTerm,
            dataType: 'json',
            beforeSend: function () { btnmore.hide(); lodng.show(); },
            complete: function () { lodng.hide(); btnmore.show(); },
            success: function (data) {
                //list.empty();
                console.log('Success: ');
                console.log(data);
                for (i = 0; i < data.length; i++) {
                    if (data) {
                        var d = data[i], thumb, BooksDOM = '';
                        try { thumb = "http://books.google.com/books/content?id=" + d.id + "&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"; }
                        catch (ex) { thumb = "img/\NoImage.jpg" }
                        BooksDOM += '<div class="card">';
                        BooksDOM += '<img class="card-img-top" src="' + thumb + '" id="' + d.id + '" onmouseover="GetImg(\'' + d.id + '\')" onload="GetImg(\'' + d.id + '\')" alt="Card image cap">';
                        BooksDOM += '<div class="card-body">';
                        BooksDOM += '<blockquote class="blockquote mb-0">'
                        BooksDOM += '<p title="' + d.title + '">' + d.title.substring(0, 40) + '</p>';
                        if (d.authors != undefined)
                            BooksDOM += '<footer class="blockquote-footer">' + d.authors + '</footer></blockquote>';
                        if (d.cat != undefined)
                            BooksDOM += '</div><div class="cat">';
                        if (d.avg != "")
                            BooksDOM += '<span class="text-success" style="margin-right:90px;"><i class="fa fa-star" aria-hidden="true"></i>&nbsp;' + d.avg + ' </span>';
                        BooksDOM += '<span>In -<i>' + d.cat + '</i></span></div><div class="card-footer text-right">';
                        BooksDOM += '<button onclick="view(\'' + d.id + '\',\'' + d.title + '\')" class="btn btn-sm btn-primary">Read</button>&nbsp;';
                        BooksDOM += '<span id="Binfo" onclick="info(\'' + d.id + '\')" class="btn btn-sm btn-info fa fa-info"></span>';
                        BooksDOM += '</div></div>';
                        list.append(BooksDOM);
                    }
                    cardCounter();
                }
            },
            error: function (e) {
                console.log('error: ');
                console.log(e);
                if (att < 5) {
                    console.log(att);
                    setTimeout('func()', $.ajaxSetup().retryAfter);
                }
                else {
                    var err = "<div class='alert alert-danger'><p class='alert-text'>Something went wrong. Request can't be processed.<br />Try later!</p></div>";
                    $('#Bcontainer').html(err).css('margin-top', '20px');
                    $('#loaderDiv').css('display', 'none');
                }
            }
        });//end ajax
       
        $.ajax({
            url: "https://www.googleapis.com/books/v1/volumes",
            type: 'get',
            dataType: 'json',
            data: "q=" + txtTerm + "&maxResults=40&orderBy=relevance&fields=items(id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/categories,volumeInfo/averageRating)",
            beforeSend: function () { console.log('sending ' + txtTerm); },
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
                }
            },
            error: function (e) {
                console.log(e);
                }
            }
        });//end ajax
    }//end func
    func();
    function showMore() {
        startInx += 8;
        lodng.show();
        setTimeout('func()', 1000);
    }
    btnmore.click(function () { showMore() });
    $(window).scroll(function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            showMore();
        }
    });

    $("#txtSrc").autocomplete({
        source: function (req, res) {
            $.ajax({
                url: "https://www.googleapis.com/books/v1/volumes",
                method: 'get',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "q=" + req.term + "&maxResults=4&orderBy=newest&fields=items(volumeInfo/title)",
                success: function (data) {
                    var txt = {};
                    $(data.items).each(function (i) {
                        txt[i] = data.items[i].volumeInfo.title;
                    });
                    res(txt);
                }
            });
        }
    });

    $('#btnSrc').click(function () {
        txtTerm = $('#txtSrc').val();
        list.empty();
        func();
    });
    $('#txtSrc').keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
            txtTerm = $('#txtSrc').val();
            list.empty();
            func();
        }
    });
    BK.dialog({
        modal: true,
        autoOpen: false,
        height: $(window).height() - 50,
        width: $(window).width() - 50,
        fadeOut: window,
        position: { my: "left+20 top+10", at: "left top", of: window },
        resizable: { containment: "document" },
        classes: { "ui-dialog": "img-responsive" },
        close: function (event, ui) { $('#Iframe1').attr('src', ''); }
    });

    BK.on("dialogresizestop", function (ev, ui) {
        frm.css({ 'height': ui.size.height, 'width': ui.size.width });
    });
    $('#btnlogin').click(function () { funLogin($('#username').val(), $('#pass').val()) });
    $('#btnLogOut').click(function () { funLogOut() });
});//load
function funLogin(u, p) {
    $.ajax({
        url: "APIgetBooks.aspx",
        data: 'q=login&one=' + u + '&two=' + p,
        method: 'get',
        dataType: 'json',
        beforeSend: function () { $("#loaderDiv").show(); },
        complete: function () { $("#loaderDiv").hide() },
        success: function (d) {
            console.log(d)
            $('#LoaderModal').modal('hide');
            if (d.Auth == "success") {
                $('#id01').hide();
                $('#w3btnToggle').hide();
                $('#btnLogOut').show();
            }
            else {
                $('#w3btnToggle').show();
                $('#btnLogOut').hide();
            }
        },
        error: function (d) {
            console.log(d);

        }
    });
}
function funLogOut() {
    $.ajax({
        url: "APIgetBooks.aspx",
        data: 'q=logout',
        method: 'get',
        dataType: 'text',
        beforeSend: function () { },
        complete: function () { },
        success: function (d) {
            console.log(d)
            if (d == "done") {
                $('#w3btnToggle').show();
                $('#btnLogOut').hide();
            }
            else {
                $('#w3btnToggle').hide();
                $('#btnLogOut').show();
            }
        },
        error: function (d) {
            console.log(d);
        }
    });
}
function checkSession() {
    $.ajax({
        url: "APIgetBooks.aspx",
        data: 'q=checkSession',
        method: 'get',
        dataType: 'text',
        beforeSend: function () { },
        complete: function () { },
        success: function (d) {
            console.log(d)
            if (d == "True") {
                $('#w3btnToggle').hide();
                $('#btnLogOut').show();
            }
            else {
                $('#w3btnToggle').show();
                $('#btnLogOut').hide();
            }
        },
        error: function (d) {
            console.log(d);
        }
    });
}
function view(p, t) {
    var link = '', BK = $('#bk'), frm = $('#Iframe1');
    link = "https://books.google.co.in/books?id=" + p + "&lpg=PR1&dq=book%20of%20html&pg=PR1&output=embed";
    frm.attr('src', link);
    BK.dialog("open");
    BK.dialog("option", "title", t);
    frm.css({ 'height': BK.height() - 2, 'width': BK.width() - 2 });
    $('.ui-dialog').addClass('img-responsive');
}
function info(id) {
    $.ajax({
        url: 'https://www.googleapis.com/books/v1/volumes/' + id,
        type: 'get',
        dataType: 'json',
        data: 'fields=id,volumeInfo(authors,pageCount,publishedDate,publisher,subtitle,title,description)',
        beforeSend: function () { $("#infoLoaderDiv").html('<div class="modal fade show" id="LoaderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true"><div class="modal-dialog" role="document"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span class="sr-only">Loading...</span></div></div>'); $('#LoaderModal').modal('show'); },
        complete: function () { $('#LoaderModal').modal('hide'); },
        success: function (data) {
            console.log(data);
            var d = data.volumeInfo, dlg = $("#dlgINFO"), elm = '';
            $('#LoaderModal').modal('hide');
            dlg.empty();
            var temp = '';
            temp += '<div class="modal fade show" id="myModal" tabindex="-1" role="dialog" aria-labelledby="BookInfo" aria-hidden="true">';
            temp += '<div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header">';
            temp += '<h3 class="modal-title text-success" id="ModalTitle">' + d.title + '</h3><button type="button" class="close" id="cls" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
            temp += '<div class="modal-body">';
            if (d.subtitle != undefined)
                temp += '<small class="text-secondary">' + d.subtitle + '</small>';
            if (d.authors != undefined)
                temp += '<span class="blockquote-footer">' + d.authors + '</span>';
            if (d.description != undefined)
                temp += '<p><u class="text-primary">Description:</u> ' + d.description + '</p>';
            temp += '';
            temp += '</div><div class="modal-footer">';
            temp += '<span class="text-primary">Publisher: </span> ' + d.publisher + '. <b class="text-info"> ' + d.pageCount + ' </b> pages';
            temp += '</div></div></div></div>';

            dlg.html(temp);
            $('#myModal').modal('show');
            //                dlg.dialog({title:'Open Library'});
        }
    });
}
function GetImg(id) {
    var img = $('img[id=' + id + ']');
    img.attr('src', "http://books.google.com/books/content?id=" + id + "&printsec=frontcover&img=1&zoom=2&source=gbs_api");
    console.log(img[0].naturalHeight);
    //alert();
    if (img.height() < 55 || img.height() == 300) { img.attr('src', 'img/\NoImage.jpg'); img.removeAttr('onload'); }
    img.removeAttr('onload');
}

function cardCounter() {
    var cardCol = $('#bList'), winWidth = $(window).width();
    if (winWidth < 576) cardCol.css('column-count', '1');
    else if (winWidth > 576 && winWidth < 768) cardCol.css('column-count', '2');
    else if (winWidth > 768 && winWidth < 992) cardCol.css('column-count', '3');
    else if (winWidth > 992) cardCol.css('column-count', '4');
}
$(window).resize(function () { cardCounter() });