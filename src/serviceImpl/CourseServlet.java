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
		 request.setCharacterEncoding("utf-8");
		 response.setCharacterEncoding("utf-8");
		 HttpSession session = request.getSession(true);	
		 Map<String,String> returnJson = new HashMap();
		 JSONObject o = JSONObject.fromObject(returnJson); 
		 User currentUser = (User)session.getAttribute("currentUser"); 
		
		 JSONObject parameters = JsonParse.getParameters(request);
		 if(parameters.get("type").equals("findAllCourse")){
			 CourseDao courseDao = new CourseDao();
			 JSONArray jsonArray = new JSONArray();		
			 List<Course> courseList = (List<Course>)courseDao.findObjectById(currentUser.getUserId());
			 System.out.println(courseList.size());
			 for(int i = 0;i<courseList.size();i++){
				 jsonArray.add(courseList.get(i).getName());
				 session.setAttribute(courseList.get(i).getName(), courseList.get(i));
				 Course course = (Course)session.getAttribute(courseList.get(i).getName());
				 System.out.println(course);
			 }
			 o.put("courseNum", courseList.size());
			 o.put("courseList", jsonArray);
		 }else if(parameters.get("type").equals("addCourse")){			 
			 String courseName = (String)parameters.get("courseName");		
			 UserService userService = new UserService();
			 Course course = new Course();
			 course.setUserId(currentUser.getUserId());
			 course.setName(courseName);
			 CourseDao courseDao = new CourseDao();
			 if(courseDao.addObject(course)){
				 o.put("msg", "Ìí¼Ó³É¹¦");
				 currentUser.setCourseNum(currentUser.getCourseNum()+1);
			 }
		 }
		 response.getWriter().print(o.toString());	
	}

}
