package org.example.demo.dao;

import jakarta.servlet.http.Part;
import org.example.demo.connection.DBConnection;
import org.example.demo.dto.movies;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class movieServices {
    public void addMovie(movies mov, InputStream imageInputStream) {
        try {
            //SQL query
            String query = "INSERT INTO movies(mid, mname, price, description, image) VALUES(?, ?, ?, ?, ?)";

            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(query);

            stmt.setInt(1, mov.getmId());
            stmt.setString(2, mov.getmName());
            stmt.setInt(3, mov.getPrice());
            stmt.setString(4,mov.getDesc());

            //set th image input stream as a parameter
            if(imageInputStream != null) {
                stmt.setBlob(5, imageInputStream); //use setBlob for blob type
            }

            stmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
