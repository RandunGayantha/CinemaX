/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;
import cinema.model.com.Bookings;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author oshan
 */
public class ViewCustomerBookingsDAO {
   
     private final String JDBC_URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem"; 
    private final String DB_USER = "root"; 
    private final String DB_PASS = "1111";

    public List<Bookings> getBookingsByCustomerId(int customerId) {
        List<Bookings> bookingsList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT * FROM booking WHERE customer_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, customerId);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            Bookings booking = new Bookings();
                            booking.setId(rs.getInt("id"));
                            booking.setCustomerId(rs.getInt("customer_id"));
                            booking.setFilmName(rs.getString("film_name"));
                            booking.setShowTime(rs.getString("show_time"));
                            booking.setSeat(rs.getString("seat"));
                            bookingsList.add(booking);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return bookingsList;
    }
}
