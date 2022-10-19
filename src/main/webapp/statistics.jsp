<%-- 
    Document   : statistics
    Created on : 14 oct. 2022, 23:04:58
    Author     : YC
--%>

<%@page import="com.marocair.model.Booking"%>
<%@page import="com.marocair.dao.BookingDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page  import="java.util.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
        <title>JSP Page</title>
    </head>
    <body>
       
        <div class="container d-flex justify-content-center m-8" >
        <div class="flex flex-col">
  <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
    <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
      <div class="overflow-x-auto">
        <table class="min-w-full">
          <thead class="border-b">
               
                    
            <tr>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                ID vol
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                la ville d'arrivée
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                nb places
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Status
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                type de reservation
              </th>
              </th>
              <th scope="col-2" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                La date de début
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
              ID user
              </th>
             
              
            </tr>
          </thead>
          <tbody>
            <%
                        String query = request.getParameter("q");
                         BookingDao db = new BookingDao();   
                         List<Booking> l = db.getBookingByDate(query);
                         for(Booking b : l) {
            %>
            
            <tr class="border-b">
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><%=b.getIdvol() %></td>
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                  <%=b.getEnd_city() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                  <%=b.getNb_places() %>
              </td>
              <td class="text-sm text-gray-900 font-bold px-6 py-4 whitespace-nowrap">
               <%=b.getStatus() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
               <%=b.getTypeBooking() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
               <%=b.getStart_date_time() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
              <%=b.getIduser() %>
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
