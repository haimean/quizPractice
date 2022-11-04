<%-- 
    Document   : adminAddNewSubject
    Created on : Jul 6, 2022, 4:16:02 PM
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
                <div class="user-wrapper">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEAoTadQ4n5Oe-rLqJz9j_UCkUhtcLoZlacA&usqp=CAU"
                         width="40px" height="40px" alt="Error" />
                    <div>
                        <h4>Eminem</h4>
                        <small>Slim Shady</small>
                    </div>
                </div>
            </header>

            <main>
                <div class="container-fluid">
                    <div class="row justify-content-between subject-section">
                        <h2 class="mt-3">Subject Management</h2>
                    </div>
                    <form action="" method="post" enctype="multipart/form-data">
                        <input name = "id" value="${id}" hidden="">
                        <div class="mainSection">
                            <div class="firstSection">
                                <div class="subjectNameContet" style="margin-top:20px">
                                    Subject name section
                                    <label for="subjectName">Subject Name</label>
                                    <input type="text" name="name" id="subjectName" value="${name}" placeholder="Please input your subject name here.">
                                    <c:if test="${check eq false}">
                                        <label style="color: red;" for="subjectName">${mess}</label>
                                    </c:if>
                                </div>
                            </div>
                            <div class="secondSection">
                                <div class="imageSection">
                                    <img src="${image}" alt="alt"/>
                                    <input name="image" type="file" >
                                </div>
                            </div>
                        </div>
                        <div class="description">
                            <label for="descriptionSection">Description:</label><br>

                            <textarea id="descriptionSection" name="description" rows="6" cols="135">
                                ${description}
                            </textarea>
                        </div>

                        <div class="buttonSection">
                            <button class="btn btn-primary" type="submit">Submit</button>
                            <button class="btn btn-secondary" type="reset">Reset</button>
                        </div>
                    </form>

            </main>
        </div>

    </body>

</html>
