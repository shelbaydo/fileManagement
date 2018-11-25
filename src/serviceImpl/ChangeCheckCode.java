package serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeCheckCode extends HttpServlet {

	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		request.setAttribute("phone", phone);
		request.setAttribute("password", password);
		request.getRequestDispatcher("/home/login.jsp").forward(request, response);	
	}

	
}
