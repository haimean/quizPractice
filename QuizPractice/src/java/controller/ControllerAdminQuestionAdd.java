/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OptionDAO;
import dao.QuestionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class ControllerAdminQuestionAdd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuestionDAO q = new QuestionDAO();
        OptionDAO op = new OptionDAO();
        String Id = request.getParameter("quizID");
        int QuizID = Integer.parseInt(Id);
        String nameQuestion = request.getParameter("nameQ");
        String explanation = request.getParameter("exp");
        String img = request.getParameter("img");
        if(img.length() != 0){
            img = request.getParameter("img");
        }else{
            img = null;
        }

        q.addNewQuestion(QuizID, nameQuestion, img, explanation);
        int questionId = q.getLastIdQuestion();

        String[] option = {request.getParameter("op1"), request.getParameter("op2"), request.getParameter("op3"),
            request.getParameter("op4")};
        String correctAnswer = request.getParameter("ca");
        int selectCorrectAnswer = Integer.parseInt(correctAnswer);
        boolean a = false;

        for (int i = 0; i < option.length; i++) {
            if (i == (selectCorrectAnswer - 1)) {
                op.addNewOption(questionId, option[i], "True");
            } else {
                op.addNewOption(questionId, option[i], "False");
            }
        }

       
        int numberQ = q.getTotalQuestion(Id);
        q.updateNumberQuestion(numberQ, Id);
        response.sendRedirect("ManagermentQuestion");
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
