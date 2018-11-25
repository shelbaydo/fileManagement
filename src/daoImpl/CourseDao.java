package daoImpl;

import java.sql.SQLException;
import java.util.List;

import javax.jms.Topic;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.C3P0Utils;
import dao.Dao;
import entity.Course;
import entity.Page;

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
 * 通过用户编号，查找所有的课程
 * 返回所有课程列表
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
		Course course = (Course)o;
		int id = course.getCourseId();
		int noteNum = course.getNoteNum();
		String sql="update course set noteNum = ? where courseId = ?";
		int row = 0;
		try {
			row = qr .update(sql,noteNum,id);
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
 * 查找数据库中最新的两门课程
 * @param userId 参数为用户ID
 * @return返回最新两门课程的集合
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
	/**
	 * 获取一页的数据对象，参数是页号，和每页对象数目
	 * @param pageNum
	 * @param pageSize
	 * @return 返回一个页对象
	 */
	public Page<Course> findPageObject(int pageNum, int pageSize,int userId) {
		int totals = this.getTotalNum(userId);//获取总记录数
		Page<Course> page = new Page<Course>(pageNum, pageSize, totals );
		
		String sql = "select * from course where userId = ? LIMIT ?,?";
		
		try {
			List<Course> courses = qr.query(sql, new BeanListHandler<Course>(Course.class),userId,page.getStartIndex(),pageSize);
		
			page.setData(courses);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;
	}
	/**
	 * 获取数据库中对象总数
	 * @return
	 */
	public int getTotalNum(int userId) {
		
		String sql ="select count(1) from course where userId = ?";
		Object obj =null;
		try{
			//ScalarHandler返回列表中某列的值
			obj = qr.query(sql, new ScalarHandler(),userId);
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  Integer.parseInt( obj.toString() );
	}

	public Course findCourseByIdAndName(String name, int userId) {
		String sql = "select * from course where name = ? and userId = ?";
		List<Course> courses = null;
		try {
			courses = qr.query(sql, new BeanListHandler<Course>(Course.class),name,userId);
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return courses.get(0);
	}


}
