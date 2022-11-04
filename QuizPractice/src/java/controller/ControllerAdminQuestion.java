/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OptionDAO;
import dao.QuestionDAO;
import dao.QuizDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import logic.SaveImage;
import model.Option;
import model.Question;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class ControllerAdminQuestion extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = 0;
        HttpSession session = request.getSession();
        String id = request.getParameter("quizId");
        if (id != null) {
            quizId = Integer.parseInt(id);
            session.setAttribute("quizID", quizId);
        } else {
            String a = session.getAttribute("quizID").toString();
            quizId = Integer.parseInt(a);
        }
        QuestionDAO daoQuestion = new QuestionDAO();
        OptionDAO daoOption = new OptionDAO();
        QuizDAO quiz = new QuizDAO();
        ArrayList<Question> listQuestion = daoQuestion.getListQuestion(quizId);
        for (Question question : listQuestion) {
            question.setMedia(request.getContextPath() + "/img/" + question.getMedia());
        }
        ArrayList<Option> listOption = daoOption.getListOption(quizId);
        request.setAttribute("alert", "1");
        request.setAttribute("quizName", quiz.getQuizByQuizId(quizId));
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("listOption", listOption);
        request.getRequestDispatcher("/view/admin/question/adminQuestion.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuestionDAO daoQuestion = new QuestionDAO();
        OptionDAO daoOption = new OptionDAO();
        QuizDAO quiz = new QuizDAO();
        String nameQuestion = request.getParameter("nameQ");

        int quizId = request.getSession().getAttribute("quizID").toString() != null
                ? Integer.parseInt(request.getSession().getAttribute("quizID").toString())
                : 0;
        quizId = request.getParameter("quizId") != null ? Integer.parseInt(request.getParameter("quizId")) : 0;
        if (quizId == 0) {
            response.sendRedirect(request.getContextPath() + "/admin/quiz");
        } else {

            String explanation = request.getParameter("exp");
            Part part = request.getPart("image");
            if (part.getSize() == 0) {
                daoQuestion.addNewQuestion(quizId, nameQuestion, "", explanation);
            } else {
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                try {
                    SaveImage saveImage = new SaveImage();
                    saveImage.saveiMage(part, filename);
                    daoQuestion.addNewQuestion(quizId, nameQuestion, filename, explanation);
                } catch (IOException e) {
                }
            }
            int questionId = daoQuestion.getLastIdQuestion();
            String[] option = { request.getParameter("op1"), request.getParameter("op2"), request.getParameter("op3"),
                    request.getParameter("op4") };
            String correctAnswer = request.getParameter("ca");
            int selectCorrectAnswer = Integer.parseInt(correctAnswer);
            for (int i = 0; i < option.length; i++) {
                if (i == (selectCorrectAnswer - 1)) {
                    daoOption.addNewOption(questionId, option[i], "True");
                } else {
                    daoOption.addNewOption(questionId, option[i], "False");
                }
            }

            int numberQ = daoQuestion.getTotalQuestion(quizId);
            daoQuestion.updateNumberQuestion(numberQ, quizId);
            ArrayList<Question> listQuestion = daoQuestion.getListQuestion(quizId);
            for (Question question : listQuestion) {
                question.setMedia(request.getContextPath() + "/img/" + question.getMedia());
            }
            ArrayList<Option> listOption = daoOption.getListOption(quizId);
            request.setAttribute("alert", "1");
            request.setAttribute("quizName", quiz.getQuizByQuizId(quizId));
            request.setAttribute("listQuestion", listQuestion);
            request.setAttribute("listOption", listOption);
        }
        request.getRequestDispatcher("/view/admin/question/adminQuestion.jsp").forward(request, response);
    }
}
