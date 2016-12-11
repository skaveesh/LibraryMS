<%-- 
    Document   : reserverbook
    Created on : Dec 11, 2016, 7:03:07 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            //ajax request sent by load button and fill the fields in the page
            var requestRsrv;
            function sendInfoRsrv() {
                var v = document.bookidformrsrv.bookid.value;
                var urlRsrv = "book/returnbookdetailsforreservejson.jsp?bid=" + v;

                if (window.XMLHttpRequest) {
                    requestRsrv = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    requestRsrv = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    requestRsrv.onreadystatechange = getInfoRsrv;
                    requestRsrv.open("GET", urlRsrv, true);
                    requestRsrv.send();
                } catch (e) {
                    Materialize.toast('Unable to connect to server!', 4000);
                }
            }

            function getInfoRsrv() {
                if (requestRsrv.readyState === 4) {
                    var jsonObjRsrv = JSON.parse(requestRsrv.responseText);
                    if (jsonObjRsrv.isbn !== undefined) {
                        document.getElementById('bookid_rsrv').value = jsonObjRsrv.id;
                        document.getElementById('pbookid_rsrv').innerHTML = jsonObjRsrv.id;
                        document.getElementById('booktitle_rsrv').innerHTML = jsonObjRsrv.title;
                        document.getElementById('bookauthor_rsrv').innerHTML = jsonObjRsrv.author;
                        document.getElementById('bookpublisher_rsrv').innerHTML = jsonObjRsrv.publisher;
                        document.getElementById('bookcategory_rsrv').innerHTML = jsonObjRsrv.category;
                        document.getElementById('bookisbn_rsrv').innerHTML = jsonObjRsrv.isbn;
                        document.getElementById('bookedition_rsrv').innerHTML = jsonObjRsrv.edition;
                        document.getElementById('bookcopies_rsrv').innerHTML = jsonObjRsrv.available_copies;

                    } else {
                        Materialize.toast('You can reserve books which are not currently available (Available Copies: 0) in the Library / Please enter a valid book id!', 6000);
                    }
                }
            }
            
        </script>
    </head>
    <body>
        <div class="row">
            <form class="col s12" name="bookidformrsrv">
                <div class="row">
                    <div class="col s6">
                        Enter Book ID to Reserve:
                        <div class="input-field inline">
                            <input id="bookid" name="bookid" type="number" min="1" title="Please enter a number" required>
                            <label for="bookid">Book ID</label>
                        </div>
                    </div>
                    <input type="button" class="btn waves-effect waves-light col s1" onClick="sendInfoRsrv()" value="Load"/>
                </div>
            </form>
            <form class="col s12" action="ReserveHandle" method="GET">
                <div class="row">
                    <div class="col s3">
                        <p>Book ID                  : </p>
                    </div >
                    <div class="col s9">
                        <p id="pbookid_rsrv" name="pbookid_rsrv"></p>
                        <input type="hidden" class="col s1" id="bookid_rsrv" name="bookid_rsrv"/>
                        <!--making a hidden input field because <p> cannot 
                        send via a form -->
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Title               : </p>
                    </div>
                    <div class="col s9">
                        <p id="booktitle_rsrv" name="booktitle_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Author              : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookauthor_rsrv" name="bookauthor_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Publisher           : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookpublisher_rsrv" name="bookpublisher_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Category            : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookcategory_rsrv" name="bookcategory_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book ISBN                : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookisbn_rsrv" name="bookisbn_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Edition             : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookedition_rsrv" name="bookedition_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Available Copies    : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookcopies_rsrv" name="bookcopies_rsrv"></p>
                    </div>
                </div>

                <div class="row">
                    <button class="btn waves-effect waves-light col s2 offset-s3" type="submit" name="action" onclick="return reservevalidate()">Reserve
                        <i class="material-icons right">class</i>
                    </button>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            function reservevalidate() {
                if (document.getElementById('bookid_rsrv').value !== "") { 
                    return true;
                } else { 
                    return false;
                }
            }
        </script>
    </body>
</html>
