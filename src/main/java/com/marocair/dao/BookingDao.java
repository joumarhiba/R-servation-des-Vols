/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.marocair.dao;

import com.marocair.model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YC
 */
public class BookingDao extends DbConnection {
    
     public  int getBookings() {
        List<Booking> list = new ArrayList<>();
        Booking b= null;
        int c = 0;
        
        try{
            
            Connection connection = getConnection();
            String sql = "SELECT * FROM bookings";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            c=0;
            while(rs.next()){
                b = new Booking();
                b.setIdBooking(rs.getInt(1));
                b.setIduser(rs.getInt(2));
                b.setIdvol(rs.getInt(3));
                b.setNb_places(rs.getInt(4));
                b.setTypeBooking(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setClasse(rs.getString(7));
                list.add(b);
                c++;
            }
            
        }catch(Exception e){
            e.getMessage();
        }
        
        return c;
    }

   
    
    public List<Booking> getBookingByDate(String query){
        
        String cb = null;
         List<Booking> l = new ArrayList<>();
        Booking b= null;
         ResultSet rs = null;
        
        
        try{
            
            Connection connection = getConnection();
            String sql = "SELECT bookings.*, vols.end_city, vols.start_date_time, vols.prix FROM vols INNER JOIN bookings ON vols.idVol = bookings.idvol where vols.start_date_time like '"+query+"%' order by bookings.status";
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
               
                b = new Booking();
                
                b.setIdBooking(rs.getInt(1));
                b.setIduser(rs.getInt(2));
                b.setIdvol(rs.getInt(3));
                b.setNb_places(rs.getInt(4));
                b.setTypeBooking(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setClasse(rs.getString(7));
                b.setEnd_city(rs.getString(8));
                b.setStart_date_time(rs.getString(9));
                b.setPrix(rs.getInt(10));
                l.add(b);
                 cb = "the query is correct in try";
            }
            
        }catch(Exception e){
            e.getMessage();
            cb = e.toString()+" from catch bdao " +query;
        }
        
       return l;
    }
    
}
