/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cinema.controller.com;

import cinema.dao.com.PaymentsDAO;
import cinema.model.com.Payments;
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

        String cardName = request.getParameter("cardName");
        String film = request.getParameter("film");
        String time = request.getParameter("time");
        String seats = request.getParameter("seats");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Payments payment = new Payments();
        payment.setCustomerId(1); // or get from session
        payment.setCardName(cardName);
        payment.setFilmName(film);
        payment.setShowTime(time);
        payment.setSeats(seats);
        payment.setAmount(amount);

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinematicketsbookingsystem", "root", "1111")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            PaymentsDAO dao = new PaymentsDAO(conn);
            dao.insertPayment(payment);

            // Forward to success page with data
            request.setAttribute("cardName", cardName);
            request.setAttribute("film", film);
            request.setAttribute("time", time);
            request.setAttribute("seats", seats);
            request.setAttribute("amount", amount);

            request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Payment failed", e);
        }
    }
}