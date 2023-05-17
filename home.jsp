<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Student" %>
<%@ page import="db.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%@include file="WEB-INF/vendor/bootstart.jsp"%>
</head>
<body>
<div class="container">
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">NAME</th>
        <th scope="col">SURNAME</th>
        <th scope="col">BIRTHDATE</th>
        <th scope="col">CITY</th>
        <th scope="col">DETAILS</th>
    </tr>
    </thead>
    <tbody>
    <% ArrayList<Student> studentArrayList= DBConnector.getStudents();
    for(Student student: studentArrayList){
    %>
    <tr>
        <td><%=student.getId()%></td>
        <td><%=student.getName()%></td>
        <td><%=student.getSurname()%></td>
        <td><%=student.getBirthdate()%></td>
        <td><%=student.getCity()%> </td>
        <td><a href="/addDetails?idishka=<%=student.getId()%>"> Details</a></td>
    </tr>
    <%}%>
    </tbody>
</table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <form action="/addStudent" method="post">
                    <div class="container">
                        <div class="mt-2 mb-2">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="studentName">
                        </div>
                        <div class="mt-2 mb-2">
                            <label class="form-label">Surname</label>
                            <input type="text" class="form-control" name="studentSurname">
                        </div>
                        <div class="mt-2 mb-2">
                            <label class="form-label">Birthdate</label>
                            <input type="date" class="form-control" name="studentBirthdate">
                        </div>
                        <div class="mt-2 mb-2">
                            <label class="form-label">City</label>
                            <select class="form-control" name="studentCity">
                                <option>Aqtobe</option>
                                <option>Astana</option>
                                <option>Almaty</option>
                            </select>
                        </div>
                            <button type="submit" class="btn btn-secondary">SUBMIT</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CLOSE</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <form action="/details" method="post">
                    <div class="container">
                        <div class="mt-2 mb-2">
                            <% ArrayList<Student> studentArrayList1= DBConnector.getStudents();
                                for(Student student: studentArrayList1){
                            %>
                                <div class="mt-2 mb-2">
                                    <input type="hidden" name="id" value="<%=student.getId()%>">
                                     <label class="form-lable">NAME:</label>
                                     <input class="form-control" type="text" value="<%=student.getName()%>" name="taskName">
                                </div>
                                  <div class="mt-2 mb-2">
                                      <label class="form-lable">SURNAME:</label>
                                      <input class="form-control" type="text" value="<%=student.getSurname()%>" name="taskName">
                                  </div>
                                <div class="mt-2 mb-2">
                                    <label class="form-lable">BIRTHDATE:</label>
                                    <input class="form-control" type="date" value="<%=student.getBirthdate()%>" name="taskName">
                                </div>
                                <div class="mt-2 mb-2">
                                    <label class="form-lable">CITY:</label>
                                    <select class="form-control" name="city" value="<%=student.getCity()%>">
                                        <option>Almaty</option>
                                        <option>Astana</option>
                                        <option>Aqtobe</option>
                                    </select>
                                </div>
                            <%}%>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
