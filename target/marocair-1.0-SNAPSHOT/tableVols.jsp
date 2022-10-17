<%-- 
    Document   : tableVols
    Created on : 14 oct. 2022, 09:25:15
    Author     : YC
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.marocair.model.Vol"%>
<%@page import="com.marocair.dao.VolDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file="helpers/links.jsp" %>
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
               VolDao dao = new VolDao();
              List<Vol> list = dao.getVols();
              for(Vol v : list) {
              String d1 = v.getStart_date_time();
              Date date1=new SimpleDateFormat("dd/MM/yyyy HH:MM").parse(d1);
              String d2 = v.getEnd_date_time();
              Date date2=new SimpleDateFormat("dd/MM/yyyy HH:MM").parse(d2);
              %>
              
            <tr class="border-b">
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><%=v.getIdVol() %></td>
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
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                  <a href="edit_vol.jsp?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fas fa-edit"></i></a>
                  <a href="delete?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fa fa-trash"></i></a>
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
    </body>
</html>
