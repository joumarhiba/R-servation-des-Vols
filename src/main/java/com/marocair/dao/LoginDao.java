package com.marocair.dao;

import com.marocair.model.LoginBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao  extends DbConnection {
    
    public static int id_user;
     public  static  String email;

    public String authenticateUser(LoginBean loginBean) {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();

        Statement statement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";
        int roleDB;

        try {
             Connection connection = getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select * from users");

            while (resultSet.next()) {
                id_user=resultSet.getInt("iduser");
                email=resultSet.getString("email");
                userNameDB = resultSet.getString("fullname");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getInt("role");

                if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 0)
                    return "Admin_Role";
                else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 1)
                    return "User_Role";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "Invalid user credentialssssssssss "+userNameDB +" "+passwordDB;
    }
}