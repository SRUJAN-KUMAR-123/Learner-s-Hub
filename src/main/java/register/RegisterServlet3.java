package register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Database;
import profile.User;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/reg3")
public class RegisterServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;      
    
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the prev session
		HttpSession session = request.getSession(false);
		
		//get the session attribute
		User user = (User) session.getAttribute("user");
		
		//update form3 input 
		user.setUname(request.getParameter("uname"));
		user.setPass(request.getParameter("password"));
		
		//update into db - insert
		Database db = new Database("user");
		try {
			db.insert(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.invalidate();
		//response as registration success
		response.sendRedirect("statusstu.html");
	}

}
