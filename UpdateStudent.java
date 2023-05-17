package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;

@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("StudentId");
        String name = req.getParameter("StudentName");
        String surname = req.getParameter("StudentSurname");
        String birthdate = req.getParameter("StudentBirthdate");
        String city = req.getParameter("StudentCity");


        Student student = new Student();
        student.setId(Long.parseLong(id));
        student.setName(name);
        student.setSurname(surname);
        student.setBirthdate(birthdate);
        student.setCity(city);

        DBConnector.updateStudent(student);

        resp.sendRedirect("/home");


    }
}
