
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
      <%@include file="helpers/links.jsp" %>
            <%@include file="helpers/navbar.jsp" %>
        
        
      <div class="flex flex-wrap min-h-screen w-full content-center justify-center bg-gray-200 py-10">
  <!-- Login component -->
  <div class="flex shadow-md">
       <div class="flex flex-wrap content-center justify-center rounded-r-md" style="width: 30rem; height: 38rem;">
      <img class="w-full h-full bg-center bg-no-repeat bg-cover rounded-r-md" src="helpers/img-login.jpg">
    </div>
    <!-- Login form -->
    <div class="flex flex-wrap content-center justify-center rounded-l-md bg-white" style="width: 30rem; height: 38rem;">
      <div class="w-72">
        <!-- Heading -->
        <h1 class="text-xl font-semibold">Welcome back</h1>
        <small class="text-gray-400">Welcome back! Please enter your details</small>

        <!-- Form -->
        <form class="mt-4" name="form" action="LoginServlet" method="post">
         
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Username</label>
            <input type="text" placeholder="Enter your username" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" name="username"/>
          </div>
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Password</label>
            <input type="password" placeholder="*****" name="password" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" />
          </div>
            <p><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></p>
          <div class="mb-3">
            <button class="mb-1.5 block w-full text-center text-white bg-gray-700 hover:bg-gray-800 px-2 py-1.5 rounded-md">Sign up</button>
            <button class="flex flex-wrap justify-center w-full border border-gray-300 hover:border-gray-800 px-2 py-1.5 rounded-md">
              <img class="w-5 mr-2" src="https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA">
              Sign up with Google
            </button>
          </div>
        </form>

        <!-- Footer -->
        <div class="text-center">
          <span class="text-xs text-gray-400 font-semibold">have you an account?</span>
          <a href="login.jsp" class="text-xs font-semibold text-gray-700">Sign in</a>
        </div>
      </div>
    </div>

    <!-- Login banner -->
   

  </div>

</div>
</body>
</html>