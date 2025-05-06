package cinema.dao.com;

import java.sql.*;
import java.util.*;

public class FilmAdminDAO {
    private final String URL = "jdbc:mysql://localhost:3306/cinematicketsbookingsystem";
    private final String USER = "root";
    private final String PASS = "1111";

    public List<Map<String, String>> getAllFilms() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT * FROM films";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("title", rs.getString("title"));
                row.put("duration", rs.getString("duration"));
                row.put("language", rs.getString("language"));
                row.put("release_date", rs.getString("release_date"));
                row.put("description", rs.getString("description"));
                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteFilm(int id) {
        String sql = "DELETE FROM films WHERE id = ?";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
