/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;

import cinema.model.com.AddFilm;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author oshan
 */
public class AddFilmDAO {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem";
    private final String DB_USER = "root";
    private final String DB_PASS = "1111";

    public boolean addFilm(AddFilm film) {
        boolean success = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn =DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
                String sql = "INSERT INTO films (title, genre, duration, language, release_date, description) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, film.getTitle());
                    stmt.setString(2, film.getGenre());
                    stmt.setInt(3, film.getDuration());
                    stmt.setString(4, film.getLanguage());
                    stmt.setDate(5, film.getReleaseDate());
                    stmt.setString(6, film.getDescription());

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        success = true;
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
    public List<AddFilm> getAllFilms() {
    List<AddFilm> films;
        films = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT * FROM films";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    AddFilm film = new AddFilm();
                    film.setTitle(rs.getString("title"));
                    film.setGenre(rs.getString("genre"));
                    film.setDuration(rs.getInt("duration"));
                    film.setLanguage(rs.getString("language"));
                    film.setReleaseDate(rs.getDate("release_date"));
                    film.setDescription(rs.getString("description"));
                    films.add(film);
                }
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
    }
      return films;}}
    


