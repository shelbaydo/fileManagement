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
import utils.JsonParse;
import daoImpl.NoteDao;
import entity.Course;
import entity.Note;
import entity.User;

public class ANoteServlet extends HttpServlet {

	private NoteDao noteDao = new NoteDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
		
	}
/**
 * ���ݿγ�id�������еıʼ�
 * 
 * @param courseId ����Ϊ�γ�id
 * @return �������еıʼǼ���
 */
	public List<Note> findAllNotes(int courseId){
		
		return noteDao.findNotesById(courseId);
	}
/**
 * �������ݿ������µ��ĸ��ʼ�
 * @param userId ����Ϊ�û�ID
 * @return���������ĸ��ʼǵļ���
 */
	public List<Note> find4LatestNotes(int userId){
		
		return noteDao.find4LatestNotes(userId);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("currentUser");
		Map<String,String> returnJson = new HashMap();
		JSONObject o = JSONObject.fromObject(returnJson);
		JSONObject parameters = JsonParse.getParameters(request);
		String type = (String)parameters.get("type");
		Course course = null;
		int courseId = 0;
		JSONArray jsonArray = new JSONArray();	
		JSONArray noteIdArray = new JSONArray();
		JSONArray courseNameArray = new JSONArray();
		JSONArray noteCreateTimeArray = new JSONArray();
		List<Note> noteList = null;
		List<String> courseNameOfNoteList = null;  
		if(type.equals("findAllNote")){
			String courseName = (String)parameters.get("courseName");
			course = (Course)session.getAttribute(courseName);
			courseId = course.getCourseId();		
		    noteList = this.findAllNotes(courseId);
		   
			 for(int i = 0;i<noteList.size();i++){
				 jsonArray.add(noteList.get(i).getTitle());
				 noteIdArray.add(noteList.get(i).getNoteId());				 
				 //session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
			 }
			 o.put("noteNum", noteList.size());
			 o.put("noteList", jsonArray);
			 o.put("noteIdList", noteIdArray);
		}
		if(type.equals("find4LastestNote")){
			
			int userId = user.getUserId();
		    noteList = this.find4LatestNotes(userId);
		    String courseNameOfNote = null;
		    String noteCreateTime = null;
		    for(int j=0;j<noteList.size();j++){
		    	courseNameOfNote = this.findCourseNameOfNote(noteList.get(j).getNoteId());
		    	courseNameOfNoteList.add(courseNameOfNote);
		    }
		    for(int i = 0;i<noteList.size();i++){
			    jsonArray.add(noteList.get(i).getTitle());
			    noteIdArray.add(noteList.get(i).getNoteId());
			    courseNameArray.add(courseNameOfNoteList.get(i));
			    //session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
		    }
		    o.put("noteNum", noteList.size());
		    o.put("noteList", jsonArray);
		    o.put("noteIdList", noteIdArray);
		    o.put("courseNameOfNoteList",courseNameArray);
		}		
		response.getWriter().print(o.toString());
	}
	private String findCourseNameOfNote(int noteId) {
		// TODO Auto-generated method stub
		return noteDao.findCourseNameOfNote(noteId);
	}

}
