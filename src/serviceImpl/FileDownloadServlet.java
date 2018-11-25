package serviceImpl;
import java.io.File;
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
import entity.Folder;
import entity.MyFile;
import entity.Page;
import entity.User;
public class FileDownloadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setCharacterEncoding("utf-8");
    	request.setCharacterEncoding("utf-8");
    	HttpSession session = request.getSession(true);
    	User user = (User)session.getAttribute("currentUser");
    	int userId = user.getUserId();
    	Map<String,String> returnJson = new HashMap();
    	JSONObject o = JSONObject.fromObject(returnJson);
    	JSONObject parameters = JsonParse.getParameters(request);
    	FileDao fileDao = new FileDao();
    	FolderDao folderDao = new FolderDao();
    	String type = (String)parameters.get("type");
    	List<MyFile> fileList = null;
    	if(type.equals("findAllFiles")){
    		String folderName = (String)parameters.get("folderName");
    		Folder folder = folderDao.findFolderByNameAndUserId(folderName, userId);
    		int folderId = folder.getFoldId();
    		 //获取上传文件的目录
            String uploadFilePath = this.getServletContext().getRealPath("/upload/"+folderId);
            //存储要下载的文件名
            File fileDirectory = new File(uploadFilePath);
            File [] files = fileDirectory.listFiles();
            List<String> fileNameList = null;
            for(File file:files){
            	fileNameList.add(file.getName());
            }
            JSONArray fileJsonArray =JSONArray.fromObject(fileNameList);
            o.put("fileList", fileJsonArray);
    	}else if(type.equals("findFilesInPage")){
    		
    		int pageNum = parameters.getInt("pageNum");
    		int pageSize = parameters.getInt("pageSize"); 
    		String folderName = (String)parameters.get("folderName");
    		
    		Folder folder = folderDao.findFolderByNameAndUserId(folderName, userId);
    		
    		int folderId = folder.getFoldId();
    		Page<MyFile> pageMyFile = this.findPageObject(pageNum, pageSize, folderId);
    		fileList = pageMyFile.getData();
    	    JSONArray jsonArray = new JSONArray();
    		for(int i = 0;i<fileList.size();i++){
    		    jsonArray.add(fileList.get(i).getFileName());
    		    
    	    }
    	    o.put("fileNum", fileList.size());
    	    o.put("fileList", jsonArray);
    	    o.put("pageNum", pageMyFile.getPageNum()); 
    	    o.put("pageTotal",pageMyFile.getTotalPage());
    	    response.getWriter().print(o.toString());	
    	}
       
    } 
    private Page<MyFile> findPageObject(int pageNum, int pageSize, int folderId) {
		
    	FileDao fileDao  = new FileDao();
		Page<MyFile> pageMyFile = fileDao.findPageObject(pageNum, pageSize, folderId);
		
		return pageMyFile;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}