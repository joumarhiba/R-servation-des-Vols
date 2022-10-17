<%-- 
    Document   : edit_vol
    Created on : 12 oct. 2022, 09:52:24
    Author     : YC
--%>

<%@page import="com.marocair.model.Vol"%>
<%@page import="com.marocair.dao.VolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
          <%@include file="helpers/links.jsp" %>
        <%@include file="helpers/navbar.jsp" %>
         <%@include file="helpers/sidebar.jsp" %>
            
         
         
         <div class="d-flex justify-content-center m-8">
             <div class="row-3">
                 <div class="col-12">
                     <h1>Modifier un vol</h1>
                     <%
                         int id = Integer.parseInt(request.getParameter("idVol"));
                         VolDao dao = new VolDao();   
                         Vol v = dao.getVolById(id);
                     %>
                 </div>
             </div><br>
             <div class="row">
                     
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
         
         
         <div class="d-flex justify-content-center m-8">
             
             <form action="UpdateVolServlet" method="post">
               
                  <div class="row">
                    <div class="col-5 mb-3">
                          
                        <input type="text" class="form-control" placeholder="ville de départ" name="start_city" value="<%=v.getStart_city() %>" >
                    </div>
                    <div class="col-5 mb-3">
                        <input type="text" class="form-control" placeholder="ville d'arrivée" name="end_city" value="<%=v.getEnd_city() %>">
                    </div>
                  </div>
                      <div class="row">
                    <div class="col-10 mb-3">
                      <input type="text" class="form-control" name="datetimes" value="<%=v.getStart_date_time() %> - value="<%=v.getEnd_date_time() %>"/>
                    </div>
                  </div>
                  <div class="row">
                      <div class="col-5 mb-3">
                          <input type="text" class="form-control" placeholder="escale" name="escale" value="<%=v.getEscale() %>" />
                      </div>
                      <div class="col-5 mb-3">
                          <input type="number" class="form-control" placeholder="prix" name="prix" value="<%=v.getPrix() %>" />
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-2">
                          <input type="hidden" name="idVol" value="<%=v.getIdVol() %>" />
                          <button type="submit" class="btn btn-primary">Modifier</button>
                      </div>
                 </div>
                 
             </form>
         </div>
    </body>
</html>
