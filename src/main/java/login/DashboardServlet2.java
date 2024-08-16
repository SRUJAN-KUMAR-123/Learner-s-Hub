package login;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet("/dashboard2")
public class DashboardServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Course> courses;
		Database2 db = new Database2();
		HttpSession session = request.getSession();
		try {
			courses = db.read_all();
			session.setAttribute("courses", courses);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        // we do not set content type, headers, cookies etc.
        // resp.setContentType("text/html"); // while redirecting as
        // it would most likely result in an IllegalStateException

        // "/" is relative to the context root (your web-app name)
        RequestDispatcher view = request.getRequestDispatcher("Dashboard2.jsp");
        // don't add your web-app name to the path

        view.forward(request, response);
   }

}
