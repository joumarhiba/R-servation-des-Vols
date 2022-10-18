<%-- 
    Document   : sidebar
    Created on : 12 oct. 2022, 11:36:28
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
        <!--sidebar-->
        
    <div
      class="sidebar fixed top-0 bottom-0 lg:left-0 p-2 w-[300px] overflow-y-auto text-center bg-gray-800 grid-cols-9 md:w-1/6 lg:ml-0 lg:w-[25%] xl:w-[20%] 2xl:w-[15%]"
    >
      <div class="text-gray-100 text-xl">
        <div class="p-2.5 mt-1 flex items-center">
            <p  class="font-bold text-white-100 text-md text-center">MarocAir</p> 
          <i
            class="bi bi-x cursor-pointer ml-28"
            onclick="openSidebar()"
          ></i>
        </div>
        <div class="my-2 bg-gray-600 h-[1px]"></div>
      </div>
     <div class="mt-8 text-center">
            <img src="https://tailus.io/sources/blocks/stats-cards/preview/images/second_user.webp" alt="" class="w-10 h-10 m-auto rounded-full object-cover lg:w-28 lg:h-28">
            <h5 class="hidden mt-4 text-xl font-semibold text-gray-600 lg:block">Responsable des vols</h5>
            <span class="hidden text-gray-400 lg:block">Admin</span>
        </div>
      <div
        class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:text-gray-500 text-white"
      >
        <i class="bi bi-house-door-fill"></i>
        <span><a class="text-[15px] ml-4 text-gray-200 font-bold no-underline hover:bg-gray-500" href="dashboardAdmin.jsp">Dashboard</a></span>
      </div>
      <div
        class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:text-gray-500 text-white"
      >
        <i class="bi bi-bookmark-fill"></i>
        <span ><a class="text-[15px] ml-4 text-gray-200 font-bold no-underline hover:bg-gray-500" href="add_vol.jsp">Add flight</a></span>
      </div>
      <div class="my-4 bg-gray-600 h-[1px]"></div>
     
      <div
        class="p-2.5 mt-3 flex items-center  rounded-md px-4 duration-300 cursor-pointer hover:text-gray-500 text-white">
        <i class="bi bi-box-arrow-in-right"></i>
        <a class="text-[15px] ml-4 text-gray-200 no-underline font-bold hover:bg-gray-500" href="LogoutServle" >Logout</a>
      </div>
    </div>
        </div>

    <script type="text/javascript">
      function dropdown() {
        document.querySelector("#submenu").classList.toggle("hidden");
        document.querySelector("#arrow").classList.toggle("rotate-0");
      }
      dropdown();

      function openSidebar() {
        document.querySelector(".sidebar").classList.toggle("hidden");
      }
    </script>

    </body>
</html>
