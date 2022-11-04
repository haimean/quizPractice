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
 * @author nguyen lê hùng
 */
public class QuizListController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        QuizDAO dao = new QuizDAO();
        SubjectDAO subject = new SubjectDAO();
        int perPage = 9;
        ArrayList<Quiz> list = dao.getAll(index,perPage);
        ArrayList<Subject> listS = subject.getAllSubjcet();
        //số lượng trang
        int numberPage = dao.numberOfPages(perPage);
        request.setAttribute("searchQuiz", false);
        request.setAttribute("numberP", numberPage);
        request.setAttribute("lisQuiz", list);
        request.setAttribute("listSubject", listS);
        request.setAttribute("tagP", index);
        request.getRequestDispatcher("view/quizList.jsp").forward(request, response);
    }

}
