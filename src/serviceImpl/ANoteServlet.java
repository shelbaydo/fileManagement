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

import daoImpl.NoteDao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import utils.JsonParse;
import entity.Course;
import entity.Note;

public class ANoteServlet extends HttpServlet {

	private NoteDao noteDao = new NoteDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}
/**
 * 根据课程id查找所有的笔记
 * 
 * @param courseId 参数为课程id
 * @return 返回所有的笔记集合
 */
	public List<Note> findAllNotes(int courseId){
		
		return noteDao.findNotesById(courseId);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		Map<String,String> returnJson = new HashMap();
		JSONObject o = JSONObject.fromObject(returnJson);
		JSONObject parameters = JsonParse.getParameters(request);
		String courseName = (String)parameters.get("courseName");
		System.out.println(courseName);
		Course course = (Course)session.getAttribute("courseName");
		System.out.println(course);
		int courseId = course.getCourseId();
		JSONArray jsonArray = new JSONArray();		
		List<Note> noteList = this.findAllNotes(courseId);
		 for(int i = 0;i<noteList.size();i++){
			 jsonArray.add(noteList.get(i).getTitle());
			 session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
		 }
		 o.put("noteNum", noteList.size());
		 o.put("noteList", jsonArray);
		 response.getWriter().print(o.toString());
	}

}
