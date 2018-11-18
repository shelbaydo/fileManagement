package serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.OperationService;
import daoImpl.CourseDao;
import daoImpl.FolderDao;
import entity.Course;
import entity.Folder;

public class FolderServlet extends HttpServlet implements OperationService{

	private FolderDao folderDao = new FolderDao();
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

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Folder folder = null;
		HttpSession session = request.getSession(true);
		CourseDao courseDao = new CourseDao();
		String type = request.getParameter("type");	
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		Course course= courseDao.searchCourseById(courseId);
		String courseName = course.getName();
		if(type.equals("Folder")){
			folder = (Folder)folderDao.findObjectByCouserIdAN(courseId, request.getParameter("name"));
			if(folder==null){
				folder = new Folder();
				folder.setCourseId(courseId);
				folder.setName(request.getParameter("name"));
				if(folderDao.addObject(folder)){
					request.setAttribute("courseName", courseName);
					request.setAttribute("message", "succeed");
					request.getRequestDispatcher("/CourseUnit").forward(request, response);
				}else{
					request.setAttribute("message", "failed");
					request.getRequestDispatcher("/CourseUnit").forward(request, response);
				}
			}
			
		}	
	}

}
