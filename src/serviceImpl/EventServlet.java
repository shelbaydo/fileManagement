package serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import dao.Dao;
import daoImpl.CourseDao;
import daoImpl.EventDao;
import entity.Course;
import entity.Event;
import entity.User;

import services.OperationService;
import utils.JsonParse;

public class EventServlet extends HttpServlet implements OperationService {

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
		this.doPost(request, response);
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		
		//将request对象转化成json对象
		JSONObject jo = JsonParse.getParameters(request);
		
		String type = jo.getString("type");
		
		//添加event事件
		if(type.equals("addEvent")){
		//返回信息
		JSONObject returnBack = new JSONObject();	
		//获取登录者信息id
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		
		int userId = currentUser.getUserId();
		//获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createTimeDate = new Date();
		String createTime = sdf.format(createTimeDate);
		
		//获取事件结束时间
		String date = jo.getString("date");
		String time = jo.getString("time");
		//String date = request.getParameter("date");
		//String time = request.getParameter("time");
		int hour = Integer.parseInt(jo.getString("hour"));
		//如果是下午时间，小时加12
		if(time.equals("下午")){
			hour = hour + 12;
		}
		String minute = jo.getString("minute");
		//String minute = request.getParameter("minute"); 
		String endTime = date + " "  + String.valueOf(hour) + ":" +minute + ":" +"00";
		try{
		Date endTimeDate = sdf.parse(endTime);
		boolean isExpired ;
		//如果结束时间大于系统现在时间，则设置isExpired 为1
		if(createTimeDate.compareTo(endTimeDate) < 0){
			isExpired = true;
		}
		else{
			isExpired = false;
		}
		
		String content = jo.getString("content");
		//String content = request.getParameter("content");
		
		Event event = new Event();
		event.setContent(content);
		event.setCreateTime(createTime);
		event.setEndTime(endTime);
		event.setExpired(isExpired);
		event.setUserId(userId);
		
		//添加事件入数据库
		Dao eventDao = new EventDao();
		
		//判断是否将事件添加成功
		boolean isAddSuccess;
		isAddSuccess = eventDao.addObject(event);
		if(isAddSuccess)
			returnBack.put("msg", "添加成功！");
		}
		catch(ParseException pe){
			System.out.print("格式转换错误");
		}	
		
		
		response.getWriter().print(returnBack.toString());
		}
		
		//显现event提示信息
		else if(type.equals("eventMassage")){
			
			Date nowTime = new Date();
			EventDao eventDao = new EventDao();
			
			JSONArray jsonArray = new JSONArray();
			List<Event> eventList = (List<Event>)eventDao.findObjectByTime(nowTime);
			eventDao.setIsExpired(nowTime);  
			//System.out.println(eventList.isEmpty());
			
			for (int i = 0;i < eventList.size(); i++){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("content", eventList.get(i).getContent());
				jsonObject.put("endTime", eventList.get(i).getEndTime().substring(0, 19));//去除endTime后面多出的(.0),
				jsonArray.add(jsonObject);
			}
			response.getWriter().print(jsonArray.toString());
			
		}
		
		
	}

}
