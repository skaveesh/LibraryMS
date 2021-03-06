<%-- 
    Document   : newjsp
    Created on : Dec 4, 2016, 9:26:35 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            //ajax request sent by load button and fill the fields in the page
            var request;
            function sendInfoUpd() {
                var v = document.bookidform.bookid.value;
                var url = "book/returnbookdetailsjson.jsp?bid=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfoUpd;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    Materialize.toast('Unable to connect to server!', 4000);
                }
            }

            function getInfoUpd() {
                if (request.readyState === 4) {
                    var jsonObj = JSON.parse(request.responseText);
                    if (jsonObj.isbn !== undefined) {
                        document.getElementById('booktitle').value = jsonObj.title;
                        document.getElementById('bookauthor').value = jsonObj.author;
                        document.getElementById('bookpublisher').value = jsonObj.publisher;
                        document.getElementById('bookcategory').value = jsonObj.category;
                        document.getElementById('bookisbn').value = jsonObj.isbn;
                        document.getElementById('bookedition').value = jsonObj.edition;
                        document.getElementById('bookcopies').value = jsonObj.available_copies;
                    } else {
                        Materialize.toast('Please enter a valid book id!', 4000);
                    }
                }
            }
        </script>
    </head>
    <body>
        <div class="row">
            <form class="col s12" name="bookidform">
                <div class="row">
                    <div class="col s6">
                        Enter Book ID to Update:
                        <div class="input-field inline">
                            <input id="bookid" name="bookid" type="number" min="1" title="Please enter a number" required>
                            <label for="bookid">Book ID</label>
                        </div>
                    </div>
                    <input type="button" class="btn waves-effect waves-light col s1" onClick="sendInfoUpd()" value="Load"/>
                </div>
            </form>
            <form class="col s12" action="UpdateHandle" method="POST">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="booktitle" name="booktitle" type="text" value=" " class="validate" required>
                        <label for="booktitle">Book Title</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookauthor" name="bookauthor" type="text" value=" " class="validate" required>
                        <label for="bookauthor">Author</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookpublisher" name="bookpublisher" type="text" value=" " class="validate" required>
                        <label for="bookpublisher">Publisher</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookcategory" name="bookcategory" type="text" value=" " class="validate" required>
                        <label for="bookcategory">Category</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookisbn" name="bookisbn" type="text" value=" " class="validate" readOnly="true" required>
                        <label for="bookisbn">ISBN</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookedition" name="bookedition" type="text" value=" " class="validate" required>
                        <label for="bookedition">Edition</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookcopies" name="bookcopies" type="number" min="0" value="0" pattern="^[0-9]" class="validate" required>
                        <label for="bookcopies">Available Copies</label>
                    </div>
                    <button class="btn waves-effect waves-light col s2 offset-s3" type="submit" name="action">Update
                        <i class="material-icons right">present_to_all</i>
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
