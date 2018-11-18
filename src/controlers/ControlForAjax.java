package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import utils.JsonParse;

public class ControlForAjax extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		//response.setContentType("text/plain;charset=utf-8"); 
		JSONObject parameters = JsonParse.getParameters(request);
		String type =(String) parameters.get("type");
		HttpSession session = request.getSession(true);
		if(type.equals("quitLogin")){
			session.removeAttribute("currentUser");	
		}
	}
}
