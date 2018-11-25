package controlers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DistributionCenter extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String type = request.getParameter("type");
		if(type!=null){
			if(type.equals("login")){
				request.getRequestDispatcher("/LoginServlet").forward(request, response);
			}
			if(type.equals("register")){
				request.getRequestDispatcher("/RegisterServlet").forward(request, response);
			}
			if(type.equals("course")){
				request.getRequestDispatcher("/CourseServlet").forward(request, response);
			}
			if(type.equals("Comment")){
				request.getRequestDispatcher("/CommentServlet").forward(request, response);
			}
			if(type.equals("Event")){
				request.getRequestDispatcher("/EventServlet").forward(request, response);
			}
			if(type.equals("Favorite")){
				request.getRequestDispatcher("/FavoriteServlet").forward(request, response);
			}
			if(type.equals("FFolder")){
				request.getRequestDispatcher("/FFolderServlet").forward(request, response);
			}
			if(type.equals("Folder")){
				request.getRequestDispatcher("/FolderServlet").forward(request, response);
			}
			if(type.equals("Message")){
				request.getRequestDispatcher("/MessageServlet").forward(request, response);
			}
			if(type.equals("Note")){
				request.getRequestDispatcher("/NoteServlet").forward(request, response);
			}
			if(type.equals("Question")){
				request.getRequestDispatcher("/QuestionServlet").forward(request, response);
			}
			if(type.equals("Reply")){
				request.getRequestDispatcher("/ReplyServlet").forward(request, response);
			}
			
		}else{
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		
	}

}
