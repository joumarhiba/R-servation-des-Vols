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
        <%--<%@include file="helpers/navbar.jsp" %>--%>
         <%@include file="helpers/sidebar.jsp" %>
            

		<!-- Container -->
		<div class="container mx-auto">
			<div class="d-flex justify-content-center px-6 my-12">
				<!-- Row -->
				<div class="w-full xl:w-3/4 lg:w-9/12 flex shadow d-flex justify-content-center ">
					<div class="w-full lg:w-7/12 bg-white p-5 rounded-lg lg:rounded-l-none">
						<h3 class="pt-4 text-2xl text-center">Ajouter un vol !</h3>
                                                   <c:if test="${not empty succMsg }" >
                                                        <p class="text-center text-green-600">${succMsg }</p>
                                                    <c:remove var="succMsg" />
                                                </c:if>
                                                 <c:if test="${not empty errorMsg }" >
                                                    <p class="text-center text-red-600">${errorMsg }</p>
                                                    <c:remove var="errorMsg" />
                                                </c:if>
						<form class="px-8 pt-6 pb-8 mb-4 bg-white rounded" action="VolServlet" method="post">
							<div class="mb-4 md:flex md:justify-between">
								<div class="mb-4 md:mr-2 md:mb-0">
									<input class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded appearance-none focus:outline-none " type="text" class="form-control" placeholder="ville de départ" name="start_city" />
								</div>
								<div class="md:ml-2">
									<input class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded  appearance-none focus:outline-none " type="text" class="form-control" placeholder="ville d'arrivée" name="end_city">
									
								</div>
							</div>
							<div class="mb-4">
								<input class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded  appearance-none focus:outline-none " type="text" class="form-control" name="datetimes" placeholder="Dates et Horaires de départ et d'arrivée" />
								
							</div>
							<div class="mb-4 md:flex md:justify-between">
								<div class="mb-4 md:mr-2 md:mb-0">
									
                                                                            <input class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border border-red-500 rounded appearance-none focus:outline-none " type="text" class="form-control" placeholder="escale" name="escale" />
										
								</div>
								<div class="md:ml-2">
									<input type="number" class="form-control" placeholder="prix" name="prix" class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded appearance-none focus:outline-none" />
									
								</div>
							</div>
							<div class="mb-6 text-center">
								<button
									class="w-full px-4 py-2 font-bold text-white bg-gray-800 hover:bg-gray-700 focus:outline-none "
									type="submit"
								>
									Ajouter le vol
								</button>
							</div>
							<hr class="mb-6 border-t" />
							
						</form>
					</div>
				</div>
			</div>
		</div>

         
      
        </body>
</html>
