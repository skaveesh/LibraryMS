<%-- 
    Document   : searchbook
    Created on : Dec 10, 2016, 11:26:02 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            //ajax request sent by load button and fill the fields in the page
            var requestSrch;
            function sendInfoUpd() {
                var v_k = document.booksearchform.booksearchkeyword.value;
                var v_s = document.booksearchform.searchselect.value;
                var url = "book/returnsearchdetailsjson.jsp?booksearchkeyword=" + v_k + "&searchselect=" + v_s;

                if (window.XMLHttpRequest) {
                    requestSrch = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    requestSrch = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    requestSrch.onreadystatechange = getInfoUpdSrch;
                    requestSrch.open("GET", url, true);
                    requestSrch.send();
                } catch (e) {
                    Materialize.toast('Unable to connect to server!', 4000);
                }
            }

            function getInfoUpdSrch() {
                if (requestSrch.readyState === 4) {
                    //alert(requestSrch.responseText);
                    //var jsonObjSrch = requestSrch.responseText;
                    var jsonObjSrch = eval('(' + requestSrch.responseText + ')');

                    if ($.trim(jsonObjSrch)) {
                        document.getElementById("searchTable").innerHTML = "";
                        var table = $('<table class="bordered"/>').appendTo($('#searchTable'));
                        $('<th/>').appendTo(table).text("ID");
                        $('<th/>').appendTo(table).text("Title");
                        $('<th/>').appendTo(table).text("Author");
                        $('<th/>').appendTo(table).text("Publisher");
                        $('<th/>').appendTo(table).text("Category");
                        $('<th/>').appendTo(table).text("ISBN");
                        $('<th/>').appendTo(table).text("Edition");
                        $('<th/>').appendTo(table).text("Available Copies");
                        $(jsonObjSrch).each(function (i, eachjsonObjSrch) {

                            $('<tr/>').appendTo(table)
                                    .append($('<td/>').text(eachjsonObjSrch.id))
                                    .append($('<td/>').text(eachjsonObjSrch.title))
                                    .append($('<td/>').text(eachjsonObjSrch.author))
                                    .append($('<td/>').text(eachjsonObjSrch.publisher))
                                    .append($('<td/>').text(eachjsonObjSrch.category))
                                    .append($('<td/>').text(eachjsonObjSrch.isbn))
                                    .append($('<td/>').text(eachjsonObjSrch.edition))
                                    .append($('<td/>').text(eachjsonObjSrch.available_copies));
                        });
                    } else {
                        document.getElementById("searchTable").innerHTML = "";
                        Materialize.toast('OOPS! No Result', 4000);
                    }
                }
            }
        </script>
    </head>
    <body>
        <div class="row">
            <form class="col s12" name="booksearchform">
                <div class="row">
                    <div class="input-field col s4 offset-s1">
                        <input id="bookseachkeyword" name="booksearchkeyword" type="text" onkeyup="sendInfoUpd()" required>
                        <label for="booksearchkeyword">Keyword</label>
                    </div>
                    <div class="input-field col s4">
                        <select id="searchselect" name="searchselect" size="5">
                            <option value="title" selected>Book Title</option>
                            <option value="author">Book Author</option>
                            <option value="publisher">Book Publisher</option>
                            <option value="category">Book Category</option>
                            <option value="isbn">Book ISBN</option>
                        </select>
                        <label>Select a category to search :</label>
                    </div>
                    <div class="col offset-s1">
                        <a class="btn-floating btn-large waves-effect waves-light red" onclick="sendInfoUpd()"><i class="material-icons">search</i></a>
                    </div>
                </div>
            </form>
        </div>
        <div id="searchTable" class="col s12"></div>
    </body>
</html>
