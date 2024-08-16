package register;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.Instructor;

import java.io.IOException;
import java.sql.*;

@WebServlet("/reg4")
public class RegisterServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//create a new session
		HttpSession session = request.getSession();
		
		//update form1 inputs into the session
		Instructor instructor = new Instructor();
		
		instructor.setfName(request.getParameter("firstName"));
		instructor.setmName(request.getParameter("middleName"));
		instructor.setlName(request.getParameter("lastName"));
		instructor.setDob(request.getParameter("dob"));
		instructor.setAge(Integer.parseInt(request.getParameter("age")));
		instructor.setGender(request.getParameter("gender"));
		instructor.setLanguage(request.getParameter("language"));
		
		session.setAttribute("instructor", instructor);//float a = 10;
		
//		System.out.println(user.getfName());
				
		//response as form2
		response.sendRedirect("register5.html");
	}
}



