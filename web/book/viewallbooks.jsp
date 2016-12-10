<%-- 
    Document   : viewallbooks
    Created on : Dec 4, 2016, 11:09:20 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="showBooks" class="librarymgtpackage.Book" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LibraryMS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel='shortcut icon' href='images/favicon.ico' type='image/x-icon'/>
    </head>
    <body>
        <table class="bordered" cellspacing="0" cellpadding="0" >
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Category</th>
                <th>ISBN</th>
                <th>Edition</th>
                <th>Available Copies</th>
            </tr>
            <%
                List<Object> list = new ArrayList<Object>();
                list = showBooks.getDB_Data();
                for (int i = 0; i < list.size(); i++) {
                    showBooks.setObj(list.get(i));

            %>
            <tr>
                <td>
                    <%                                    out.print(showBooks.getID());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getTitle());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getAuthor());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getPublisher());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getCategory());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getIsbn());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getEdition());
                    %>
                </td>
                <td>
                    <%
                        out.print(showBooks.getAvailable_copies());
                    %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
