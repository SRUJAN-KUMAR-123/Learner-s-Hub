package login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Course;
import profile.Database;
import profile.User;
import profile.DBEnrollment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Database db = new Database("user");
    	DBEnrollment enrollmentsDB = new DBEnrollment();
    	HttpSession session = request.getSession(false);
    	User student;
		try {
			student = db.read((String) session.getAttribute("uname"));
			session.setAttribute("user", student);
			List<List<Course>> enrolled_courses = enrollmentsDB.get_student_courses(student.getStudent_id());
			session.setAttribute("enrolled_courses", enrolled_courses.get(1));
			session.setAttribute("available_courses", enrolled_courses.get(0));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher view = request.getRequestDispatcher("Dashboard.jsp");
        // don't add your web-app name to the path

        view.forward(request, response);
   }

}
