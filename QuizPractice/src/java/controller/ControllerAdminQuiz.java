/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import model.*;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class ControllerAdminQuiz extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuizDAO quizDao = new QuizDAO();
        SubjectDAO subjectDao = new SubjectDAO();
        int subjectId = request.getParameter("subjectId") != null ? Integer.parseInt(request.getParameter("subjectId")) : 0;
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int perPage = 10;
        ArrayList<Subject> subjects = subjectDao.getAllSubjcet();
        int totalPage = quizDao.numberOfPages(perPage);
        ArrayList<Quiz> quizs = new ArrayList<>();
        if (subjectId == 0) {
            quizs = quizDao.getAll(page, perPage);
        } else {
            quizs = quizDao.getBySubject(page, perPage, subjectId);
        }
        request.setAttribute("quizs", quizs);
        request.setAttribute("subjects", subjects);
        request.setAttribute("subjectId", subjectId);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("page", page);
        request.getRequestDispatcher("/view/admin/quiz/adminQuiz.jsp").forward(request, response);
    }

}
