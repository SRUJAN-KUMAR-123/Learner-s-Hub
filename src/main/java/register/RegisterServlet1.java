package register;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import profile.User;

import java.io.IOException;
import java.sql.*;

@WebServlet("/reg1")
public class RegisterServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//create a new session
		HttpSession session = request.getSession();
		
		//update form1 inputs into the session
		User user = new User();
		
		user.setfName(request.getParameter("firstName"));
		user.setmName(request.getParameter("middleName"));
		user.setlName(request.getParameter("lastName"));
		user.setDob(request.getParameter("dob"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender"));
		user.setLanguage(request.getParameter("language"));
		
		session.setAttribute("user", user);//float a = 10;
		
//		System.out.println(user.getfName());
				
		//response as form2
		response.sendRedirect("register2.html");
	}
}



