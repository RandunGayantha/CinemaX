/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.dao.com;

import cinema.model.com.Film;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author oshan
 */
public class FilmDAO {
   public List<Film> getAllFilms() {
        List<Film> list = new ArrayList<>();
        try {
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinematicketsbookingsystem", "root", "1111")) {
                String sql = "SELECT * FROM films";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) {
                    Film film = new Film();
                    film.setId(rs.getInt("id"));
                    film.setTitle(rs.getString("title"));
                    film.setGenre(rs.getString("genre"));
                    film.setDuration(rs.getInt("duration"));
                    film.setLanguage(rs.getString("language"));
                    film.setReleaseDate(rs.getString("release_date"));
                    film.setDescription(rs.getString("description"));
                    list.add(film);
                }
            }
        } catch (SQLException e) {
        }
        return list;
    } 
}
