package daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import com.mysql.jdbc.ResultSetMetaData;

import dao.Dao;
import entity.User;

public class UserDao implements Dao {
	
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	public Boolean addObject(Object o) {
		User user = (User)o;
		String username = user.getUsername();
		String phone = user.getPhone();
		String password = user.getPassword();
		String sql = "insert into user(username,phone,password) values(?,?,?)";
		int row = 0;
		try {
			row = qr .update(sql,username,phone,password);
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
		
		return null;
	}

	public List<Object> findObjectsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
/**
 * 更新数据库中的对象
 * 参数是个对象的最新状态
 * 更新成功返回真
 * 
 */
	public Boolean modifyObject(Object o) {
		User user = (User)o;
		int userId = user.getUserId();
		String username = user.getUsername();
	
		int age = user.getAge();
		String Ed = user.getEd();
		String major = user.getMajor();
		String school = user.getSchool();
		String semester = user.getSemester();
	    String signature = user.getSignature();
		String sql = "update user set username = ?,age = ?,ed = ?,major = ?,school = ?,semester = ?,signature = ? where " +
				"userId = ?";
		try {
			if((qr.update(sql, username,age,Ed,major,school,semester,signature,userId))!= 0){
				return true;
			
			}else{
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	/**
	 * 根据电话号码查找用户对象
	 * @param phone
	 * @return 返回用户对象
	 */
	public List<User> findObjectByPhone(String phone) {
		List<User> userList = null;
		String sql = "select * from user where phone = ?";
		try {
			userList = qr.query(sql, new BeanListHandler<User>(User.class),phone);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}

}
