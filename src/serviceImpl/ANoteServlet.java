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
import entity.Page;
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
		String courseNameOfNote = null;
		String noteCreateTime = null;
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
		if(type.equals("find4LatestNote")){
			int userId = user.getUserId();
		    noteList = this.find4LatestNotes(userId);
		    for(int i = 0;i<noteList.size();i++){
			    jsonArray.add(noteList.get(i).getTitle());
			    noteIdArray.add(noteList.get(i).getNoteId());
			    courseNameArray.add(this.findCourseNameOfNote(noteList.get(i).getNoteId()));
			    noteCreateTimeArray.add(noteList.get(i).getCreateTime().toString());
			    //session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
		    }
		    o.put("noteNum", noteList.size());
		    o.put("noteList", jsonArray);
		    o.put("noteIdList", noteIdArray);
		    o.put("courseNameOfNoteList",courseNameArray);
		    o.put("createTimeOfNoteList", noteCreateTimeArray);
		}	
		if(type.equals("limitedSearchForNotes")){
			Page<Note> pageNote = null;
			int userId = user.getUserId();
			int isPublic = parameters.getInt("isPublic");
			String courseScope = parameters.getString("courseScope");
			String noteTitle = parameters.getString("noteTitle");
			int pageNum = parameters.getInt("pageNum");
			int pageSize = parameters.getInt("pageSize"); 
			
			if(noteTitle.equals("")){
				if(isPublic==0){
					if(courseScope.equals("���пγ�")){
						pageNote = this.findPageObject(pageNum, pageSize, userId);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScope(pageNum, pageSize, userId,courseScope);
						noteList = pageNote.getData();
					}
				}else if(isPublic==1){
					if(courseScope.equals("���пγ�")){
						pageNote = this.findPageObjectByVisibility(pageNum, pageSize, userId,true);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScopeByVisibility(pageNum, pageSize, userId,courseScope,true);
						noteList = pageNote.getData();
					}
				}else if(isPublic==-1){
					if(courseScope.equals("���пγ�")){
						pageNote = this.findPageObjectByVisibility(pageNum, pageSize, userId,false);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScopeByVisibility(pageNum, pageSize, userId,courseScope,false);
						noteList = pageNote.getData();
					}
				}
			}else{
				//ʵ�ֱʼǱ����ģ����ѯ
				pageNote = this.findPageObjectWithTitle(pageNum, pageSize,noteTitle,userId);
				noteList = pageNote.getData();
			}   
		    for(int i = 0;i<noteList.size();i++){
			    jsonArray.add(noteList.get(i).getTitle());
			    noteIdArray.add(noteList.get(i).getNoteId());
			    courseNameArray.add(this.findCourseNameOfNote(noteList.get(i).getNoteId()));
			    noteCreateTimeArray.add(noteList.get(i).getCreateTime().toString());
			    //session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
		    }
		    o.put("noteNum", noteList.size());
		    o.put("noteList", jsonArray);
		    o.put("noteIdList", noteIdArray);
		    o.put("courseNameOfNoteList",courseNameArray);
		    o.put("createTimeOfNoteList", noteCreateTimeArray);
		    o.put("pageTotal",pageNote.getTotalPage());
		}	
		if(type.equals("findNotesInPage")){
			int userId = user.getUserId();
			int pageNum = parameters.getInt("pageNum");
			int pageSize = parameters.getInt("pageSize"); 
			Page<Note> pageNote = this.findPageObject(pageNum, pageSize, userId);
			noteList = pageNote.getData();
		    for(int i = 0;i<noteList.size();i++){
			    jsonArray.add(noteList.get(i).getTitle());
			    noteIdArray.add(noteList.get(i).getNoteId());
			    courseNameArray.add(this.findCourseNameOfNote(noteList.get(i).getNoteId()));
			    noteCreateTimeArray.add(noteList.get(i).getCreateTime().toString());
			    //session.setAttribute(noteList.get(i).getTitle(),noteList.get(i));
		    }
		    o.put("noteNum", noteList.size());
		    o.put("noteList", jsonArray);
		    o.put("noteIdList", noteIdArray);
		    o.put("courseNameOfNoteList",courseNameArray);
		    o.put("createTimeOfNoteList", noteCreateTimeArray);
		    o.put("pageTotal",pageNote.getTotalPage());
		}	
		response.getWriter().print(o.toString());
	}
	/**
	 * ���ݱʼ�titleģ����ѯҳ�����
	 * @param noteTitle
	 * @return
	 */
	public Page<Note> findPageObjectWithTitle(int pageNum,
			int pageSize,String noteTitle,int userId) {
		
		return noteDao.findPageObjectWithTitle(pageNum,pageSize,noteTitle,userId);
	}
	/**
	 *  ����userId,�γ���,�Ƿ񹫿���ҳ���С��ҳ������Ѱһ��ҳ�����
	 * @param pageNum
	 * @param pageSize
	 * @param userId
	 * @param courseScope
	 * @param isPublic
	 * @return
	 */
	private Page<Note> findPageObjectInCourseScopeByVisibility(int pageNum,
			int pageSize, int userId, String courseScope, boolean isPublic) {
		noteDao = new NoteDao();
		Page<Note> pageNote = noteDao.findPageObjectInCourseScopeByVisibility(pageNum, pageSize, userId,courseScope,isPublic);
		
		return pageNote;
		
	}
	/**
	 * ����userId,�Ƿ񹫿���ҳ���С��ҳ������Ѱһ��ҳ�����
	 * @param pageNum
	 * @param pageSize
	 * @param userId
	 * @param isPublic
	 * @return
	 */
	private Page<Note> findPageObjectByVisibility(int pageNum, int pageSize,
			int userId, boolean isPublic) {
		noteDao = new NoteDao();
		Page<Note> pageNote = noteDao.findPageObjectByVisibility(pageNum,pageSize,userId,isPublic);
		
		return pageNote;
	
	}
	/**
	 * ����userId,�γ���,ҳ���С��ҳ������Ѱһ��ҳ�����
	 * @param pageNum
	 * @param pageSize
	 * @param courseScope
	 * @return����һ��ҳ�����
	 */
	public Page<Note> findPageObjectInCourseScope(int pageNum, int pageSize,
			int userId, String courseScope) {
		
		noteDao = new NoteDao();
		Page<Note> pageNote = noteDao.findPageObjectInCourseScope(pageNum, pageSize, userId,courseScope);
		
		return pageNote;
	}
	private String findCourseNameOfNote(int noteId) {
		// TODO Auto-generated method stub
		return noteDao.findCourseNameOfNote(noteId);
	}
	/**
	 * ����userId,ҳ���С��ҳ������Ѱһ��ҳ�����
	 * @param pageNum
	 * @param pageSize
	 * @return����һ��ҳ�����
	 */
	public Page<Note> findPageObject(int pageNum, int pageSize,int userId){
		noteDao = new NoteDao();
		Page<Note> pageNote = noteDao.findPageObject(pageNum, pageSize, userId);
		
		return pageNote;
	}
}
