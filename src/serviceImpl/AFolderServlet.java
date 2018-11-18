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
import daoImpl.FileDao;
import daoImpl.FolderDao;
import entity.Course;
import entity.Folder;
import entity.MyFile;
public class AFolderServlet extends HttpServlet {
	private FolderDao folderDao = new FolderDao();
	FileDao fileDao = new FileDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}	
public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	HttpSession session = request.getSession(true);
	Map<String,String> returnJson = new HashMap();
	JSONObject o = JSONObject.fromObject(returnJson);
	JSONObject parameters = JsonParse.getParameters(request);
	String type = (String)parameters.get("type");
	if(type.equals("findAllFolder")){
		
		String courseName = (String)parameters.get("courseName");
		Course course = (Course)session.getAttribute(courseName);
		int courseId = course.getCourseId();
		JSONArray jsonArray = new JSONArray();	
		JSONArray folderIdArray = new JSONArray();
		List<Folder> folderList = this.findAllFolders(courseId);
		 for(int i = 0;i<folderList.size();i++){
			 jsonArray.add(folderList.get(i).getName());
			 folderIdArray.add(folderList.get(i).getFoldId());
			 //session.setAttribute(folderList.get(i).getTitle(),folderList.get(i));
		 }
		 o.put("folderNum", folderList.size());
		 o.put("folderList", jsonArray);
		 o.put("folderIdList", folderIdArray);
	}else if(type.equals("findAllFiles")){
		List<MyFile> fileList = null;
		int foldId = (Integer)parameters.get("foldId");
		fileList = this.findAllFiles(foldId);
		
	}
	
	 response.getWriter().print(o.toString());
}
	/**
 * 根据课程id查找所有的文件夹
 * 
 * @param courseId 参数为课程id
 * @return 返回所有的文件夹集合
 */
	public List<Folder> findAllFolders(int courseId){
		
		return folderDao.findFoldersById(courseId);
	}
/**
 * 根据课程文件夹id查找所有的文件
 * 
 * @param foldId 参数为文件夹id
 * @return 返回所有的文件集合
 */
	public List<MyFile> findAllFiles(int foldId){
		
		return fileDao.findFilesById(foldId);
	}

}
