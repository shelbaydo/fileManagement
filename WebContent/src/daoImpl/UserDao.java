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
/**
 * 根据电话号码查找用户编号
 * @param phone
 * @return 用户编号
 *//*
	public int findUserIdByPhone(String phone) {
		int userId = 0;
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:odbc:filemanager");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select userId from user where phone= ?";
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet result = null;
		try {
			result = statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSetMetaData rd = null;
		try {
			rd = (ResultSetMetaData) result.getMetaData();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(result.next()) //这是一行一行递进
			for(int i=1;i<=rd.getColumnCount();++i){ //这是一列一列递进 每次输出一行
			userId = result.getInt("i");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userId;
	}*/
}
