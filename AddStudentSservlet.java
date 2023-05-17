package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentSservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("studentName");
        String surname=req.getParameter("studentSurname");
        String birthdate=req.getParameter("studentBirthdate");
        String city=req.getParameter("studentCity");

        Student student=new Student();
        student.setName(name);
        student.setSurname(surname);
        student.setBirthdate(birthdate);
        student.setCity(city);

        DBConnector.addStudent(student);
        resp.sendRedirect("/home");

    }
}
