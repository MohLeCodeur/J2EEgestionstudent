package com.servlets;

import com.dao.StudentDAO;
import com.beans.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentListServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Vérifier session
        if (req.getSession().getAttribute("admin") == null) {
            resp.sendRedirect("login");
            return;
        }
        
        // Récupérer le paramètre de recherche
        String searchKeyword = req.getParameter("search");
        List<Student> list;
        int count;
        
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            // Effectuer la recherche si un mot-clé est fourni
            list = dao.search(searchKeyword);
            count = list.size(); // Ou utiliser dao.countSearch(searchKeyword) si vous l'implémentez
            req.setAttribute("search", searchKeyword);
        } else {
            // Sinon, récupérer tous les étudiants
            list = dao.findAll();
            count = dao.count();
        }
        
        req.setAttribute("students", list);
        req.setAttribute("count", count);
        req.getRequestDispatcher("/WEB-INF/pages/studentList.jsp").forward(req, resp);
    }
}