/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cinema.controller.com;

import cinema.dao.com.PaymentDAO;
import cinema.model.com.Payment;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Rajith Dewmina
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String film = (String) session.getAttribute("film");
        String time = (String) session.getAttribute("time");
        String seats = (String) session.getAttribute("seats");
        Integer amount = (Integer) session.getAttribute("amount");
        Integer customerId = 1; // Replace with real session-based ID if available

        if (film == null || time == null || seats == null || amount == null) {
            response.getWriter().println("Missing payment details.");
            return;
        }

        // Create payment object
        Payment payment = new Payment();
        payment.setCustomerId(customerId);
        payment.setFilmName(film);
        payment.setShowTime(time);
        payment.setSeats(seats);
        payment.setAmount(amount);
        payment.setStatus("Paid");

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cinematicketsbookingsystem", "root", "1111")) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            PaymentDAO paymentDAO = new PaymentDAO(conn);
            paymentDAO.insertPayment(payment);

            // Clear session attributes
            session.removeAttribute("film");
            session.removeAttribute("time");
            session.removeAttribute("seats");
            session.removeAttribute("amount");

            // Redirect to confirmation page
            response.sendRedirect("paymentSuccess.jsp");

        } catch (Exception e) {
            throw new ServletException("Payment failed", e);
        }
    }
}