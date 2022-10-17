/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.marocair.servlet;

import com.marocair.dao.VolDao;
import com.marocair.model.Vol;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "UpdateVolServlet", urlPatterns = {"/UpdateVolServlet"})
public class UpdateVolServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         String start_city = request.getParameter("start_city");
        String end_city = request.getParameter("end_city");
        String dateTime = request.getParameter("datetimes");
        String[] tabDT = dateTime.split("-");
        String start_date_time = tabDT[0];
        String end_date_time = tabDT[1];
        String escale = request.getParameter("escale");
        int prix = Integer.parseInt(request.getParameter("prix"));  
        int idVol = Integer.parseInt(request.getParameter("idVol"));
        
        Vol vol = new Vol(idVol, start_city, end_city, escale, prix, start_date_time, end_date_time);
        VolDao dao = new VolDao();
        HttpSession session = request.getSession();
        String res = dao.updateVol(vol);
        
        if(res.equalsIgnoreCase("success")){
           session.setAttribute("succMsg", "Le vol n ° "+request.getParameter("idVol")+" est modifé avec succès");
            RequestDispatcher rd = request.getRequestDispatcher("dashboardAdmin.jsp");
            rd.forward(request, response);
       }else{
           session.setAttribute("errorMsg", "Le vol n'est pas modifié ... something wrong");
            RequestDispatcher rd = request.getRequestDispatcher("dashboardAdmin.jsp");
        rd.forward(request, response);
       }
   
    }


}
