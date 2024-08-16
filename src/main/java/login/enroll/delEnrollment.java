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

@WebServlet("/api/enrollment/delete")
public class delEnrollment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	DBEnrollment db = new DBEnrollment();
    	
    	HttpSession session = request.getSession(false);
    	String user_type = (String) session.getAttribute("user_type");
    	try {
    		if(user_type == "student") {
    			Integer crsId = Integer.parseInt(request.getParameter("crs_id"));
    			Integer studentId = Integer.parseInt(request.getParameter("student_id"));
        		db.delete_student_enrollment(crsId, studentId);
    		} else {
    			Integer crsId = Integer.parseInt(request.getParameter("crs_id"));
    			Integer instructorId = Integer.parseInt(request.getParameter("instructor_id"));
        		db.delete_instructor_enrollment(crsId, instructorId);
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	if (user_type == "student") {
    		response.sendRedirect("/learnersPortal/dashboard");
    	} else {
    		response.sendRedirect("/learnersPortal/dashboard1");
    	}
    }
}
