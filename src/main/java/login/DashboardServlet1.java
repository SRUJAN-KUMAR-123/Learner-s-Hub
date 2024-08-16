package login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Course;
import profile.DBEnrollment;
import profile.Database1;
import profile.Database2;
import profile.Instructor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboard1")
public class DashboardServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Database1 db = new Database1("instructor");
    	HttpSession session = request.getSession(false);
		
		DBEnrollment enrollments = new DBEnrollment();
		try {
			Instructor instructor = db.read((String) session.getAttribute("uname"));
			List<List<Course>> user_courses = enrollments.get_instructor_courses(instructor.getInstructor_id());
			session.setAttribute("enrolled_courses", user_courses.get(0));
			session.setAttribute("available_courses", user_courses.get(1));
			session.setAttribute("instructor", instructor);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
    	RequestDispatcher view = request.getRequestDispatcher("Dashboard1.jsp");
        // don't add your web-app name to the path

        view.forward(request, response);
   }

}