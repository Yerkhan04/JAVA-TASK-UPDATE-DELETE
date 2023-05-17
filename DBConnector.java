package db;

import model.Student;

import java.sql.*;
import java.util.ArrayList;

public class DBConnector {
    public static Connection connection;
    static {
        try{
            Class.forName("org.postgresql.Driver");
            connection= DriverManager.getConnection("jdbc:postgresql://localhost:5432/databaseStudent",
                    "postgres","postgres");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Student> getStudents(){
        ArrayList<Student> studentArrayList =new ArrayList<>();
        try {
            PreparedStatement statement =connection.prepareStatement(""+
                    "SELECT * FROM table_students ");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String name=resultSet.getString("name");
                String surname=resultSet.getString("surname");
                String birthdate=resultSet.getString("birthdate");
                String city=resultSet.getString("city");

                Student student1 =new Student();
                student1.setId(id);
                student1.setName(name);
                student1.setSurname(surname);
                student1.setBirthdate(birthdate);
                student1.setCity(city);

                studentArrayList.add(student1);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        } return  studentArrayList;
    }

    public static Student getStudent(Long id){
        Student student=null;
        try {
            PreparedStatement statement =connection.prepareStatement(""+
                    "SELECT * FROM table_students  WHERE id=?");
            statement.setLong(1,id);
            ResultSet resultSet =statement.executeQuery();
            if(resultSet.next()){
                String name=resultSet.getString("name");
                String surname=resultSet.getString("surname");
                String birthdate=resultSet.getString("birthdate");
                String city=resultSet.getString("city");

                student=new Student();
                student.setId(id);
                student.setName(name);
                student.setSurname(surname);
                student.setBirthdate(birthdate);
                student.setCity(city);
            } statement.close();

        } catch (SQLException e) {
          e.printStackTrace();
        } return  student;
    }
    public static void addStudent(Student student){
        try {
            PreparedStatement statement = connection.prepareStatement(""+
                    "INSERT INTO table_students(name,surname,birthdate,city)"+
                    "VALUES (?,?,?,?) ");
            statement.setString(1, student.getName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthdate());
            statement.setString(4, student.getCity());

            statement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteStudent(Student student){
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "DELETE FROM table_students WHERE id=?");

            statement.setLong(1, student.getId());
            statement.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateStudent(Student student){
        try {
            PreparedStatement statement = connection.prepareStatement(""+
                    "UPDATE table_students SET name=?,surname=?, birthdate=?,city=? " +
                    "WHERE  id=? ");
            statement.setString(1, student.getName());
            statement.setString(2, student.getSurname());
            statement.setString(3, student.getBirthdate());
            statement.setString(4, student.getCity());
            statement.setLong(5, student.getId());

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
