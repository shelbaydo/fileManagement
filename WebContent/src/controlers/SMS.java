package controlers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import serviceImpl.UserService;

import utils.JsonParse;

public class SMS extends HttpServlet {

	private Map<String,String> returnJson ;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		returnJson = new HashMap();
		UserService userService = new UserService();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8"); 
		JSONObject parameters = JsonParse.getParameters(request);
		String phone = (String)parameters.get("phone");
		String type = (String)parameters.get("type");
		
		if(type.equals("verifyingphone")){
			
			if(userService.searchUserByPhone(phone)){
				returnJson.put("msg", "用户已存在");
			}else{
				
			}
		}else if(type.equals("askingcode")){
			Random r = new Random();
			int randomNum = r.nextInt(10000);
			returnJson.put("code", String.valueOf(randomNum));
		}else if(type.equals("verifyingphoneForLogin")){
			if(userService.searchUserByPhone(phone)){
				
			}else{
				returnJson.put("msg", "用户不存在，请先注册");
			}
		}
		JSONObject o = JSONObject.fromObject(returnJson); 
		response.getWriter().print(o.toString());		
	}

}
