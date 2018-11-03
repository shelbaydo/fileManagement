package serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;

public class LoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		UserService userService = new UserService();
		user = userService.findUserByPhone(phone);
	    HttpSession session = request.getSession(true);
	    session.setAttribute("currentUser", user);
	    String path = request.getContextPath();
	    response.sendRedirect(path+"/index.jsp");	    
	}

}
