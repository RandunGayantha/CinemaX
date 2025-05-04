/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;

/**
 *
 * @author oshan
 */
import cinema.model.com.Admin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    private final String JDBC_URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem"; 
    private final String DB_USER = "root"; 
    private final String DB_PASS = "1111";     

    public Admin validateAdmin(String username, String password) {
        Admin admin = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT*FROM admin WHERE username=? AND password=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1,username);
                   stmt.setString(2,password);
                    try (ResultSet rs =stmt.executeQuery()) {
                        if (rs.next()) {
                            admin =new Admin();
                            admin.setId(rs.getInt("id"));
                             admin.setUsername(rs.getString("username"));
                                 admin.setPassword(rs.getString("password"));
                        }
                    }
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); 
        }

        return admin;
    }
}


