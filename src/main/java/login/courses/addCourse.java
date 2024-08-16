package login.courses;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Course;
import profile.Database2;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/api/course/add")
public class addCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String crs_name = request.getParameter("name");
    	String crs_desc = request.getParameter("desc");
    	
    	Course new_course = new Course();
    	new_course.setCrs_name(crs_name);
    	new_course.setCrs_desc(crs_desc);
    	
    	Database2 db = new Database2();
    	try {
			db.insert(new_course);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	response.sendRedirect("/learnersPortal/dashboard2");
    }
}
