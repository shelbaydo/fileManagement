package serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.OperationService;
import daoImpl.CourseDao;
import daoImpl.NoteDao;
import entity.Course;
import entity.Note;
import entity.Page;
import entity.User;

public class NoteServlet extends HttpServlet implements OperationService{
	private NoteDao noteDao = new NoteDao();
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
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("currentUser");
		CourseDao courseDao = new CourseDao();
		String type = request.getParameter("type");	
		if(type.equals("Note")){
			Note note = new Note();
			note.setTitle(request.getParameter("title"));
			note.setContent(request.getParameter("content"));
			if(request.getParameter("isPublic").equals("yes")){
				note.setPublic(true);
			}else if(request.getParameter("isPublic").equals("no")){
				note.setPublic(false);
			}		
			String name = request.getParameter("courseName");
			int userId = user.getUserId();
			Course course  = courseDao.findCourseByIdAndName( name, userId);
			course.setNoteNum(course.getNoteNum()+1);
			if(!(courseDao.modifyObject(course))){
				request.setAttribute("message", "failed");
				request.getRequestDispatcher("/CourseUnit").forward(request, response);
			}
			note.setCourseId(course.getCourseId());
			note.setUserId(user.getUserId());
			if(noteDao.addObject(note)){
				int noteNum = user.getNoteNum();
				user.setNoteNum(noteNum+1);
				request.setAttribute("courseName", request.getParameter("courseName"));
				request.setAttribute("message", "succeed");
				request.getRequestDispatcher("/CourseUnit").forward(request, response);
			}else{ 
				request.setAttribute("message", "failed");
				request.getRequestDispatcher("/CourseUnit").forward(request, response);
			}
		}	
	}
	

}
