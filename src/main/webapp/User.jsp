<%@page import="java.util.List"%>
<%@page import="com.marocair.model.Vol"%>
<%@page import="com.marocair.dao.VolDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>User Page</title>
</head>
<% //In case, if User session is not set, redirect to Login page.
  if((request.getSession(false).getAttribute("User")== null) )
  {
%>
<jsp:forward page="/index.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>payment page </h2></center>
<%--<%=request.getAttribute("userName") %>--%>

<div style="text-align: right"><a href="LogoutServle">Logout</a></div>
<div class="text-center container">
    <p>La reservation est bien faite .....</p>
<p>un message sera envoyer dans votre boîte mail</p>
</div>


</body>
</html>