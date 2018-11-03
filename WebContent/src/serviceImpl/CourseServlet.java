package serviceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import services.OperationService;
import utils.JsonParse;
import daoImpl.CourseDao;
import entity.Course;
import entity.User;

public class CourseServlet extends HttpServlet implements OperationService {

	public Boolean add(Object o) {
		// TODO Auto-generated method stub
		return null;
	}


	public Boolean delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	public Boolean modify(Object o) {
		// TODO Auto-generated method stub
		return null;
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 Map<String,String> returnJson = new HashMap();
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/plain;charset=utf-8");
		 JSONObject parameters = JsonParse.getParameters(request);
		 String courseName = (String)parameters.get("courseName");
		 User currentUser = (User)request.getSession().getAttribute("currentUser");
		 UserService userService = new UserService();
		 int userId = userService.findUserIdByPhone(currentUser.getPhone());
		 Course course = new Course();
		 course.setUserId(userId);
		 course.setName(courseName);
		 CourseDao courseDao = new CourseDao();
		 if(courseDao.addObject(course)){
			 returnJson.put("msg", "Ìí¼Ó³É¹¦");
		 }
		 JSONObject o = JSONObject.fromObject(returnJson); 
		 response.getWriter().print(o.toString());		
	}

}
