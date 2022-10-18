package com.marocair.dao;

import com.marocair.model.Vol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VolDao extends DbConnection {
    
//
//    public VolDao(Connection connection) {
//        super();
//        this.connection = connection;
//    }
    
    public String addVol(Vol vol){
        
        boolean added = false;
        String res = "";
        
        try {
            Connection connection = getConnection();
            String sql = "INSERT INTO vols (start_city, end_city, escale, prix, start_date_time, end_date_time) VALUES ( ?, ?, ?, ?, ?, ?)";
        
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, vol.getStart_city());
            ps.setString(2, vol.getEnd_city());
            ps.setString(3,vol.getEscale());
            ps.setInt(4, vol.getPrix());
            ps.setString(5,vol.getStart_date_time());
            ps.setString(6, vol.getEnd_date_time());
            
            ps.executeUpdate();
            res = "success";
                        
        } catch (SQLException ex) {
            res = ex.getMessage();
            ex.printStackTrace();
        }
        
        return res;
    }
    
    public  List<Vol> getVols() {
        List<Vol> list = new ArrayList<>();
        Vol  v= null;
        
        try{
            
            Connection connection = getConnection();
            String sql = "SELECT * FROM vols";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                v = new Vol();
                v.setIdVol(rs.getInt(1));
                v.setStart_city(rs.getString(2));
                v.setEnd_city(rs.getString(3));
                v.setEscale(rs.getString(4));
                v.setPrix(rs.getInt(5));
                v.setStart_date_time(rs.getString(6));
                v.setEnd_date_time(rs.getString(7));
                list.add(v);
            }
            
        }catch(Exception e){
            e.getMessage();
        }
        
        return list;
    }
    
    
    public Vol getVolById(int id) {
         Vol  v= null;
        
        try{
            
            Connection connection = getConnection();
            String sql = "SELECT * FROM vols where idVol=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                v = new Vol();
                v.setIdVol(rs.getInt(1));
                v.setStart_city(rs.getString(2));
                v.setEnd_city(rs.getString(3));
                v.setEscale(rs.getString(4));
                v.setPrix(rs.getInt(5));
                v.setStart_date_time(rs.getString(6));
                v.setEnd_date_time(rs.getString(7));
            }
            
        }catch(Exception e){
            e.getMessage();
        }
       return v;
    }
    
    
    public String updateVol(Vol vol) {
        
         boolean added = false;
        String res = "";
        
        try {
            Connection connection = getConnection();
            String sql = "UPDATE vols SET start_city=?, end_city=?, escale=?, prix=?, start_date_time=?, end_date_time=? WHERE idVol=?";
        
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, vol.getStart_city());
            ps.setString(2, vol.getEnd_city());
            ps.setString(3,vol.getEscale());
            ps.setInt(4, vol.getPrix());
            ps.setString(5,vol.getStart_date_time());
            ps.setString(6, vol.getEnd_date_time());
            ps.setInt(7, vol.getIdVol());
            
            ps.executeUpdate();
            res = "success";
                        
        } catch (SQLException ex) {
            res = ex.getMessage();
            ex.printStackTrace();
        }
        
        return res;
    }
    
    
    public boolean deleteVol(int idVol){
        boolean d = false;
        
        try{
             Connection connection = getConnection();
            String sql = "DELETE FROM vols where idVol=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idVol);
             int row = ps.executeUpdate();
             if(row > 0) {
                 d = true;
             }
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return d;
    }
    
    
    public String nb_bookings() {
        
        Vol  v= null;
        int nb = 0;
        String s ="nothing";
        
        try{
            Connection connection = getConnection();
            String query = "SELECT count(idbooking) AS nb_booking FROM bookings";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();    
            if(rs.next()){
                 v = new Vol();
                v.setIdVol(rs.getInt(1));
            }
            
        }catch(Exception ex){
            ex.printStackTrace();
            s= ex.getMessage();
        }
        
        return s;
    }
}
