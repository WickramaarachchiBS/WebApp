package org.example.demo.dao;

import org.example.demo.connection.DBConnection;
import org.example.demo.dto.movies;

import java.sql.Statement;

public class movieServices {
    public void addMovie(movies mov){
        try {
            //SQL query
            String query = "INSERT INTO movies(mid, mname, price, description) VALUES('"+mov.getmId()+"','"+mov.getmName()+"','"+mov.getPrice()+"','"+mov.getDesc()+"')";

            // Statement object is created to execute the SQL query
            Statement stmt = DBConnection.getConnection().createStatement();
            stmt.executeUpdate(query);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
