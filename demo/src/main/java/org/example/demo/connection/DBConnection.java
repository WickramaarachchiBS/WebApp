package org.example.demo.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {

        //database credentials
        String url = "jdbc:mysql://localhost:3306/test1";
        String username = "root";
        String password = "scorehero";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }

        //connect to db
        return DriverManager.getConnection(url, username, password);
    }
}
