<%-- 
    Document   : adminQuiz
    Created on : Jul 6, 2022, 8:16:24 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Page</title>
        <link
            rel="stylesheet"
            href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <script src="https://kit.fontawesome.com/64bb7a6643.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminSubject.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <style>
        .quiz-subject p {
            height: 30px;
            font-size: 20px;
            text-transform: uppercase;
            font-weight: bold;
            margin-left: 20px;
        }
        .card-body .quiz-nameSub{
            text-transform: uppercase;
            font-weight: bold;
        }

    </style>
    <body>
        <%@include file="/view/admin/layout.jsp" %>
        <div class="main-content">
            <header>
                <h2>
                    <label for="">
                        <span class="las la-bars"></span>
                    </label>
                    Dashboard
                </h2>
                <div class="search-wrapper">
                    <span class="class las la-search"></span>
                    <input type="search" placeholder="Search here" />
                </div>
            </header>
            <main>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"> Subject</i> </div>
                            <ul class="list-group category_block" id="subject">
                                <c:forEach items="${subjects}" var="subject">
                                    <li id="${subject.subjectId}" class="subject list-group-item text-black"   >
                                        <a href="<%= request.getContextPath() %>/admin/quiz?subjectId=${subject.subjectId}">${subject.subjectName}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-sm-9">

                            <a style="margin-left: 65%;" href="quiz/add" type="button"
                               class="btn btn-success btn-add">Add Quiz</a>
                            <table class="table table-striped table-bordered mt-4">
                                <thead>
                                    <tr>
                                        <th>Quiz Name</th>
                                        <th>Quiz Duration</th>
                                        <th>Number Question</th>
                                        <th>Subject</th>
                                        <th>Question</th>
                                        <th>Delete</th>
                                        <th>Update</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${quizs}" var="quiz">
                                        <tr class ="quiz" id="${quiz.quizId}q">
                                            <td>${quiz.quizName}</td>
                                            <td>${quiz.quizDuration}</td>
                                            <td>${quiz.numberQuestion}</td>
                                            <td>${quiz.subjectName}</td>
                                            <td><a href="<%= request.getContextPath() %>/admin/question?quizId=${quiz.quizId}" class="btn btn-primary">Question</a></td>
                                            <td><a href="<%= request.getContextPath() %>/admin/quiz/delete?quizId=${quiz.quizId}" class="btn btn-danger">Delete</a></td>
                                            <td><a href="<%= request.getContextPath() %>/admin/quiz/update?quizId=${quiz.quizId}" class="btn btn-warning">Update</a></td>                        
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                            <ul class="pagination">
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item ${page == i ? "active" : ""}">
                                        <a class="page-link" href="<%= request.getContextPath() %>/admin/quiz?subjectId=${subjectId}&page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
