/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;
import cinema.model.com.Payments;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



/**
 *
 * @author Rajith Dewmina
 */


public class PaymentsDAO {
    private Connection conn;

    public PaymentsDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean insertPayment(Payments payment) throws SQLException {
        String sql = "INSERT INTO payments (card_name, card_number, expiry_date, cvv, amount) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, payment.getCardName());
        stmt.setString(2, payment.getCardNumber());
        stmt.setString(3, payment.getExpiryDate());
        stmt.setString(4, payment.getCvv());
        stmt.setDouble(5, payment.getAmount());

        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;
    }
}
