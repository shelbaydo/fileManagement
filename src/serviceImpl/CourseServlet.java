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
import daoImpl.UserDao;
import entity.Course;
import entity.Page;
import entity.User;

public class CourseServlet extends HttpServlet implements OperationService {
	private CourseDao courseDao = null;

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
			 for(int i = 0;i<courseList.size();i++){
				 jsonArray.add(courseList.get(i).getName());		 
				 session.setAttribute(courseList.get(i).getName(), courseList.get(i));
				 Course course = (Course)session.getAttribute(courseList.get(i).getName());		 
			 }
			 o.put("courseNum", courseList.size());
			 o.put("courseList", jsonArray);
		 }else if(parameters.get("type").equals("find2LatestCourse")){
			
			 CourseDao courseDao = new CourseDao();
			 JSONArray jsonArray = new JSONArray();	
			 JSONArray noteNumList = new JSONArray();
			 JSONArray folderNumList = new JSONArray();
			 List<Course> courseList = (List<Course>)courseDao.find2LatestCourse(currentUser.getUserId());
			 for(int i = 0;i<courseList.size();i++){
				 jsonArray.add(courseList.get(i).getName());
				 noteNumList.add(courseList.get(i).getNoteNum());
				 folderNumList.add(courseList.get(i).getFolderNum());
			 }
			 o.put("courseNum", courseList.size());
			 o.put("courseList", jsonArray);
			 o.put("noteNumList", noteNumList);
			 o.put("folderNumList", folderNumList);
		 }else if(parameters.get("type").equals("addCourse")){			 
			 String courseName = (String)parameters.get("courseName");		
			 UserService userService = new UserService();
			 Course course = new Course();
			 course.setUserId(currentUser.getUserId());
			 course.setName(courseName);
			 CourseDao courseDao = new CourseDao();
			 currentUser.setCourseNum(currentUser.getCourseNum()+1);
			 UserDao userDao = new UserDao();
			 if(!(userDao.modifyCourseNum(currentUser))){
				 request.getRequestDispatcher("error.jsp");
			 }else{
				 if(courseDao.addObject(course)){
					 o.put("msg", "添加成功");
					 currentUser.setCourseNum(currentUser.getCourseNum()+1);
				 }else{
					 request.getRequestDispatcher("error.jsp");
				 }
			 }
			 
		 }else if(parameters.get("type").equals("findCourseInpage")){
			 
			 String pageNumS = (String)parameters.get("pageNum");
			 int pageNum = Integer.parseInt(pageNumS);
			 int pageSize = parameters.getInt("pageSize");
			 int userId = currentUser.getUserId();
			 
			 Page<Course> pageCourse = this.findPageObject(pageNum, pageSize, userId);
			 List<Course> courseList = pageCourse.getData();
			 JSONArray jsonArray = new JSONArray();	
			 JSONArray noteNumList = new JSONArray();
			 JSONArray folderNumList = new JSONArray();
			 for(int i = 0;i<courseList.size();i++){
				 jsonArray.add(courseList.get(i).getName());
				 noteNumList.add(courseList.get(i).getNoteNum());
				 folderNumList.add(courseList.get(i).getFolderNum());
				  
			 }
			 o.put("courseNum", courseList.size());
			 o.put("courseList", jsonArray);
			 o.put("noteNumList", noteNumList);
			 o.put("folderNumList", folderNumList);
			 o.put("pageTotal",pageCourse.getTotalPage());
		 }
		 response.getWriter().print(o.toString());	
	}
	/**
	 * 根据userId,页面大小和页面编号找寻一个页面对象
	 * @param pageNum
	 * @param pageSize
	 * @return返回一个页面对象
	 */
	public Page<Course> findPageObject(int pageNum, int pageSize,int userId){
		courseDao = new CourseDao();
		Page<Course> pageCourse = courseDao.findPageObject(pageNum, pageSize, userId);
		
		return pageCourse;
	}

}
