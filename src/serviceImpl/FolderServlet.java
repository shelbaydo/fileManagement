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
import entity.User;

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
		FolderDao folderDao = new FolderDao();
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("currentUser");
		String name = request.getParameter("name");
		int userId = user.getUserId();
		String type = request.getParameter("type");	
		if(type.equals("Folder")){
			folder = folderDao.findFolderByNameAndUserId(name,userId);
			if(folder==null){
				folder = new Folder();
				folder.setName(name);
				folder.setUserId(userId);
				if(folderDao.addObject(folder)){		
					response.sendRedirect("/fileManagement/personalPage/folder.jsp");
				}else{
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			}else{
				
			}
			
		}	
	}

}
