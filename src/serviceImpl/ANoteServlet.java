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
import daoImpl.CourseDao;
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
 * 根据课程id查找所有的笔记
 * 
 * @param courseId 参数为课程id
 * @return 返回所有的笔记集合
 */
	public List<Note> findAllNotes(int courseId){
		
		return noteDao.findNotesById(courseId);
	}
/**
 * 查找数据库中最新的四个笔记
 * @param userId 参数为用户ID
 * @return返回最新四个笔记的集合
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
		int userId = user.getUserId();
		Map<String,String> returnJson = new HashMap();
		JSONObject o = JSONObject.fromObject(returnJson);
		JSONObject parameters = JsonParse.getParameters(request);
		String type = (String)parameters.get("type");
		Course course = null;
		CourseDao courseDao = new CourseDao();
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
		if(type.equals("findNote")){
			String courseName = (String)parameters.get("courseName");
			String noteTitle = (String)parameters.get("noteTitle");
			course = courseDao.findCourseByIdAndName(courseName, userId);
			courseId = course.getCourseId();
			Note note = noteDao.findNoteByTitleAId(noteTitle,courseId);
			o.put("content", note.getContent());
		}
		if(type.equals("find4LatestNote")){
			userId = user.getUserId();
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
			userId = user.getUserId();
			int isPublic = parameters.getInt("isPublic");
			String courseScope = parameters.getString("courseScope");
			String noteTitle = parameters.getString("noteTitle");
			int pageNum = parameters.getInt("pageNum");
			int pageSize = parameters.getInt("pageSize"); 
			
			if(noteTitle.equals("")){
				if(isPublic==0){
					if(courseScope.equals("所有课程")){
						pageNote = this.findPageObject(pageNum, pageSize, userId);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScope(pageNum, pageSize, userId,courseScope);
						noteList = pageNote.getData();
					}
				}else if(isPublic==1){
					if(courseScope.equals("所有课程")){
						pageNote = this.findPageObjectByVisibility(pageNum, pageSize, userId,true);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScopeByVisibility(pageNum, pageSize, userId,courseScope,true);
						noteList = pageNote.getData();
					}
				}else if(isPublic==-1){
					if(courseScope.equals("所有课程")){
						pageNote = this.findPageObjectByVisibility(pageNum, pageSize, userId,false);
						noteList = pageNote.getData();
					}else{
						pageNote = this.findPageObjectInCourseScopeByVisibility(pageNum, pageSize, userId,courseScope,false);
						noteList = pageNote.getData();
					}
				}
			}else{
				//实现笔记标题的模糊查询
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
			userId = user.getUserId();
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
	 * 根据笔记title模糊查询页面对象
	 * @param noteTitle
	 * @return
	 */
	public Page<Note> findPageObjectWithTitle(int pageNum,
			int pageSize,String noteTitle,int userId) {
		
		return noteDao.findPageObjectWithTitle(pageNum,pageSize,noteTitle,userId);
	}
	/**
	 *  根据userId,课程名,是否公开，页面大小和页面编号找寻一个页面对象
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
	 * 根据userId,是否公开，页面大小和页面编号找寻一个页面对象
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
	 * 根据userId,课程名,页面大小和页面编号找寻一个页面对象
	 * @param pageNum
	 * @param pageSize
	 * @param courseScope
	 * @return返回一个页面对象
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
	 * 根据userId,页面大小和页面编号找寻一个页面对象
	 * @param pageNum
	 * @param pageSize
	 * @return返回一个页面对象
	 */
	public Page<Note> findPageObject(int pageNum, int pageSize,int userId){
		noteDao = new NoteDao();
		Page<Note> pageNote = noteDao.findPageObject(pageNum, pageSize, userId);
		
		return pageNote;
	}
}
