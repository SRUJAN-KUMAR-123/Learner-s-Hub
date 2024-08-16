package login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Database;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String user_type = "student";
    	HttpSession session = request.getSession();
    	Database db = new Database("user");
    	
    	try {
			int result = db.validate(request.getParameter("uname"),request.getParameter("password"));
			
			switch(result) {
			case 1->{
				session.setAttribute("error", "username is wrong");
				response.sendRedirect("StuLogin.jsp");
			}
			case 2->{
				session.setAttribute("user_authenticated", "true");;
				session.setAttribute("user_type", user_type);
				session.setAttribute("uname", request.getParameter("uname"));
				response.sendRedirect("dashboard");
			}
			case 3->{
				session.setAttribute("error", "password is wrong");
				response.sendRedirect("StuLogin.jsp");
			}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
