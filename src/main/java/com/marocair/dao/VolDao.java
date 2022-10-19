package com.marocair.dao;

import com.marocair.model.Vol;
import com.marocair.model.ReservationBean;
import com.marocair.model.SendMail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;

public class VolDao extends DbConnection {

    public  static List myArrayList = new ArrayList();
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


    public String registerres(ReservationBean reservationBean) throws MessagingException, IOException
    {
        int nb_places = reservationBean.getNb_places();
        int idVol = reservationBean.getidVol();
        String typeBooking = reservationBean.getTypeBooking();
        String classe = reservationBean.getClasse();

        PreparedStatement preparedStatement = null;
        try
        {
            Connection connection = getConnection();
            LoginDao loginDao=new LoginDao();
           int  iduser=loginDao.id_user;
            String query = "insert into bookings(iduser ,idvol,nb_places,typebooking,status,classe) values (?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, iduser);
            preparedStatement.setInt(2, idVol);
            preparedStatement.setInt(3, nb_places);
            preparedStatement.setString(4, typeBooking);
            preparedStatement.setString(5, "confirm");
            preparedStatement.setString(6, classe);

            int i= preparedStatement.executeUpdate();

            String sql = "SELECT * FROM bookings INNER JOIN users ON users.iduser  = bookings.iduser INNER JOIN vols ON vols.idvol = bookings.idvol WHERE  bookings.iduser  = '" + iduser + "' and  bookings.idvol   = '" + idVol + "' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                typeBooking=rs.getString("typeBooking");
                myArrayList.add(typeBooking);
                nb_places=rs.getInt("nb_places");
                myArrayList.add(nb_places);
                String start_city=rs.getString("start_city");
                myArrayList.add(start_city);
                String end_city=rs.getString("end_city");
                myArrayList.add(end_city);
                String start_date_time= rs.getString("start_date_time");
                myArrayList.add(start_date_time);

                String end_date_time= rs.getString("end_date_time");
                myArrayList.add(end_date_time);
            }
            System.out.println(myArrayList);
            
            
            if (i!=0) {  //Just to ensure data has been inserted into the database
                 SendMail sendMail=new SendMail();

                sendMail.go(loginDao.email);
                return "SUCCESS";
                }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return e.getMessage();
        }
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
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
