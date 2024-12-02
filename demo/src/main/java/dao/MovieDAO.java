package dao;

import connection.DBConnection;
import dto.Movie;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    public void addMovie(Movie mov) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO movies(mid, name, price, description, image_path) VALUES(?,?,?,?,?)";

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

    public List<Movie> getAllMovies() throws SQLException, ClassNotFoundException {
        List<Movie> movies = new ArrayList<>();

        String query = "SELECT * FROM movies";

        try (Connection con = DBConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Movie movie = new Movie();

                movie.setId(rs.getInt("mid"));
                movie.setTitle(rs.getString("mname"));
                movie.setPrice(rs.getString("price"));
                movie.setDesc(rs.getString("description"));
                movie.setImagePath(rs.getString("image_path"));
                movies.add(movie);
            }


        }catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }



}
