package register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Database1;
import profile.Instructor;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/reg6")
public class RegisterServlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;      
    
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the prev session
		HttpSession session = request.getSession(false);
		
		//get the session attribute
		Instructor instructor = (Instructor) session.getAttribute("instructor");
		
		//update form3 input 
		instructor.setUname(request.getParameter("uname"));
		instructor.setPass(request.getParameter("password"));
		
		//update into db - insert
		Database1 db = new Database1("instructor");
		try {
			db.insert(instructor);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.invalidate();
		//response as registration success
		response.sendRedirect("statusinst.html");
	}

}
