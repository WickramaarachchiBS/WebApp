package org.example.demo.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demo.dao.movieServices;
import org.example.demo.dto.movies;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminMovies", value = "/adminMovies")
public class adminMovies extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            //create instance of movie services
            movieServices mc = new movieServices();

            //get all movies from database
            List<movies> moviesList = movieServices.getAllMovies();

            //set the movie list as a request attribute
            request.setAttribute("moviesList", moviesList);

            //forward to admin page
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}