package controller;
import dao.MovieDAO;
import dto.Movie;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "retrieveMoviesServlet", value = "/retrieveMoviesServlet")
public class retrieveMoviesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            MovieDAO dao = new MovieDAO();

            List<Movie> movies = dao.getAllMovies();
            request.setAttribute("movies", movies);

            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}