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
		Map<String,String> returnJson = new HashMap();
		JSONObject o = JSONObject.fromObject(returnJson); 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8"); 
		JSONObject parameters = JsonParse.getParameters(request);
		String courseName = (String)parameters.get("courseName");
		HttpSession session = request.getSession(true);
		Course requestedCourse = (Course) session.getAttribute(courseName.toString());
		request.setAttribute("requestedCourse", requestedCourse);
		request.getRequestDispatcher("/courseMainPage").forward(request, response);
		
	}
}
