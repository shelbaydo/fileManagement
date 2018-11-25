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
import daoImpl.NoteDao;
import entity.Course;
import entity.Folder;
import entity.MyFile;
import entity.Note;
import entity.Page;
import entity.User;
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
	User user = (User)session.getAttribute("currentUser");
	int userId = user.getUserId();
	Map<String,String> returnJson = new HashMap();
	JSONObject o = JSONObject.fromObject(returnJson);
	JSONObject parameters = JsonParse.getParameters(request);
	FolderDao folderDao = new FolderDao();
	String type = (String)parameters.get("type");
	List<Folder> folderList = null;
	if(type.equals("findAllFolder")){
		folderList = folderDao.findFoldersById(userId);
		JSONArray jsonArray = new JSONArray();		
	 for(int i = 0;i<folderList.size();i++){
		 jsonArray.add(folderList.get(i).getName());
	 }
	 o.put("folderNum", folderList.size());
	 o.put("folderList", jsonArray);
	 response.getWriter().print(o.toString());
	}else if(type.equals("findAllFiles")){
		List<MyFile> fileList = null;
		int foldId = (Integer)parameters.get("foldId");
		fileList = this.findAllFiles(foldId);
		response.getWriter().print(o.toString());
	}else if(type.equals("checkE")){
		String name = (String)parameters.get("name");
		Folder folder = folderDao.findFolderByNameAndUserId(name, userId);
		if(folder==null){
			o.put("checkResult", "ok");
			
		}else{
			o.put("checkResult", "no");
		}
		 response.getWriter().print(o.toString());
	}else if(type.equals("findFolderInPage")){
		
		int pageNum = parameters.getInt("pageNum");
		int pageSize = parameters.getInt("pageSize"); 
		Page<Folder> pageFolder = this.findPageObject(pageNum, pageSize, userId);
		folderList = pageFolder.getData();
	    JSONArray jsonArray = new JSONArray();
		for(int i = 0;i<folderList.size();i++){
		    jsonArray.add(folderList.get(i).getName());
	    }
	    o.put("folderNum", folderList.size());
	    o.put("folderList", jsonArray);
	    o.put("pageNum", pageFolder.getPageNum()); 
	    o.put("pageTotal",pageFolder.getTotalPage());
	    response.getWriter().print(o.toString());
	}
	 
}
	private Page<Folder> findPageObject(int pageNum, int pageSize, int userId) {
		folderDao = new FolderDao();
		Page<Folder> pageFolder = folderDao.findPageObject(pageNum, pageSize, userId);
		
		return pageFolder;
	
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
