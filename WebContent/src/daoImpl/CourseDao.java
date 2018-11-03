package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;

public class CourseDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	public Boolean addObject(Object o) {
		Course course = (Course)o;
		String courseName = course.getName();
		int userId = course.getUserId();
		
		String sql = "insert into course(userId,name) values(?,?)";
		int row = 0;
		try {
			row = qr .update(sql,userId,courseName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		if(row>0){
			return true;
		}else{
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
