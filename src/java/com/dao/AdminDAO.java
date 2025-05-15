package com.dao;

import com.beans.Admin;
import java.sql.*;

public class AdminDAO {

    public boolean register(Admin admin) {
        String sql = "INSERT INTO administrateur (nom, email, mot_de_passe) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, admin.getNom());
            ps.setString(2, admin.getEmail());
            ps.setString(3, admin.getMotDePasse());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Admin login(String email, String password) {
        String sql = "SELECT * FROM administrateur WHERE email = ? AND mot_de_passe = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin a = new Admin();
                a.setId(rs.getInt("id"));
                a.setNom(rs.getString("nom"));
                a.setEmail(rs.getString("email"));
                a.setMotDePasse(rs.getString("mot_de_passe"));
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
