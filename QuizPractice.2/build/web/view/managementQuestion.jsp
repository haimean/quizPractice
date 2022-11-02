<%-- 
    Document   : test
    Created on : Jul 6, 2022, 8:27:07 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/managerQ.css">
        <title>Management Question</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {        
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn-group {
            float: right;
        }
        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }	
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }
        table.table td a:hover {
            color: #2196F3;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }	
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {        
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }    
        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }
        .custom-checkbox input[type="checkbox"] {    
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }
        .custom-checkbox label:before{
            width: 18px;
            height: 18px;
        }
        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }
        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }
        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }
        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }
        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }
        .modal .modal-content {
            border-radius: 3px;
        }
        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }
        .modal .modal-title {
            display: inline-block;
        }
        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }
        .modal textarea.form-control {
            resize: vertical;
        }
        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }	
        .modal form label {
            font-weight: normal;
        }
        .Quiz-name{
            font-size: 25px;
            margin-top: 20px;
            margin-bottom: 20px;
            display: flex;
        }
        div .option-content{
            font-size: 16px;
        }
        a .Icon{
            width: 50%;
            text-align: right
        }
        .question-img{
            margin-bottom: 20px;
        }
        .Quiz-Name{
            width: 80%
        }
        .option-correct{
            color: #30C7C7;
            font-size: 18px;
        }
    </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Quiz: <b>${quizName.quizName}</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                    class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        </div>
                    </div>
                </div>
                <%
                    String a = (String) request.getAttribute("alert");
                    int i = Integer.parseInt(a);

                %> 
                <div class="containner-option">
                    <c:forEach items="${listQuestion}" var="lq">
                        <div class="Quiz-name">
                            <span class="Quiz-Name"><%=i++%>.${lq.content}<p style="font-size: 18px;color: black;margin-top: 8px">(${lq.explanation})</p></span>
                            <div class="Icon" style="width: 20%;text-align: right">
                                <a href="inforQuestion?updateId=${lq.questionId}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="deleteQuestion?deleteId=${lq.questionId}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </div>
                        </div>
                        <c:if test="${lq.media != null}">
                            <img style="height: 150px;width: 260px;margin-bottom: 10px" src="img/${lq.media}" alt="" />
                        </c:if>
                        <div class="row" style="margin-bottom: 20px;">
                            <c:forEach items="${listOption}" var="lo">
                                <c:if test="${lq.questionId == lo.questionId}">
                                    <div class="col-sm-6">
                                        <p class="option-content">
                                            ${lo.content}
                                        </p>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <c:forEach items="${listOption}" var="lo">
                            <c:if test="${lq.questionId == lo.questionId}">
                                <c:if test="${lo.isCorrect == 'True'}">
                                    <label class="option-correct" for="">Answer correct: ${lo.content}</label>
                                </c:if>
                            </c:if>
                        </c:forEach>

                    </c:forEach>
                </div>
            </div>
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 600px">
                        <form action="addQuestion" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Question</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Question Name</label>
                                    <input name="nameQ" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Explanation</label>
                                    <input name="exp" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="img" type="file" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Option 1</label>
                                    <input name="op1" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 2</label>
                                    <input name="op2" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 3</label>
                                    <input name="op3" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Option 4</label>
                                    <input name="op4" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Correct Answer:</label>
                                    <input type="number" min="1" max="4" name="ca" class="form-control"
                                           placeholder="Correct Answer" required />
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                <c:if test="${sessionScope.user.roleId != 1}">
                                <a href="QuizListExpertController"><button type="button" class="btn btn-primary">Back</button>

                </c:if>
                <c:if test="${sessionScope.user.roleId == 1}">
                                <a href="AdminQuizController"><button type="button" class="btn btn-primary">Back</button>

                </c:if>

        </div>
    </body>
</html>