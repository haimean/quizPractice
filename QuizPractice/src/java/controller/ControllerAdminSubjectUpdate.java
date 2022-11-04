/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import logic.SaveImage;
import model.Subject;

/**
 *
 * @author haimi
 */
public class ControllerAdminSubjectUpdate extends HttpServlet {

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
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        if (id != 0) {
            Subject subject = subjectDao.get(id);
            request.setAttribute("id", subject.getSubjectId());
            request.setAttribute("name", subject.getSubjectName());
            request.setAttribute("description", subject.getDescription());
            request.setAttribute("image", subject.getImage());
            request.getRequestDispatcher("/view/admin/subject/adminSubjectUpdate.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/subject");
        }
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
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        String name = request.getParameter("name").trim();
        Part part = request.getPart("image");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String description = request.getParameter("description").trim();
        if (subjectDao.update(id, name, filename, description)) {
            try {
                SaveImage saveiamge = new SaveImage();
                saveiamge.saveiMage(part, filename);
                response.sendRedirect(request.getContextPath() + "/admin/subject");
            } catch (IOException e) {
            }
        } else {
            Subject subject = subjectDao.get(id);
            request.setAttribute("mess", "Update subjeect faild!");
            request.setAttribute("check", false);
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("description", description);
            request.setAttribute("image", subject.getImage());
            request.getRequestDispatcher("/view/admin/subject/adminSubjectAdd.jsp").forward(request, response);
        }
    }

}
