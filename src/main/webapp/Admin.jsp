<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
  <title>Admin Page</title>
</head>
<% //In case, if Admin session is not set, redirect to Login page
  if((request.getSession(false).getAttribute("Admin")== null) )
  {
%>
<jsp:forward page="/index.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>Admin's Home</h2></center>

Welcome <%=request.getAttribute("userName") %>

<div style="text-align: right"><a href="LogoutServle">Logout</a></div>
</body>
</html>