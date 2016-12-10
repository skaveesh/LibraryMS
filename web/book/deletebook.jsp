<%-- 
    Document   : deletebook
    Created on : Dec 10, 2016, 6:27:29 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            //ajax request sent by load button and fill the fields in the page
            var requestDel;
            function sendInfoDel() {
                var v = document.bookidformdel.bookid.value;
                var urlDel = "book/returnbookdetailsjson.jsp?bid=" + v;

                if (window.XMLHttpRequest) {
                    requestDel = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    requestDel = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    requestDel.onreadystatechange = getInfoDel;
                    requestDel.open("GET", urlDel, true);
                    requestDel.send();
                } catch (e) {
                    Materialize.toast('Unable to connect to server!', 4000);
                }
            }

            function getInfoDel() {
                if (requestDel.readyState === 4) {
                    var jsonObjDel = JSON.parse(requestDel.responseText);
                    if (jsonObjDel.isbn !== undefined) {
                        document.getElementById('bookid_del').value = jsonObjDel.id;
                        document.getElementById('pbookid_del').innerHTML = jsonObjDel.id;
                        document.getElementById('booktitle_del').innerHTML = jsonObjDel.title;
                        document.getElementById('bookauthor_del').innerHTML = jsonObjDel.author;
                        document.getElementById('bookpublisher_del').innerHTML = jsonObjDel.publisher;
                        document.getElementById('bookcategory_del').innerHTML = jsonObjDel.category;
                        document.getElementById('bookisbn_del').innerHTML = jsonObjDel.isbn;
                        document.getElementById('bookedition_del').innerHTML = jsonObjDel.edition;
                        document.getElementById('bookcopies_del').innerHTML = jsonObjDel.available_copies;

                    } else {
                        Materialize.toast('Please enter a valid book id!', 4000);
                    }
                }
            }
            
        </script>
    </head>
    <body>
        <div class="row">
            <form class="col s12" name="bookidformdel">
                <div class="row">
                    <div class="col s6">
                        Enter Book ID to Delete:
                        <div class="input-field inline">
                            <input id="bookid" name="bookid" type="number" min="1" title="Please enter a number" required>
                            <label for="bookid">Book ID</label>
                        </div>
                    </div>
                    <input type="button" class="btn waves-effect waves-light col s1" onClick="sendInfoDel()" value="Load"/>
                </div>
            </form>
            <form class="col s12" action="DeleteHandle" method="GET">
                <div class="row">
                    <div class="col s3">
                        <p>Book ID                  : </p>
                    </div >
                    <div class="col s9">
                        <p id="pbookid_del" name="pbookid_del"></p>
                        <input type="hidden" class="col s1" id="bookid_del" name="bookid_del" />
                        <!--making a hidden input field because <p> cannot 
                        send via a form -->
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Title               : </p>
                    </div>
                    <div class="col s9">
                        <p id="booktitle_del" name="booktitle_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Author              : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookauthor_del" name="bookauthor_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Publisher           : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookpublisher_del" name="bookpublisher_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Category            : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookcategory_del" name="bookcategory_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book ISBN                : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookisbn_del" name="bookisbn_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Edition             : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookedition_del" name="bookedition_del"></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <p>Book Available Copies    : </p>
                    </div>
                    <div class="col s9">
                        <p id="bookcopies_del" name="bookcopies_del"></p>
                    </div>
                </div>

                <div class="row">
                    <button class="btn waves-effect waves-light col s2 offset-s3" type="submit" name="action" onclick="return deleteconfirm()">Delete
                        <i class="material-icons right">delete</i>
                    </button>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            function deleteconfirm() {
                if (document.getElementById('bookid_del').value !== "" && confirm("Are you sure want to delete this record?")) { // confirm returns true = OK clicked
                    return true;
                } else { // confirm returns false = Cancel clicked
                    return false;
                }
            }
        </script>
    </body>

</html>
