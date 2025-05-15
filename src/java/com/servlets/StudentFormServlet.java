package com.servlets;

import com.dao.StudentDAO;
import com.beans.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/studentForm")
public class StudentFormServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("admin") == null) {
            resp.sendRedirect("login");
            return;
        }
        String action = req.getParameter("action");
        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Student s = dao.findById(id);
            req.setAttribute("student", s);
        }
        req.getRequestDispatcher("/WEB-INF/pages/studentForm.jsp").forward(req, resp);
    }
}
