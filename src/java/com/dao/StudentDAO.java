package com.dao;

import com.beans.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> findAll() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM etudiant";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setNom(rs.getString("nom"));
                s.setPrenom(rs.getString("prenom"));
                s.setEmail(rs.getString("email"));
                s.setAdresse(rs.getString("adresse"));
                s.setDateNaissance(rs.getDate("date_naissance"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Student findById(int id) {
        String sql = "SELECT * FROM etudiant WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setNom(rs.getString("nom"));
                s.setPrenom(rs.getString("prenom"));
                s.setEmail(rs.getString("email"));
                s.setAdresse(rs.getString("adresse"));
                s.setDateNaissance(rs.getDate("date_naissance"));
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean save(Student s) {
        if (s.getId() > 0) {
            // UPDATE
            String sql = "UPDATE etudiant SET nom=?, prenom=?, email=?, adresse=?, date_naissance=? WHERE id=?";
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, s.getNom());
                ps.setString(2, s.getPrenom());
                ps.setString(3, s.getEmail());
                ps.setString(4, s.getAdresse());
                ps.setDate(5, new java.sql.Date(s.getDateNaissance().getTime()));
                ps.setInt(6, s.getId());
                return ps.executeUpdate() == 1;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            // INSERT
            String sql = "INSERT INTO etudiant (nom, prenom, email, adresse, date_naissance) VALUES (?, ?, ?, ?, ?)";
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, s.getNom());
                ps.setString(2, s.getPrenom());
                ps.setString(3, s.getEmail());
                ps.setString(4, s.getAdresse());
                ps.setDate(5, new java.sql.Date(s.getDateNaissance().getTime()));
                return ps.executeUpdate() == 1;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM etudiant WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int count() {
        String sql = "SELECT COUNT(*) FROM etudiant";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
     public List<Student> search(String keyword) {
    List<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM etudiant WHERE nom LIKE ? OR prenom LIKE ? OR email LIKE ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        String kw = "%" + keyword.trim() + "%";
        ps.setString(1, kw);
        ps.setString(2, kw);
        ps.setString(3, kw);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setNom(rs.getString("nom"));
                s.setPrenom(rs.getString("prenom"));
                s.setEmail(rs.getString("email"));
                s.setAdresse(rs.getString("adresse"));
                s.setDateNaissance(rs.getDate("date_naissance"));
                list.add(s);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
    public int countSearch(String keyword) {
    String sql = "SELECT COUNT(*) FROM etudiant WHERE nom LIKE ? OR prenom LIKE ? OR email LIKE ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        String kw = "%" + keyword.trim() + "%";
        ps.setString(1, kw);
        ps.setString(2, kw);
        ps.setString(3, kw);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
}
