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
    if (req.getSession().getAttribute("admin") == null) {
        resp.sendRedirect("login");
        return;
    }

    String searchKeyword = req.getParameter("search");
    String pageStr = req.getParameter("page");
    int page = 1;
    int recordsPerPage = 10;

    if (pageStr != null && !pageStr.isEmpty()) {
        page = Integer.parseInt(pageStr);
    }

    List<Student> list;
    int count;

    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        list = dao.search(searchKeyword); // ou faire une pagination ici aussi si tu veux
        count = dao.countSearch(searchKeyword);
        req.setAttribute("search", searchKeyword);
    } else {
        int offset = (page - 1) * recordsPerPage;
        list = dao.findPaginated(offset, recordsPerPage);
        count = dao.count();
    }

    int totalPages = (int) Math.ceil((double) count / recordsPerPage);

    req.setAttribute("students", list);
    req.setAttribute("count", count);
    req.setAttribute("currentPage", page);
    req.setAttribute("totalPages", totalPages);
    req.getRequestDispatcher("/WEB-INF/pages/studentList.jsp").forward(req, resp);
}

}