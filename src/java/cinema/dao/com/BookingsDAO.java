/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;
import java.sql.PreparedStatement;

import cinema.model.com.Bookings;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author oshan
 */
public class BookingsDAO {

   

   private final Connection connection;

    public BookingsDAO(Connection connection) {
        this.connection = connection;
    }

    public void insertBooking(Bookings booking) throws SQLException {
        String sql = "INSERT INTO booking (customer_id, film_name, show_time, seat) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, booking.getCustomerId());
            stmt.setString(2, booking.getFilmName());
            stmt.setString(3, booking.getShowTime());
            stmt.setString(4, booking.getSeat());
            stmt.executeUpdate();
        }
    }

    public List<String> getAllFilmNames() throws SQLException {
        List<String> films = new ArrayList<>();
        String sql = "SELECT title FROM films";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                films.add(rs.getString("title"));
            }
        }
        return films;
    }
}
