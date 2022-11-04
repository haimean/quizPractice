/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import logic.SaveImage;
import model.Subject;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class ControllerAdminSubjectAdd extends HttpServlet {

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
        request.getRequestDispatcher("/view/admin/subject/adminSubjectAdd.jsp").forward(request, response);
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
        boolean checkName = true;
        String nameSubject = request.getParameter("name").trim();
        Part part = request.getPart("image");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String description = request.getParameter("description");
        Subject subject = new Subject(nameSubject, description, filename);
        for (Subject s : subjectDao.getAllSubjcet()) {
            if (s.getSubjectName().equals(nameSubject)) {
                checkName = false;
            }
        }
        if (checkName) {
            if (subjectDao.add(subject)) {
                try {
                    SaveImage saveiamge = new SaveImage();
                    saveiamge.saveiMage(part, filename);
                    response.sendRedirect(request.getContextPath() + "/admin/subject");
                } catch (IOException e) {
                }
            }
        } else {
            request.setAttribute("mess", "Subjeect faild!");
            request.setAttribute("check", false);
            request.setAttribute("name", nameSubject);
            request.setAttribute("description", description);
            request.setAttribute("subjects", nameSubject);
            request.getRequestDispatcher("/view/admin/subject/adminSubjectAdd.jsp").forward(request, response);
        }
    }
}
