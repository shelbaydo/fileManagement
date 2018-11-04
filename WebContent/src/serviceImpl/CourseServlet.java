package serviceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
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
		 JSONObject o = JSONObject.fromObject(returnJson); 
		 User currentUser = (User)request.getSession().getAttribute("currentUser");
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/plain;charset=utf-8");
		 JSONObject parameters = JsonParse.getParameters(request);
		 if(parameters.get("type").equals("findAllCourse")){
			 CourseDao courseDao = new CourseDao();
			 JSONArray jsonArray = new JSONArray();		
			 List<Course> courseList = (List<Course>)courseDao.findObjectById(currentUser.getUserId());
			 HttpSession session = request.getSession(true);
			
			 for(int i = 0;i<courseList.size();i++){
				 jsonArray.add(courseList.get(i).getName());
				 session.setAttribute(courseList.get(i).getName(), courseList.get(i));
			 }
			 o.put("courseNum", courseList.size());
			 o.put("courseList", jsonArray);
		 }else{			 
			 String courseName = (String)parameters.get("courseName");		
			 UserService userService = new UserService();
			 Course course = new Course();
			 course.setUserId(currentUser.getUserId());
			 course.setName(courseName);
			 CourseDao courseDao = new CourseDao();
			 if(courseDao.addObject(course)){
				 o.put("msg", "Ìí¼Ó³É¹¦");
			 }
		 }
		 response.getWriter().print(o.toString());	
	}

}
