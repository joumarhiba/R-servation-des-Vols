package com.marocair.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.marocair.model.RegisterBean;
import java.util.Random;
;

public class RegisterDao  extends DbConnection {
    public String registerUser(RegisterBean registerBean)
    {
        String fullName = registerBean.getFullName();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();
        int code = new Random().nextInt(99)+1;
        int role = 1;

  Connection connection = getConnection();
  PreparedStatement preparedStatement = null;
        try
        {
           String query = "insert into users(code,fullname,email,password,role) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, code);
            preparedStatement.setString(2, fullName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, password);
            preparedStatement.setInt(5, role);

            int i= preparedStatement.executeUpdate();

            if (i!=0)  //Just to ensure data has been inserted into the database
                return "SUCCESS";
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        return "Oops.. Something went wrong there..! "+e.getMessage();  // On failure, send a message from here.
        }
        return "out ";
    }
}