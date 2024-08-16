package login.enroll;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Course;
import profile.DBEnrollment;
import profile.Database2;
import profile.Enrollment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/api/enrollment/add")
public class addEnrollment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Enrollment new_enrollment = new Enrollment();
    	new_enrollment.setInstructor_id(Integer.parseInt(request.getParameter("instructor_id")));
    	new_enrollment.setCourse_id(Integer.parseInt(request.getParameter("crs_id")));
    	DBEnrollment db = new DBEnrollment();
    	try {
    		if(request.getParameter("student_id") != null){
        		new_enrollment.setStudent_id(Integer.parseInt(request.getParameter("student_id")));
        		db.insert(new_enrollment);
        	} else {
        		db.insert_instructor(new_enrollment);
        	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	if(request.getParameter("student_id") != null){
    		response.sendRedirect("/learnersPortal/dashboard");
    	} else {
    		response.sendRedirect("/learnersPortal/dashboard1");
    	}
    }
}
