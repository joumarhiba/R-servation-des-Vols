package com.marocair.servlet;
import com.marocair.model.RegisterBean;
import com.marocair.dao.RegisterDao;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Copying all the input parameters in to local variables
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        RegisterBean registerBean = new RegisterBean();
        registerBean.setFullName(fullName);
        registerBean.setEmail(email);
        registerBean.setUserName(userName);
        registerBean.setPassword(password);

        RegisterDao registerDao = new RegisterDao();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRegistered = registerDao.registerUser(registerBean);

        if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }
}
