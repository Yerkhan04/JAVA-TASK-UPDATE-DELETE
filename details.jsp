<%@ page import="model.Student" %>
<%@ page import="db.DBConnector" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Diana
  Date: 15.05.2023
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="WEB-INF/vendor/bootstart.jsp"%>
</head>
<body>
<%
    Student student=(Student) request.getAttribute("detailsStudent");
%>

<div class="mt-2 mb-2">
    <label class="form-label" >Name</label>
    <input type="text" class="form-control" name="studentName" value="<%=student.getName()%>">
</div>
<div class="mt-2 mb-2">
    <label class="form-label" >Surname</label>
    <input type="text" class="form-control" name="studentSurname"  value="<%=student.getSurname()%>">
</div>
<div class="mt-2 mb-2">
    <label class="form-label" >Birthdate</label>
    <input type="text" class="form-control" name="studentBirthdate" value="<%=student.getBirthdate()%>">
</div>
<div class="mt-2 mb-2">
    <label class="form-label">City</label>
    <input type="text" class="form-control" name="studentCity" value="<%=student.getCity()%>">
</div>
<div class="row mt-3">
    <div class="col-12" style="text-align: right">
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editstaticBackdrop">EDIT STUDENT</button>
        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deletestaticBackdrop">DELETE</button>
    </div>
</div>




<!-- Modal -->
<div class="modal fade" id="deletestaticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">DELETE STUDENT</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/deleteStudent" method="post">
                <input type="hidden" name="id" value="<%=student.getId()%>" >
                <div class="modal-body">
                    <h5 class="text-center">
                        ARE YOU SURE?
                    </h5>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-danger">DELETE</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="editstaticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">EDIT STUDENT</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/updateStudent" method="post">
                <input type="hidden" name="StudentId" value="<%=student.getId()%>" >
                <div class="modal-body">
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>NAME : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" name="StudentName" required placeholder="Name: " value="<%=student.getName()%>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>SURNAME : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" name="StudentSurname" required placeholder="Surname: " value="<%=student.getSurname()%>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>BIRTHDATE : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" name="StudentBirthdate" required placeholder="Birthdate: " value="<%=student.getBirthdate()%>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>CITY : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" name="StudentCity" required placeholder="City: " value="<%=student.getCity()%>">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">SAVE STUDENT</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
