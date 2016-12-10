<%-- 
    Document   : retupdatebookjson
    Created on : Dec 10, 2016, 8:09:57 AM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="returnBookDetails" class="librarymgtpackage.Book" scope="request" />
<%
    int bookid = 0;
    try {
        bookid = Integer.parseInt(request.getParameter("bid"));
    } catch (Exception e) {

    }
    out.print(returnBookDetails.getSingleRowDB_Data(bookid));
%>