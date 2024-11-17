package org.example.demo.controller;
import org.example.demo.connection.DBConnection;
import org.example.demo.dto.movies;
import org.example.demo.dao.movieServices;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

@WebServlet(name = "imageServlet", value = "/imageServlet")
public class imageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String imageId = request.getParameter("id");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT image FROM movies WHERE mid=?");

            stmt.setString(1, imageId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Blob blob = rs.getBlob("image");
                byte[] imageBytes = blob.getBytes(1, (int) blob.length());

                response.setContentType("image/jpeg");
                OutputStream os = response.getOutputStream();
                os.write(imageBytes);
                os.flush();
                os.close();
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}