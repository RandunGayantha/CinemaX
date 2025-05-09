package cinema.dao.com;

import java.sql.*;
import java.util.*;

public class AdminDetailsDAO {
    private final String URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem";
    private final String USER = "root";
    private final String PASS = "1111";

    public List<Map<String, String>> getAllCustomers() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM customers";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("fullname", rs.getString("fullname"));
                row.put("nic", rs.getString("nic"));
                row.put("email", rs.getString("email"));
                row.put("phone", rs.getString("phone"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Map<String, String>> getAllBookings() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT b.id, c.fullname, b.film_name, b.show_time, b.seat FROM booking b JOIN customers c ON b.customer_id = c.id";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("customer", rs.getString("fullname"));
                row.put("film_name", rs.getString("film_name"));
                row.put("show_time", rs.getString("show_time"));
                row.put("seat", rs.getString("seat"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Map<String, String>> getAllPayments() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM payment";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("booking_id", rs.getString("booking_id"));
                row.put("amount", rs.getString("amount"));
                row.put("status", rs.getString("status"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
