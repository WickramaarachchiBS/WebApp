package org.example.demo.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //database credentials
        String url = "jdbc:mysql://localhost:3306/loginreg2";
        String username = "root";
        String password = "scorehero";

        //This line loads the MySQL JDBC driver class
        Class.forName("com.mysql.cj.jdbc.Driver");

        //connect to db
        return DriverManager.getConnection(url, username, password);
    }
}
