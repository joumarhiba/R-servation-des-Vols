<%-- 
    Document   : add_vol
    Created on : 12 oct. 2022, 09:51:37
    Author     : YC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add vol Page</title>
    </head>
    <body>
        <%@include file="helpers/links.jsp" %>
        <%@include file="helpers/navbar.jsp" %>
         <%@include file="helpers/sidebar.jsp" %>
            
         
         <div class="d-flex justify-content-center m-8">
             <div class="row-3">
                 <div class="col-12">
                     <h1>Modifier un vol</h1>
                     
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
          
             <form action="VolServlet" method="post">
               
                  <div class="row">
                    <div class="col-5 mb-3">
                          
                        <input type="text" class="form-control" placeholder="ville de départ" name="start_city">
                    </div>
                    <div class="col-5 mb-3">
                        <input type="text" class="form-control" placeholder="ville d'arrivée" name="end_city">
                    </div>
                  </div>
                      <div class="row">
                    <div class="col-10 mb-3">
                        <input type="text" class="form-control" name="datetimes" placeholder="Dates et Horaires de départ et d'arrivée" />
                    </div>
                  </div>
                  <div class="row">
<!--                      <div class="col-5 mb-3">
                          <select class="custom-select form-control" name="classe">
                                <option selected>selectionner une classe</option>
                                <option value="1">Economique</option>
                                <option value="2">Economique Premium</option>
                                <option value="3">Affaires</option>
                                <option value="4">Première</option>
                          </select>
                      </div>-->
                      <div class="col-5 mb-3">
                          <input type="text" class="form-control" placeholder="escale" name="escale" />
                      </div>
                      <div class="col-5 mb-3">
                          <input type="number" class="form-control" placeholder="prix" name="prix" />
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-2">
                          <button type="submit" class="btn btn-primary">submit</button>
                      </div>
                 </div>
                 
             </form>
         </div>
        </body>
</html>
