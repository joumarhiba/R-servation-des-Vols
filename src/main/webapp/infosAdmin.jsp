<%-- 
    Document   : infosAdmin
    Created on : 18 oct. 2022, 16:08:47
    Author     : YC
--%>

<%@page import="com.marocair.dao.BookingDao"%>
<%@page import="com.marocair.dao.VolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        BookingDao dnb = new BookingDao();
              int nb = dnb.getBookings();
              
        %>
        <<h1><%=nb %></h1>
    </body>
</html>
