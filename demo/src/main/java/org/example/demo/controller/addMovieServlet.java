package org.example.demo.controller;
import org.example.demo.connection.DBConnection;
import org.example.demo.dto.movies;
import org.example.demo.dao.movieServices;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;

@WebServlet(name = "addMovieServlet", value = "/addMovieServlet")
@MultipartConfig
public class addMovieServlet extends HttpServlet {
    public addMovieServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //create object from movies class
        movies mov = new movies();

        try {
            //retrieve data from jsp
            mov.setmId(Integer.parseInt(request.getParameter("movieId")));
            mov.setmName(request.getParameter("movieName"));
            mov.setPrice(Integer.parseInt(request.getParameter("mPrice")));
            mov.setDesc(request.getParameter("mDesc"));

            //handle image upload
            Part filePrt = request.getPart("cardImage");
            InputStream inputStream = filePrt.getInputStream();  //get inputStream of the uploaded file

            //pass the movie and image input stream to service class
            movieServices mc = new movieServices();
            mc.addMovie(mov, inputStream);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}