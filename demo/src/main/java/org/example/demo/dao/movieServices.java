package org.example.demo.dao;
import org.example.demo.connection.DBConnection;
import org.example.demo.dto.movies;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class movieServices {
    public void addMovie(movies mov, InputStream imageInputStream) {
        try {
            //SQL query
            String query = "INSERT INTO movies(mid, mname, price, description, image) VALUES(?, ?, ?, ?, ?)";

            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(query);

            stmt.setInt(1, mov.getmId());
            stmt.setString(2, mov.getmName());
            stmt.setInt(3, mov.getPrice());
            stmt.setString(4, mov.getDesc());

            //set th image input stream as a parameter
            if (imageInputStream != null) {
                stmt.setBlob(5, imageInputStream); //use setBlob for blob type
            }

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve all movies
    public static List<movies> getAllMovies() throws SQLException, ClassNotFoundException {
        List<movies> moviesList = new ArrayList<>();

        String query = "SELECT mid, mname, price, description, image FROM movies";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                movies mov = new movies();

                mov.setmId(rs.getInt("mid"));
                mov.setmName(rs.getString("mname"));
                mov.setPrice(rs.getInt("price"));
                mov.setDesc(rs.getString("description"));
                mov.setImage(rs.getBlob("image"));

                moviesList.add(mov);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return moviesList;
    }
}

