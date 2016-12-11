<%-- 
    Document   : returnbookdetailsforreservejson
    Created on : Dec 11, 2016, 7:13:55 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="returnBookDetailsforReserve" class="librarymgtpackage.Book" scope="request" />
<%
    int bookid = 0;
    try {
        bookid = Integer.parseInt(request.getParameter("bid"));
    } catch (Exception e) {

    }
    out.print(returnBookDetailsforReserve.getSingleReserveRowDB_Data(bookid));
%>
