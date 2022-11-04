/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OptionDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import dao.QuizResultDAO;
import dao.StudentWorkDAO;
import dao.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Question;
import model.Quiz;

/**
 *
 * @author haimi
 */
public class ControllerAdminSubjectDelete extends HttpServlet {

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

        int id = Integer.parseInt(request.getParameter("id"));

        QuizDAO quizDao = new QuizDAO();
        QuestionDAO questionDao = new QuestionDAO();
        OptionDAO optionDao = new OptionDAO();
        StudentWorkDAO studentWorkDao = new StudentWorkDAO();
        QuizResultDAO quizResultDao = new QuizResultDAO();
        SubjectDAO subjectDao = new SubjectDAO();
        ArrayList<Quiz> quizs = quizDao.getAllBySubject(id);
        try {
            for (Quiz quiz : quizs) {
                ArrayList<Question> listQuestion = questionDao.getListQuestion(quiz.getQuizId());
                for (Question question : listQuestion) {
                    studentWorkDao.deleteStudentWorkByQuestionId(question.getQuestionId());
                    optionDao.deleteOptionByQuestionId(question.getQuestionId());
                    questionDao.deleteQuestionByQuestionId(quiz.getQuizId());
                }
                quizResultDao.deleteQuizResultByQuizId(quiz.getQuizId());
                quizDao.delete(quiz.getQuizId());
            }
            subjectDao.delete(id);
            response.sendRedirect(request.getContextPath() + "/admin/subject");

        } catch (IOException e) {
            response.sendRedirect(request.getContextPath() + "/admin/subject");
        }
    }

}
