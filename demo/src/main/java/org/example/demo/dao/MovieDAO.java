package org.example.demo.dao;
import org.example.demo.connection.DBConnection;
import org.example.demo.dto.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class MovieDAO {
    public void addMovie(Movie mov) {

        String query = "INSERT INTO movies(mid, mname, price, description, image_path) VALUES (?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            //set parameters
            stmt.setInt(1, mov.getId());
            stmt.setString(2, mov.getTitle());
            stmt.setString(3, mov.getPrice());
            stmt.setString(4, mov.getDesc());
            stmt.setString(5, mov.getImagePath());

            stmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
