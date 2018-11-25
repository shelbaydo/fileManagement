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
		request.setCharacterEncoding("utf-8");
		//response.setContentType("text/html;charset=UTF-8");
		User user = new User();
		UserService userService = new UserService();
		String type = request.getParameter("type");
		HttpSession session = request.getSession(true);
		if(type.equals("alter")){		
			user = (User)session.getAttribute("currentUser");
			user.setAge(Integer.parseInt(request.getParameter("age")));
			user.setSemester(request.getParameter("semester"));
			user.setSex(request.getParameter("sex"));
			user.setEd(request.getParameter("ed"));
			user.setSchool(request.getParameter("school"));
			user.setSignature(request.getParameter("signature"));
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String birthday = year+month+day;
			user.setBirthday(birthday);
			user.setUsername(request.getParameter("username"));
			user.setMajor(request.getParameter("major"));
			if(userService.modify(user)){
				request.setAttribute("alterMessage", "�޸ĳɹ�");
				session.setAttribute("currentUser", user);
				response.setHeader("refresh", "1;url='/fileManagement/personalPage/info/basic-info.jsp'");
				request.getRequestDispatcher("/personalPage/info/basic-info.jsp").forward(request, response);
			}		
		}else if(type.equals("login")){
			
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");		
			String usercheckcode = request.getParameter("checkcode");		
			String servercheckcode = (String) session.getAttribute("checkcode");
			String message = null;
			if (!servercheckcode.equalsIgnoreCase(usercheckcode)){
				message = "��֤�����";
				request.setAttribute("message", message);
				request.setAttribute("phone", phone);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/home/login.jsp").forward(request, response);	
			}else{
				user = userService.findUserByPhone(phone);
				if(password.equals(user.getPassword())){
					session.setAttribute("currentUser", user);
				    request.setAttribute("loginResult", "��¼�ɹ�");
					response.setHeader("refresh", "1;url='/fileManagement/index.jsp'");
					request.getRequestDispatcher("/home/login.jsp").forward(request, response);
				}else{
					request.setAttribute("loginResult", "�������");
					request.getRequestDispatcher("/home/login.jsp").forward(request, response);
				}
			}		
		    
		}else if(type.equals("quitLogin")){
			session.removeAttribute("currentUser");	
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		
	}

}
