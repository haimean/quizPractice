/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author QuizPractice
 */
public class QuizDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Timestamp ts = Timestamp.from(Instant.now());

    public Quiz getQuizByQuizId(int quizId) {
        String query = "select * from Quiz where quizId = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8));
                return quiz;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Quiz> getListLastFourQuiz() {
        String query = "select top 3 q.*,s.subjectName from Quiz as q\n"
                + "left outer join [Subject] as s\n"
                + "on s.subjectId = q.subjectId\n"
                + "order by quizId desc";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9)
                );
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public int getTotalQuiz() {
        String sql = "select count (*) from Quiz";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int numberOfPages(int perPage) {
        int count = getTotalQuiz();
        if (count % perPage != 0) {
            return ((count / perPage) + 1);
        } else {
            return count;
        }
    }

    public ArrayList<Quiz> getAll(int page, int perPage) {
        String query = "select q.* , s.subjectName from Quiz as q\n"
                + "left outer join Subject as s on  q.subjectId = s.subjectId\n"
                + "order by quizId desc\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, (page - 1) * perPage);
            ps.setInt(2, perPage);

            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public ArrayList<Quiz> getAllBySubject(int subjectID) {
        String query = "select q.* , s.subjectName from Quiz as q\n"
                + "left outer join Subject as s on  q.subjectId = s.subjectId\n"
                + "where q.subjectId = ?\n"
                + "order by quizId desc";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public Quiz get(int id) {
        String query = "select q.* , s.subjectName from Quiz as q\n"
                + "left outer join Subject as s on q.subjectId = s.subjectId\n"
                + "where q.quizId = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public boolean add(String quizName, Time quizDuration, int subjectId, String description) {
        String query = "INSERT INTO [dbo].[Quiz]\n"
                + "           ([quizName]\n"
                + "           ,[quizDuration]\n"
                + "           ,[numberQuestion]\n"
                + "           ,[subjectId]\n"
                + "           ,[description]\n"
                + "           ,[dateCreated],[thumbnail])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, quizName);
            ps.setTime(2, quizDuration);
            ps.setInt(3, 0);
            ps.setInt(4, subjectId);
            ps.setString(5, description);
            ps.setTimestamp(6, ts);
            ps.setString(7, "");
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public void delete(int quizId) {
        String query = "DELETE FROM [dbo].[Quiz]\n"
                + "      WHERE quizId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            ps.execute();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Quiz> getAll() {
        String query = "select q.*,s.subjectName from Quiz as q\n"
                + "left outer join [Subject] as s\n"
                + "on s.subjectId = q.subjectId\n";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public boolean updateQuiz(int quizId, String quizName, Time quizDuration, int subjectId, String description) {
        String query = "UPDATE [dbo].[Quiz]\n"
                + "   SET [quizName] = ?\n"
                + "      ,[quizDuration] = ?\n"
                + "      ,[subjectId] = ?\n"
                + "      ,[description] =?\n"
                + " WHERE [quizId] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, quizName);
            ps.setTime(2, quizDuration);
            ps.setInt(3, subjectId);
            ps.setString(4, description);
            ps.setInt(5, quizId);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public ArrayList<Quiz> getAllQuizSortNumberQuestion() {
        String query = "select q.*, s.subjectName from Quiz as q\n"
                + "left outer join [Subject] as s\n"
                + "on s.subjectId = q.subjectId\n"
                + "  order by q.numberQuestion ";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public ArrayList<Quiz> getAllQuizSortDuration() {
        String query = "select q.*, s.subjectName from Quiz as q\n"
                + "left outer join [Subject] as s\n"
                + "on s.subjectId = q.subjectId\n"
                + "order by q.quizDuration ";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public ArrayList<Quiz> getBySubject(int page, int perPage, int subjectId) {
        String query = "select q.*, s.subjectName from (select * from Quiz where subjectId = ?) as q\n"
                + "left outer join Subject as s on  q.subjectId = s.subjectId\n"
                + "order by quizId desc\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, subjectId);
            ps.setInt(2, (page - 1) * perPage);
            ps.setInt(3, perPage);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTime(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }
}
