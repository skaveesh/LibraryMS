<%-- 
    Document   : returnsearchdetailsjson
    Created on : Dec 11, 2016, 8:48:46 AM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="searchBookDetails" class="librarymgtpackage.Book" scope="request" />
<%
    String srch_keyword = request.getParameter("booksearchkeyword");
    String srch_category = request.getParameter("searchselect");
    
    searchBookDetails.setSearchCategory(srch_category);
    searchBookDetails.setSearchKeyword(srch_keyword);
    out.print(searchBookDetails.getSearch_Data());
%>
