
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>Register</title>
  <script>
    function validate()
    {
      var fullname = document.form.fullname.value;
      var email = document.form.email.value;
      var username = document.form.username.value;
      var password = document.form.password.value;
      var conpassword= document.form.conpassword.value;

      if (fullname==null || fullname=="")
      {
        alert("Full Name can't be blank");
        return false;
      }
      else if (email==null || email=="")
      {
        alert("Email can't be blank");
        return false;
      }
      else if (username==null || username=="")
      {
        alert("Username can't be blank");
        return false;
      }
      else if(password.length<6)
      {
        alert("Password must be at least 6 characters long.");
        return false;
      }
      else if (password!=conpassword)
      {
        alert("Confirm Password should match with the Password");
        return false;
      }
    }
  </script>
</head>
<body>
   <%@include file="helpers/links.jsp" %>
        <%@include file="helpers/navbar.jsp" %>
        
    
    <!-- Container -->
<div class="flex flex-wrap min-h-screen w-full content-center justify-center bg-gray-200 py-10">
  
  <!-- Login component -->
  <div class="flex shadow-md">
    <!-- Login form -->
    <div class="flex flex-wrap content-center justify-center rounded-l-md bg-white" style="width: 30rem; height: 38rem;">
      <div class="w-72">
        <!-- Heading -->
        <h1 class="text-xl font-semibold">Welcome back</h1>
        <small class="text-gray-400">Welcome back! Please enter your details</small>

        <!-- Form -->
        <form class="mt-4" name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Fullname</label>
            <input type="text" placeholder="Enter your fullname" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" name="fullname" />
          </div>
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Email</label>
            <input type="email" placeholder="Enter your email" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" name="email" />
          </div>
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Username</label>
            <input type="text" placeholder="Enter your username" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" name="username"/>
          </div>
          <div class="mb-3">
            <label class="mb-2 block text-xs font-semibold">Password</label>
            <input type="password" placeholder="*****" name="password" class="block w-full rounded-md border border-gray-300 focus:border-gray-700 focus:outline-none focus:ring-1 focus:ring-gray-700 py-1 px-1.5 text-gray-500" />
          </div>


          <div class="mb-3">
            <button class="mb-1.5 block w-full text-center text-white bg-gray-700 hover:bg-gray-800 px-2 py-1.5 rounded-md">Sign in</button>
            <button class="flex flex-wrap justify-center w-full border border-gray-300 hover:border-gray-800 px-2 py-1.5 rounded-md">
              <img class="w-5 mr-2" src="https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA">
              Sign in with Google
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
    <div class="flex flex-wrap content-center justify-center rounded-r-md" style="width: 30rem; height: 38rem;">
      <img class="w-full h-full bg-center bg-no-repeat bg-cover rounded-r-md" src="helpers/img.jpg">
    </div>

  </div>

</div>
</body>
</html>
