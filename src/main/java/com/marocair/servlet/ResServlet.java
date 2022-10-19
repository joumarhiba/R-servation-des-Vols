package com.marocair.servlet;

import com.marocair.dao.VolDao;
import com.marocair.model.ReservationBean;
import com.marocair.dao.VolDao;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ResServlet", value = "/ResServlet")
public class ResServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        int idVol = Integer.parseInt(request.getParameter("idVol"));
        System.out.println(idVol);
        int nb_places = Integer.parseInt(request.getParameter("nb_places"));
        System.out.println(nb_places);
        String typeBooking = request.getParameter("typeBooking");
        System.out.println(typeBooking);
        String classe = request.getParameter("classe");
        System.out.println(classe);

        ReservationBean reservationBean = new ReservationBean();
        reservationBean.setidVol(idVol);
        reservationBean.setNb_places(nb_places);
        reservationBean.setTypeBooking(typeBooking);
        reservationBean.setClasse(classe);

        VolDao volDao = new VolDao();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRe;
        try {
            userRe = volDao.registerres(reservationBean);
            System.out.println(userRe);
            
            if(userRe.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.getRequestDispatcher("/User.jsp").forward(request, response);
//         response.getWriter().print("inside if  : "+idVol +" "+nb_places+" "+typeBooking+" "+classe);
        }
        else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRe);
                     response.getWriter().print("inside else : "+userRe+" "+idVol +" "+nb_places+" "+typeBooking+" "+classe);
//            request.getRequestDispatcher("/User.jsp").forward(request, response);
        }
            
        } catch (MessagingException ex) {
            Logger.getLogger(ResServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        
    }
}
