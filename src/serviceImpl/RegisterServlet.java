package serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;

public class RegisterServlet extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 this.doPost(request, response);
	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		 request.setCharacterEncoding("utf-8");
		 HttpSession session = request.getSession(true);
		 String username = request.getParameter("username");
		 String phone = request.getParameter("phone");
		 String password = request.getParameter("password");
		 String smsCode = request.getParameter("verifyCode");
		 request.setAttribute("username", username);
		 request.setAttribute("phone", phone);
		 request.setAttribute("password", password);
		 if(smsCode.equals((String)session.getAttribute("code"))){
			 User user = new User();
			 user.setUsername(username);	 
			 user.setPhone(phone);	 
			 user.setPassword(password);
			 UserService userService = new UserService();
			 if(userService.add(user)){
				 request.setAttribute("RegisterResult", "注册成功,3s后跳转到首页");
				 response.setHeader("refresh", "3;url='/fileManagement/index.jsp'");
				 request.getRequestDispatcher("/home/register.jsp").forward(request, response);
				 
			 }else{
				 response.setHeader("refresh", "3;url='/fileManagement/index.jsp'");
				 request.setAttribute("RegisterResult", "对不起注册失败，我们正在努力查找问题");
				 request.getRequestDispatcher("/home/register.jsp").forward(request, response);				
			 }
		 }else{
			 request.setAttribute("RegisterResult", "验证码输入错误");
			 
			 request.getRequestDispatcher("/home/register.jsp").forward(request, response);
		 }
		 
	}

}
