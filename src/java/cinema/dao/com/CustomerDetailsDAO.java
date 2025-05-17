/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;

import cinema.model.com.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author oshan
 */
public class CustomerDetailsDAO {
  private final String JDBC_URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem"; 
    private final String DB_USER = "root"; 
    private final String DB_PASS = "1111";

    public Customer validateCustomer(String nic, String password) {
        Customer customer = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT * FROM customers WHERE nic = ? AND password = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nic);
                    stmt.setString(2, password);

                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            customer = new Customer();
                            customer.setId(rs.getInt("id"));
                            customer.setFullname(rs.getString("fullname"));
                            customer.setNic(rs.getString("nic"));
                            customer.setEmail(rs.getString("email"));
                            customer.setPhone(rs.getString("phone"));
                            customer.setPassword(rs.getString("password"));
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }
}
