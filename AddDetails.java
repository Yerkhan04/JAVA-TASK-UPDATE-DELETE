package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

import java.io.IOException;

@WebServlet("/addDetails")

public class AddDetails  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id =req.getParameter("idishka");
        Long StudentId=null;
        try{
            StudentId=Long.parseLong(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        Student student = DBConnector.getStudent(StudentId);
        req.setAttribute("detailsStudent", student);

        if(student!=null){
            req.getRequestDispatcher("details.jsp").forward(req,resp);
        }
        System.out.println(id);
    }

}
