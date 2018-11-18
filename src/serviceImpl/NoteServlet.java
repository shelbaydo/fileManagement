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
import daoImpl.NoteDao;
import entity.Course;
import entity.Note;

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
			Course course = (Course)session.getAttribute(request.getParameter("courseName"));
			
			note.setCourseId(course.getCourseId());
			if(noteDao.addObject(note)){
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
