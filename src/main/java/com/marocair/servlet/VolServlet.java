package com.marocair.servlet;

import com.marocair.dao.DbConnection;
import com.marocair.dao.VolDao;
import com.marocair.model.Vol;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "VolServlet", urlPatterns = {"/VolServlet"})
public class VolServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
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
        
        Vol vol = new Vol(start_city, end_city, escale, prix, start_date_time, end_date_time);
        VolDao dao = new VolDao();
        HttpSession session = request.getSession();
        String added = dao.addVol(vol);
                
       if(added.equalsIgnoreCase("success")){
           session.setAttribute("succMsg", "Le vol est ajouté avec succès");
           //response.getWriter().print("data insered");
            RequestDispatcher rd = request.getRequestDispatcher("add_vol.jsp");
        rd.forward(request, response);
       }else{
           session.setAttribute("errorMsg", "Le vol n'est pas ajouté ... something wrong");
            RequestDispatcher rd = request.getRequestDispatcher("add_vol.jsp");
        rd.forward(request, response);
       }
      //  response.getWriter().println(added );    
           
    }

    
    
}
