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
                 
                 
<div>vols</div>
<div class="container d-flex justify-content-center m-8" >
  <div class="flex flex-col">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
        <div class="overflow-x-auto">
          <table class="min-w-full">
            <thead class="border-b">
            <tr>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                ID
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Départ
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Arrivée
              </th>
              <th scope="col-2" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Date/Heure départ
              </th>
              <th scope="col-2" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Date/Heure arrivée
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                escale
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Prix
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                options
              </th>

            </tr>
            </thead>
            <tbody>
            <%
              VolDao dao1 = new VolDao();
              List<Vol> list1 = dao1.getVols();
              for(Vol v : list1) {
            %>

            <tr class="border-b">
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                <%=v.getIdVol() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getStart_city() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEnd_city() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getStart_date_time() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEnd_date_time() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEscale() %>
              </td>

              <td class="text-lg text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getPrix() %> MAD
              </td>
<%--              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">--%>
<%--                <a href="edit_vol.jsp?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fas fa-edit"></i></a>--%>
<%--                <a href="delete?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fa fa-trash"></i></a>--%>
<%--              </td>--%>
              <td><button type="button" class="bg-gray-800 text-white p-2" data-bs-toggle="modal" data-bs-target="#exampleModal<%=v.getIdVol()%>">
                Reserver
              </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal<%=v.getIdVol()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">Réservation</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form name="form" action="ResServlet" method="post">
                          <!-- nbre place input -->
                          <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Nombre de places:</label>
                            <input type="number" id="form2Example1" class="form-control"  name="nb_places"/>
                           </div>

                          <!-- type input -->
                          <div class="form-outline mb-4">
                            <select class="form-select" aria-label="Default select example" name="typeBooking">
                              <option selected>Saisir votre Choix</option>
                              <option value="Aller">Aller</option>
                              <option value="Aller-Retour">Aller-Retour</option>
                            </select>
                          </div>
                          <!--  classe input -->
                          <div class="form-outline mb-4">
                            <select class="form-select" aria-label="Default select example" name="classe">
                              <option selected>Saisir Classe :</option>
                              <option value="economique">economique</option>
                              <option value="Affaire">Affaire</option>
                              <option value="Premier">Premier</option>
                            </select>
                          </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                        <input type="hidden" name="idVol" value="<%=v.getIdVol() %>" />
                                               <input type="hidden" name="iduser" value="<%=v.getIduser() %>" />

                        <input type="submit" value="reserve">
                      </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </td>

            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
                 
                 
                 
<!--            <form action="">
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
             </form>-->
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
