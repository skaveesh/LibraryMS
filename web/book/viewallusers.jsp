<%-- 
    Document   : viewallusers
    Created on : Dec 11, 2016, 8:39:05 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="showUsers" class="librarymgtpackage.Member" scope="request" />
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
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Username</th>
                <th>E-mail</th>
                <th>Reserved Book ID</th>
            </tr>
            <%
                List<Object> list = new ArrayList<Object>();
                list = showUsers.getDB_Data();
                for (int i = 0; i < list.size(); i++) {
                    showUsers.setObj(list.get(i));

            %>
            <tr>
                <td>
                    <%                                    out.print(showUsers.getId());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getFirstname());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getLastname());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getAddress());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getContact());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getUsername());
                    %>
                </td>
                <td>
                    <%
                        out.print(showUsers.getEmail());
                    %>
                </td>
                <td>
                    <%
                        if (showUsers.getReservation_bookID() == 0) {
                            out.print("-");
                        } else {
                            out.print(showUsers.getReservation_bookID());
                        }
                    %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
