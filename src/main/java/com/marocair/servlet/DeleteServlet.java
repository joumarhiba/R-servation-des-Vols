/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.marocair.servlet;

import com.marocair.dao.VolDao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteServlet", urlPatterns = {"/delete"})
public class DeleteServlet extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        int idVol = Integer.parseInt(request.getParameter("idVol"));
        VolDao dao = new VolDao();
        boolean result = dao.deleteVol(idVol);
        HttpSession session = request.getSession();
        
        if(result){
            session.setAttribute("succMsg","le Vol n° "+request.getParameter("idVol")+" est supprimé avec succès !");
            response.sendRedirect("dashboardAdmin.jsp");
        }else {
            session.setAttribute("errorMsg","something wrong , flight is not deleted !");
            response.sendRedirect("dashboardAdmin.jsp");
        }
        
    }

}
