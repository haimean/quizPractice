/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import model.Subject;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class SubjectDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Subject> getAllSubjcet() {
        ArrayList<Subject> listSubject = new ArrayList<>();
        String query = "select * from Subject";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                listSubject.add(subject);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSubject;
    }

    public boolean add(Subject subject) {
        String query = "INSERT INTO [dbo].[Subject]\n"
                + "           ([subjectName]\n"
                + "           ,[thumbnail]\n"
                + "           ,[description])\n"
                + "     VALUES (?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, subject.getSubjectName());
            ps.setString(2, subject.getImage());
            ps.setString(3, subject.getDescription());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public ArrayList<Subject> getAllSubjects() {
        ArrayList<Subject> list = new ArrayList<>();
        String query = "SELECT S.subjectId, S.subjectName, S.thumbnail ,S.[description]\n"
                + "FROM [Subject] S";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject s = new Subject(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void delete(int id) {
        String query = "DELETE FROM [Subject] WHERE subjectId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Subject get(int id) {
        String query = "SELECT subjectId, subjectName, thumbnail ,description FROM [Subject] where subjectId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Subject subject = new Subject();
            while (rs.next()) {
                subject = new Subject(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));
            }
            return subject;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean update(int id, String name, String filename, String description) {
        String query = "UPDATE Subject set subjectName = ?,\n"
                + "			   description = ?,\n"
                + "			   thumbnail = ?,\n"
                + "			   where subjectId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, filename);
            ps.setInt(4, id);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

}
