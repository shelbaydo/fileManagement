package controlers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import utils.JsonParse;
import daoImpl.CourseDao;
import entity.Course;

public class CourseUnit extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Boolean error = false;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String message = (String)request.getAttribute("message");
		String courseName = null;
		if(message!=null){
			if(message.equals("succeed")){
				courseName = (String)request.getAttribute("courseName");
			}else{
				error = true;
			}
			
		}else{
			 courseName = request.getParameter("courseName");
			
		}
		if(error==false){
			HttpSession session = request.getSession(true);
			Course requestedCourse = (Course) session.getAttribute(courseName);
			request.setAttribute("requestedCourse", requestedCourse);		
			request.getRequestDispatcher("/courseMainPage.jsp").forward(request, response);	
		}else{
			request.getRequestDispatcher("/error.jsp").forward(request, response);	
		}
		
	}
}
