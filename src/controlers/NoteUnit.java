package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.NoteDao;
import entity.Note;

public class NoteUnit extends HttpServlet {
	NoteDao noteDao = new NoteDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("noteId"));
		Note note = (Note)noteDao.findObjectById(id);
		request.setAttribute("requestedNote", note);
				
		request.getRequestDispatcher("/noteMainPage.jsp").forward(request, response);	
		
	}

}
