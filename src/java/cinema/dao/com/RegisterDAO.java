/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;

import cinema.model.com.Register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author oshan
 */
public class RegisterDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "1111";

    private static final String INSERT_USER_SQL = 
        "INSERT INTO customers (fullname, nic, email, phone, password) VALUES (?, ?, ?, ?, ?)";

    public boolean RegisterForm(Register register) {
        boolean rowInserted = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement statement = connection.prepareStatement(INSERT_USER_SQL)) {

                statement.setString(1,register.getFullname());
                statement.setString(2,register.getNic());
                statement.setString(3,register.getEmail());
                statement.setString(4,register.getPhone());
                statement.setString(5,register.getPassword());

                rowInserted = statement.executeUpdate() > 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return rowInserted;
    }
}

