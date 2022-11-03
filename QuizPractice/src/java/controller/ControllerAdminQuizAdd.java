/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import model.*;
import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class ControllerAdminQuizAdd extends HttpServlet {

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
        SubjectDAO subjectDao = new SubjectDAO();
        ArrayList<Subject> subjects = subjectDao.getAllSubjcet();
        request.setAttribute("subjects", subjects);
        request.setAttribute("numberQuestion", 0);
        request.getRequestDispatcher("/view/admin/quiz/adminQuizAdd.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SubjectDAO subjectDao = new SubjectDAO();
        QuizDAO quizDao = new QuizDAO();
        String name = request.getParameter("name").trim();
        if (name != null) {
            int subjectId = request.getParameter("subjectId") != null ? Integer.parseInt(request.getParameter("subjectId")) : 0;
            int hour = request.getParameter("hour") != null ? Integer.parseInt(request.getParameter("hour")) : 0;
            int minus = request.getParameter("minus") != null ? Integer.parseInt(request.getParameter("minus")) : 0;
            int second = request.getParameter("second") != null ? Integer.parseInt(request.getParameter("second")) : 0;
            Time quizDuration = new Time(hour, minus, second);
            String description = request.getParameter("description").trim();
            if (quizDao.add(name, quizDuration, subjectId, description)) {
                response.sendRedirect(request.getContextPath() + "/admin/quiz");
            } else {
                request.setAttribute("mess", "Add quiz fail!");
                request.setAttribute("check", false);
                ArrayList<Subject> subjects = subjectDao.getAllSubjcet();
                request.setAttribute("subjects", subjects);
                request.setAttribute("numberQuestion", 0);
                request.getRequestDispatcher("/view/admin/quiz/adminQuizAdd.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("mess", "Quiz name not empty!");
            request.setAttribute("check", false);
            ArrayList<Subject> subjects = subjectDao.getAllSubjcet();
            request.setAttribute("subjects", subjects);
            request.setAttribute("numberQuestion", 0);
            request.getRequestDispatcher("/view/admin/quiz/adminQuizAdd.jsp").forward(request, response);
        }

    }

}
