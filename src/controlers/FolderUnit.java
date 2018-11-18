package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.FolderDao;
import entity.Folder;

public class FolderUnit extends HttpServlet {

	FolderDao folderDao = new FolderDao();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("folderId"));
		System.out.println(id);
		Folder folder = (Folder)folderDao.findObjectById(id);
		System.out.println(folder.getName());
		request.setAttribute("requestedFolder", folder);			
		request.getRequestDispatcher("/folderMainPage.jsp").forward(request, response);	
	}

}
