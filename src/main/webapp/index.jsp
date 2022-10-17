<%-- 
    Document   : index
    Created on : 12 oct. 2022, 09:44:13
    Author     : YC
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.marocair.model.Vol"%>
<%@page import="com.marocair.dao.VolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index page testing</title>
    </head>
    <body>
        <%@include file="helpers/links.jsp" %>
            <%@include file="helpers/navbar.jsp" %>
            <%@include file="helpers/sidebar.jsp" %>
            
             <div class="d-flex justify-content-center m-8">
                 
            <form action="">
                  <div class="row">
                      <div class="col">
                        <input type="number" class="form-control" placeholder="nombre des passagers" name="nb_places">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="ville de départ" name="start_city">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="ville d'arrivée" name="end_city">
                    </div>
                    <div class="col-4">
                      <input type="text" class="form-control" name="datetimes" />
                    </div>
                      <div class="col-3">
                          <select class="custom-select form-control" name="classe">
                                <option selected>selectionner une classe</option>
                                <option value="1">Economique</option>
                                <option value="2">Economique Premium</option>
                                <option value="3">Affaires</option>
                                <option value="4">Première</option>
                          </select>
                      </div>
                      <div class="col">
                          <button type="button" class="btn btn-primary">submit</button>
                      </div>
                 </div>
             </form>
             </div>
            
            
            <!--cards-->
            <div class="d-flex justify-content-center m-8">
            <div class="flex flex-row flex-wrap justify-center m-8">
            <%
              VolDao dao = new VolDao();
              List<Vol> list = dao.getVols();
              for(Vol v : list) {
              String startDT = v.getStart_date_time();
              String[] tSDT = startDT.split(" ");
              String endDT = v.getEnd_date_time();
              String[] tEDT = endDT.split(" ");        
            %>
            
            
            
            
                <div class="rounded-lg shadow-lg bg-white max-w-sm m-4">
                  <a href="#!" data-mdb-ripple="true" data-mdb-ripple-color="light">
                    <img class="rounded-t-lg" src="https://mdbootstrap.com/img/new/standard/nature/182.jpg" alt=""/>
                  </a>
                  <div class="p-6">
                    <h5 class="text-gray-900 text-xl font-medium mb-2"> <%=v.getStart_city() %> - <%=v.getEnd_city() %></h5>
                    <p class="text-gray-700 text-base mb-4">
                        <%=tSDT[0]%>  - <%=tEDT[1]%>
                    </p>
                    <p class="text-gray-700 text-base mb-4">
                      <%=v.getEscale() %>
                    </p>
                    <span type="button" class=" inline-block font-medium text-xs leading-tight uppercase ">A partir de</span>
                    <span class="font-bold ml-3"><%=v.getPrix() %> MAD</span>
                  </div>
                </div>
                  <% } %>
              </div>
            </div>
    </body>
</html>
