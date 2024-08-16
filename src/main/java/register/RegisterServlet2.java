package register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.User;

import java.io.IOException;

@WebServlet("/reg2")
public class RegisterServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the prev session
		HttpSession session = request.getSession(false);
		
		//get the session attribute
		User user = (User) session.getAttribute("user");//int a = (int)10.5f;
		//update form2 inputs into the session
		user.setQual(request.getParameter("qual"));
		user.setInst(request.getParameter("inst"));
		user.setMode(request.getParameter("mode"));
		
		user.setYear(Integer.parseInt(request.getParameter("year")));
		user.setPer(Float.parseFloat(request.getParameter("per")));
		user.setMobile(Long.parseLong(request.getParameter("mobile")));
		
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		
		session.setAttribute("user", user);
		
		//response as from3
		response.sendRedirect("register3.html");
	}

}
