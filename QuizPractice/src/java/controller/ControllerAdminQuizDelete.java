/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OptionDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import dao.QuizResultDAO;
import dao.StudentWorkDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

/**
 *
 * @author DELL
 */
public class ControllerAdminQuizDelete extends HttpServlet {

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
        OptionDAO optionDao = new OptionDAO();
        StudentWorkDAO studentWorkDao = new StudentWorkDAO();
        QuizResultDAO quizResultDao = new QuizResultDAO();

        int quizId = Integer.parseInt(request.getParameter("quizId"));

        ArrayList<Question> listQuestion = questionDao.getListQuestion(quizId);
        try {
            for (Question question : listQuestion) {
                studentWorkDao.deleteStudentWorkByQuestionId(question.getQuestionId());
                optionDao.deleteOptionByQuestionId(question.getQuestionId());
                questionDao.deleteQuestionByQuestionId(quizId);
            }
            quizResultDao.deleteQuizResultByQuizId(quizId);
            response.sendRedirect(request.getContextPath() + "/admin/quiz");

            quizDao.delete(quizId);
        } catch (IOException e) {
            response.sendRedirect(request.getContextPath() + "/admin/quiz");
        }
    }

}
