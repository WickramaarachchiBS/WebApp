package org.example.demomerge.controller;

import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test1";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "scorehero";

    // Email details
    private static final String EMAIL_FROM = "verusatharasinghapersonal@gmail.com";
    private static final String EMAIL_PASSWORD = "umxd kevv dinz bbhe";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests if needed
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String movieTitle = request.getParameter("movieTitle");
        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String paypalPaymentID = request.getParameter("paypalPaymentID");

        System.out.println("Processing payment for: " + movieTitle);
        System.out.println("Total Price: " + totalPrice);
        System.out.println("Email: " + email);

        try {
            // Save booking details in the database
            if (saveBookingDetails(movieTitle, selectedSeats, totalPrice, username, email)) {
                // Send confirmation email
                boolean emailSent = sendConfirmationEmail(email, username, movieTitle, selectedSeats, totalPrice);

                if (!emailSent) {
                    System.out.println("Warning: Failed to send confirmation email to " + email);
                }

                if (paypalPaymentID != null) {
                    // For PayPal payments, return success status
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    // For card payments, redirect to confirmation page
                    response.sendRedirect("feedback.jsp");
                }
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error storing booking details");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Payment processing failed");
        }
    }

    private boolean saveBookingDetails(String movieTitle, String selectedSeats, String totalPrice, String username, String email) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bookings (movieTitle, selectedSeats, totalPrice, username, email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, movieTitle);
            stmt.setString(2, selectedSeats);
            stmt.setString(3, totalPrice);
            stmt.setString(4, username);
            stmt.setString(5, email);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean sendConfirmationEmail(String to, String username, String movieTitle, String selectedSeats, String totalPrice) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        try {
            jakarta.mail.Session session = jakarta.mail.Session.getInstance(props, new jakarta.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_FROM, EMAIL_PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Movie Ticket Booking Confirmation");

            // Create HTML content for the email
            String htmlContent = String.format("""
                <html>
                <body style='font-family: Arial, sans-serif; color: #333;'>
                    <div style='max-width: 600px; margin: 0 auto; padding: 20px;'>
                        <h1 style='color: #f5c518;'>Booking Confirmation</h1>
                        <p>Dear %s,</p>
                        <p>Thank you for booking your movie tickets! Here are your booking details:</p>
                        <div style='background-color: #f9f9f9; padding: 15px; border-radius: 5px;'>
                            <p><strong>Movie:</strong> %s</p>
                            <p><strong>Seats:</strong> %s</p>
                            <p><strong>Total Amount:</strong> Rs. %s</p>
                        </div>
                        <p>Please arrive at least 15 minutes before the show time.</p>
                        <p>Enjoy your movie!</p>
                        <p>Best Regards,<br>Movie Hub Team</p>
                    </div>
                </body>
                </html>
                """,
                    username != null ? username : "Valued Customer",
                    movieTitle,
                    selectedSeats,
                    totalPrice
            );

            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}