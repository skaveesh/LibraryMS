<%-- 
    Document   : insertbook
    Created on : Dec 10, 2016, 9:52:47 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <form class="col s12" action="InsertHandle" method="POST">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="booktitle_ins" name="booktitle_ins" type="text" class="validate" required>
                        <label for="booktitle_ins">Book Title</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookauthor_ins" name="bookauthor_ins" type="text" class="validate" required>
                        <label for="bookauthor_ins">Author</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookpublisher_ins" name="bookpublisher_ins" type="text" class="validate" required>
                        <label for="bookpublisher_ins">Publisher</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookcategory_ins" name="bookcategory_ins" type="text" class="validate" required>
                        <label for="bookcategory_ins">Category</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookisbn_ins" name="bookisbn_ins" type="text" class="validate" required>
                        <label for="bookisbn_ins">ISBN</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="bookedition_ins" name="bookedition_ins" type="text" class="validate" required>
                        <label for="bookedition_ins">Edition</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="bookcopies_ins" name="bookcopies_ins" type="number" min="0" pattern="^[0-9]" class="validate" required>
                        <label for="bookcopies_ins">Available Copies</label>
                    </div>
                    <button class="btn waves-effect waves-light col s2 offset-s3" type="submit" name="action">Insert
                        <i class="material-icons right">open_in_browser</i>
                    </button>
                </div>
            </form>
    </body>
</html>
