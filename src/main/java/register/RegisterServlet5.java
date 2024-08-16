package register;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Instructor;

import java.io.IOException;

@WebServlet("/reg5")
public class RegisterServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the prev session
		HttpSession session = request.getSession(false);
		
		//get the session attribute
		Instructor instructor = (Instructor) session.getAttribute("instructor");//int a = (int)10.5f;
		//update form2 inputs into the session
		instructor.setSubjects(request.getParameter("subjects"));
		instructor.setDegree(request.getParameter("degree"));
		instructor.setAvailability(request.getParameter("availability"));
		
		instructor.setTeachingexp(Integer.parseInt(request.getParameter("teachingexp")));
		instructor.setBiography(request.getParameter("biography"));
		instructor.setMobile(Long.parseLong(request.getParameter("mobile")));
		
		instructor.setEmail(request.getParameter("email"));
		instructor.setAddress(request.getParameter("address"));
		
		session.setAttribute("instructor", instructor);
		
		//response as from3
		response.sendRedirect("register6.html");
	}

}
