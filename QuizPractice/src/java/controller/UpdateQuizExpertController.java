/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDAO;
import dao.QuizDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author DELL
 */
public class UpdateQuizExpertController extends HttpServlet {

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
        QuestionDAO questionDao = new QuestionDAO();
        SubjectDAO subjectDao = new SubjectDAO();
        ArrayList<Subject> listS = subjectDao.getAllSubjcet();
        request.setAttribute("listSubject", listS);
        String quizId = request.getParameter("quizId");
        Quiz quiz = quizDao.getQuizByID(quizId);
        ArrayList<Question> listQuestion = new ArrayList<>();
        listQuestion = questionDao.getAllQuestionsByQuizId(Integer.parseInt(quizId));
        request.setAttribute("quiz", quiz);
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("hour", quiz.getQuizDuration().getHours());
        request.setAttribute("minus", quiz.getQuizDuration().getMinutes());
        request.setAttribute("second", quiz.getQuizDuration().getSeconds());
        request.getRequestDispatcher("view/updateQuizDetailAndQuestion.jsp").forward(request, response);
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
        String quizName = request.getParameter("quizName");
        int subjectId = Integer.parseInt(request.getParameter("subject"));
        int hour = Integer.parseInt(request.getParameter("hour"));
        int minus = Integer.parseInt(request.getParameter("minus"));
        int second = Integer.parseInt(request.getParameter("second"));
        Time quizDuration = new Time(hour, minus, second);
        String description = request.getParameter("description");
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        QuizDAO quizDao = new QuizDAO();
        quizDao.updateQuiz(quizId, quizName, quizDuration, subjectId, description);
        response.sendRedirect("QuizListExpertController");
    }

}
