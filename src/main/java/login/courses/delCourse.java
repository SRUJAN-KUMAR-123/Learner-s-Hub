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

@WebServlet("/api/course/delete")
public class delCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Integer crsId = Integer.parseInt(request.getParameter("crs_id"));
    	
    	Database2 db = new Database2();
    	try {
			db.delete(crsId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	response.sendRedirect("/learnersPortal/dashboard2");
    }
}
