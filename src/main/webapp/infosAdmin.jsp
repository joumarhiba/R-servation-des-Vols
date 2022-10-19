<%-- 
    Document   : infosAdmin
    Created on : 18 oct. 2022, 16:08:47
    Author     : YC
--%>

<%@page import="java.util.List"%>
<%@page import="com.marocair.model.Booking"%>
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
              int nb =  dnb.getBookings();
              int somme = 0;
              List<Booking> listPrices = dnb.getPrice(); 
            
              for(Booking p : listPrices) {
              somme = p.getPrix();
            }
        %>

<div class="container d-flex justify-content-center m-8" >    
<div class="row-2">    
            <div class="mt-4 w-auto grid grid-cols-2 md:grid-cols-4 xl:grid-cols-2 gap-5">
                  <div class="bg-gray-800 rounded-lg p-4 sm:p-12 p-16 ">
                     <div class="flex items-center">
                        <div class="flex-shrink-0">
                           <span class="text-2xl sm:text-3xl leading-none font-bold text-white m-4"><%=nb %></span>
                           <h3 class="text-base font-normal text-white ">Total des réservations effectuées </h3>
                        </div>
                        <div class="ml-5 w-0 flex items-center justify-end flex-1 text-green-500 text-base font-bold mb-4">
                           14.6%
                           
                        </div>
                     </div>
                  </div>
                  <div class="bg-gray-800  rounded-lg p-4 sm:p-12 xl:p-16 ">
                     <div class="flex items-center">
                        <div class="flex-shrink-0">
                           <span class="text-2xl sm:text-3xl leading-none font-bold text-white"><%=somme %> MAD</span>
                           <h3 class="text-base font-normal text-white mt-2">Chiffre d'affaires annuelle</h3>
                        </div>
                        <div class="ml-5 w-0 flex items-center justify-end flex-1 text-green-500 text-base font-bold">
                           32.9%
                       </div>
                     </div>
                  </div>
                 
               </div>
                   </div>
                       </div>

        
    </body>
</html>
