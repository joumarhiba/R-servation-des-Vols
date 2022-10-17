package com.marocair.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DbConnection {
    
       private final String jdbcURL = "jdbc:postgresql://localhost:5432/marocair";
        private final String username = "postgres";
        private String password = "1234";
        private Connection connection = null;
        
//        public static void main(String[] args) {
//        DbConnection.getConnection();
//    }
    
    public Connection getConnection() {
              
        
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
            System.out.println(">>>>>>>>>>>>><< connected to Postgresql server");
            
        } catch (SQLException ex) {
            System.out.println("error in connecting to postgresql");
            ex.printStackTrace();
        }  catch (ClassNotFoundException ex) {
               Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
           }
        
        return connection;
        
        
    }
}
