/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.marocair.servlet;

import com.marocair.dao.BookingDao;
import com.marocair.model.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author YC
 */
@WebServlet(name = "searchServlet", urlPatterns = {"/searchServlet"})
public class searchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String query = request.getParameter("q");
               BookingDao bd = new BookingDao();
              List<Booking> l = bd.confirmedBooking(query);
        HttpSession session = request.getSession();
        
        if(!l.isEmpty()){
           // session.setAttribute("succMsg","le Vol n° "+request.getParameter("idVol")+" est supprimé avec succès !");
            response.getWriter().println("is not empty " + " ---- "+query);
            response.sendRedirect("dashboardAdmin.jsp?q="+request.getParameter("q"));
        }else {
//            session.setAttribute("errorMsg","something wrong , flight is not deleted !");
            response.getWriter().println("is empty "+ " ---- "+query);
        }
    }

    
}
