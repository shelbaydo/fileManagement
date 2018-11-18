package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.User;

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
		
		return null;
	}
/**
 * ͨ���û���ţ��������еĿγ�
 * �������пγ��б�
 */
	public Object findObjectById(int id) {
		List<Course> courseList = null;
		String sql = "select * from course where userId = ?";
		try {
			courseList = qr.query(sql, new BeanListHandler<Course>(Course.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;
	}

	public List<Object> findObjectsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Boolean modifyObject(Object o) {
		// TODO Auto-generated method stub
		return null;
	}


	public Course searchCourseById(int courseId) {
		List<Course> courseList = null;
		String sql = "select * from course where courseId = ?";
		try {
			courseList = qr.query(sql, new BeanListHandler<Course>(Course.class),courseId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList.get(0);
	}
/**
 * �������ݿ������µ����ſγ�
 * @param userId ����Ϊ�û�ID
 * @return�����������ſγ̵ļ���
 */
	public List<Course> find2LatestCourse(int userId) {
		
		List<Course> courseList = null;
		String sql = "select * from course where userId = ? order by createTime desc limit 2";
		try {
			courseList = qr.query(sql, new BeanListHandler<Course>(Course.class),userId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;
	}

}
