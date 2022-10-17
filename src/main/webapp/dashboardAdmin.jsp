<%-- 
    Document   : dashbordAdmin
    Created on : 14 oct. 2022, 09:15:18
    Author     : YC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="helpers/links.jsp" %>
        <%@include file="helpers/navbar.jsp" %>
         <%@include file="helpers/sidebar.jsp" %>
         
         
         
         <div class="d-flex justify-content-center m-8">
           <div class="row">
               <form action="searchServlet" method="get" >
                   <input type="text" name="q" class="form-control" placeholder="Entrer le numéro du mois ou du jour pour chercher" />
            <button type="submit" class="btn" >search</button>
          
        </form>
                     
               <%@include file="statistics.jsp" %>
               
                         <c:if test="${not empty succMsg }" >
                             <p class="text-center text-green-600">${succMsg }</p>
                         <c:remove var="succMsg" />
                     </c:if>
                      <c:if test="${not empty errorMsg }" >
                         <p class="text-center text-red-600">${errorMsg }</p>
                         <c:remove var="errorMsg" />
                     </c:if>
                   
                 </div>
         </div>
         <%@include file="tableVols.jsp" %>
    </body>
</html>
