package com.servlets;

import com.dao.StudentDAO;
import com.beans.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/saveStudent")
public class StudentSaveServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("admin") == null) {
            resp.sendRedirect("login");
            return;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Student s = new Student();
        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            s.setId(Integer.parseInt(idStr));
        }
        s.setNom(req.getParameter("nom"));
        s.setPrenom(req.getParameter("prenom"));
        s.setEmail(req.getParameter("email"));
        s.setAdresse(req.getParameter("adresse"));
        try {
            s.setDateNaissance(sdf.parse(req.getParameter("date_naissance")));
        } catch (Exception e) {
            e.printStackTrace();
        }
        dao.save(s);
        resp.sendRedirect("students");
    }
}
