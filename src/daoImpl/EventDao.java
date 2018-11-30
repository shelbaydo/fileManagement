package daoImpl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.Event;

public class EventDao implements Dao{
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
    //将event对象添加到数据库中
	public Boolean addObject(Object o) {
		Event event = (Event)o;
		int userId = event.getUserId();
		int eventId = event.getEventId();
		String createTime = event.getCreateTime();
		String endTime = event.getEndTime();
		boolean isExpired = event.isExpired();
		String content = event.getContent();
		
		String sql = "insert into event(userId,createTime,endTime,isExpired,content) values(?,?,?,?,?)";
		int rows = 0;
		try{
			rows = qr.update(sql,userId,createTime,endTime,isExpired,content);
		}catch(SQLException x){
			x.printStackTrace();
		}
        if(rows > 0){
        	return true;
        }
        else{
        	return false;
        }
	}

	public Boolean deleteObjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Object> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	//设置剩余时间比现在时间小的isExpired为1
    //查找剩余时间少于一天并且有效的事件列表
	public void setIsExpired(Date nowTime){
		long nowTimestamp = nowTime.getTime();
		String sql = "UPDATE EVENT SET isExpired=1 WHERE UNIX_TIMESTAMP(endTime)-? <0";
		try{
			qr.update(sql,nowTimestamp);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public Object findObjectByTime(Date nowTime){
		List<Event> eventList = null;
		long nowTimestamp = nowTime.getTime();
		String sql = "select * from event where UNIX_TIMESTAMP(endTime)-?<86400000 and isExpired=0";
		try{
			eventList = qr.query(sql, new BeanListHandler<Event>(Event.class),nowTimestamp);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return eventList;
	}
	public Object findObjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Object> findObjectsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Boolean modifyObject(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

}
