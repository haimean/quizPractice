/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author ASUS
 */
public class Quiz {

    private int quizId;
    private String quizName;
    private String thumbnail;
    private Time quizDuration;
    private int numberQuestion;
    private int subjectId;
    private String description;
    private Date dateCreated;
    private String ownerName;
    private String quizLevelName;
    private String subjectName;

    public Quiz() {
    }

    public Quiz(int quizId, String quizName, String thumbnail, Time quizDuration, int numberQuestion, int subjectId, String description, Date dateCreated) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.thumbnail = thumbnail;
        this.quizDuration = quizDuration;
        this.numberQuestion = numberQuestion;
        this.subjectId = subjectId;
        this.description = description;
        this.dateCreated = dateCreated;
    }

    public Quiz(int quizId, String quizName, String thumbnail, Time quizDuration, int numberQuestion, int subjectId, String description, Date dateCreated, String subjectName) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.thumbnail = thumbnail;
        this.quizDuration = quizDuration;
        this.numberQuestion = numberQuestion;
        this.subjectId = subjectId;
        this.description = description;
        this.dateCreated = dateCreated;
        this.ownerName = ownerName;
        this.subjectName = subjectName;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Time getQuizDuration() {
        return quizDuration;
    }

    public void setQuizDuration(Time quizDuration) {
        this.quizDuration = quizDuration;
    }

    public int getNumberQuestion() {
        return numberQuestion;
    }

    public void setNumberQuestion(int numberQuestion) {
        this.numberQuestion = numberQuestion;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getQuizLevelName() {
        return quizLevelName;
    }

    public void setQuizLevelName(String quizLevelName) {
        this.quizLevelName = quizLevelName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

}
