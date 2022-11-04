<%-- 
    Document   : adminUpdateQuiz
    Created on : Jul 7, 2022, 12:26:59 AM
    Author     : DELL
--%>

<%-- 
    Document   : adminAddNewQuiz
    Created on : Jul 6, 2022, 8:58:22 PM
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
        <title>Update Quiz</title>
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <script src="https://kit.fontawesome.com/64bb7a6643.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminAddSubject.css" />
    </head>

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
                <div class="container-fluid">
                    <div class="row justify-content-between subject-section">
                        <h2 class="mt-3">Quiz Management</h2>
                    </div>
                    <form action="" method="post">
                        <input name = "quizId" value="${quiz.quizId}" hidden="">
                        <div class="mainSection">
                            <div class="firstSection">
                                <div class="subjectNameContet">
                                    <!--Subject name section-->
                                    <label for="subjectName">Quiz Name</label>
                                    <input type="text" name="name" id="quizName" value="${quiz.quizName}" >
                                    <c:if test="${check eq false}">
                                        <label style="color: red;" for="subjectName">${mess}</label>
                                    </c:if>
                                </div>

                                <div class="subjectContent">
                                    <label for="Subject">Subject</label>
                                    <select name="subjectId" id="subject">
                                        <c:forEach items="${listSubject}" var="ls">
                                            <option name ="subjectChoose" value="${ls.subjectId}" ${ls.subjectId == quiz.subjectId?"selected":""}>${ls.subjectName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="quizDurationContent">
                                    <label for="quizDuration">Quiz Duration</label>
                                    <input name="hour" type="number" class="minus" value="${hour}" > :
                                    <input name="minus" type="number" class="minus" value="${minus}" > :
                                    <input name="second" type="number" class="second" value="${second}">
                                </div>
                                <div class="numberQuestionContent">
                                    <label for="numberQuestion">Number Question: ${quiz.numberQuestion}</label>
                                </div>
                            </div>
                            <div class="secondSection">
                                <div class="imageSection">
                                    <img src="img/asp-mvc.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="description">
                            <label for="descriptionSection">Description:</label><br>
                            <textarea id="descriptionSection" name="description" rows="6" cols="133">
                                ${quiz.description}
                            </textarea>
                        </div>
                        <div class="buttonSection">
                            <button class="btn btn-primary" type="submit">Submit</button>
                            <button class="btn btn-info"><a class="listQuestion" style="color: white; " href="/admin/admin/question?quizId=${quiz.quizId}">List Question</a></button>
                            <button class="btn btn-secondary" type="reset">Reset</button>
                        </div>
                    </form>

            </main>
        </div>

    </body>

</html>

