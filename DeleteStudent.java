package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;


@WebServlet("/deleteStudent")


public class DeleteStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       String id =req.getParameter("id");
       Long studentId=Long.parseLong(id);
        Student student= DBConnector.getStudent(studentId);
        DBConnector.deleteStudent(student);
        resp.sendRedirect("/home");

       // String id = req.getParameter("id");
       // Long studentid = Long.parseLong(id);
        //Student student = DBConnector.getStudent(studentid);
       // DBConnector.deleteStudent(student);
       // resp.sendRedirect("/chapter5AllStudents");
    }
}
