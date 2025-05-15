package com.servlets;

import com.beans.Admin;
import com.dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private AdminDAO dao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String mdp = req.getParameter("mot_de_passe");

        Admin admin = new Admin(nom, email, mdp);
        if (dao.register(admin)) {
            resp.sendRedirect("login");
        } else {
            req.setAttribute("error", "Impossible de s'inscrire");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
