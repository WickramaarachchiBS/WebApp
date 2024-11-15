package org.example.demo.controller;
import org.example.demo.dto.movies;
import org.example.demo.dao.movieServices;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addMovieServlet", value = "/addMovieServlet")
@MultipartConfig
public class addMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //create object from movies class
        movies mov = new movies();

        //retrieve data from jsp
        mov.setmId(Integer.parseInt(request.getParameter("movieId")));
        mov.setmName(request.getParameter("movieName"));
        mov.setPrice(Integer.parseInt(request.getParameter("mPrice")));
        mov.setDesc(request.getParameter("mDesc"));

        movieServices mc = new movieServices();
        mc.addMovie(mov);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);


        // Handle image upload using libraries (replace with your implementation)
//        Part filePart = request.getPart("mImage");
//        String fileName = filePart.getSubmittedFileName();

        //define path where u want to save the uploaded file
    }
}