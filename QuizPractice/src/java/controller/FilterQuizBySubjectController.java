/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuizDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Quiz;
import model.Subject;

/**
 *
 * @author nguye
 */
public class FilterQuizBySubjectController extends HttpServlet {

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
        String subjectID = request.getParameter("subjectID");
        QuizDAO quiz = new QuizDAO();
        SubjectDAO dao = new SubjectDAO();
        ArrayList<Subject> listS = dao.getAllSubjcet();
        ArrayList<Quiz> list = quiz.getAllQuizBySubject(subjectID);
        request.setAttribute("lisQuiz", list);
        request.setAttribute("listSubject", listS);
        request.setAttribute("tag", subjectID);
        request.getRequestDispatcher("view/quizList.jsp").forward(request, response);
    }

}
