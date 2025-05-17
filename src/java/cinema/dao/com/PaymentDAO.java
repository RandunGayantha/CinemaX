/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;
import cinema.model.com.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author oshan
 */
public class PaymentDAO {
    private final Connection connection;

    public PaymentDAO(Connection connection) {
        this.connection = connection;
    }

    public void insertPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO payments (customer_id, film_name, show_time, seats, amount, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, payment.getCustomerId());
            stmt.setString(2, payment.getFilmName());
            stmt.setString(3, payment.getShowTime());
            stmt.setString(4, payment.getSeats());
            stmt.setInt(5, payment.getAmount());
            stmt.setString(6, payment.getStatus());
            stmt.executeUpdate();
        }
    }
    public List<Payment> getPaymentsByCustomerId(int customerId) throws SQLException {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payments WHERE customer_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, customerId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Payment p = new Payment();
                    p.setCustomerId(rs.getInt("customer_id"));
                    p.setFilmName(rs.getString("film_name"));
                    p.setShowTime(rs.getString("show_time"));
                    p.setSeats(rs.getString("seats"));
                    p.setAmount(rs.getInt("amount"));
                    p.setStatus(rs.getString("status"));
                    payments.add(p);
                }
            }
        }
        return payments;
    }
}
