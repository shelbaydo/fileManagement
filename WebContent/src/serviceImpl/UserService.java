package serviceImpl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.OperationService;
import daoImpl.UserDao;
import entity.User;

public class UserService implements OperationService {
	private UserDao userDao = new UserDao();
	/**
	 * 通过手机号查找是否存在对应的用户
	 * @param phone 字符串类型的手机号
	 * @return 已存在返回真，不存在返回假
	 */
	public Boolean searchUserByPhone(String phone){
		if((userDao.findObjectByPhone(phone)).isEmpty()){
			return false;
		}else{
			return true;
		}
	}
	@Override
	/**
	 * 添加user记录到数据库
	 * 参数：user对象
	 * 返回值：添加成功返回真，添加失败返回假
	 */
	public Boolean add(Object o) {
		User user = (User)o;
		if(userDao.addObject(user)){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Boolean modify(Object o) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 通过电话号码查找用户
	 * @param phone
	 * @return 返回当前登录用户对象
	 */
	public User findUserByPhone(String phone) {
		List<User> list = (List<User>)userDao.findObjectByPhone(phone);	
		return list.get(0);
	}
	

}
