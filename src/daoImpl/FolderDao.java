package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;
import dao.Dao;
import entity.Folder;
import entity.Note;

public class FolderDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	/**
	 * 根据传入的对象创建一个实体存入数据库
	 * 参数为要插入的对象
	 * 插入成功返回真，否则返回假
	 */
	public Boolean addObject(Object o) {
		
		Folder folder = (Folder)o;
		String sql = "insert into folder(name,courseId) values(?,?)";
		int row = 0;
		try {
			row = qr .update(sql,folder.getName(),folder.getCourseId());
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
	/**
	 * 根据文件夹编号查找文件夹对象
	 * 参数是文件夹编号
	 * 返回一个文件夹对象
	 */
	public Object findObjectById(int id) {
		List<Folder> folderList = null;
		String sql = "select * from folder where foldId = ?";
		try {
			folderList = qr.query(sql, new BeanListHandler<Folder>(Folder.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return folderList.get(0);	
		
	}
/**
 * 通过课程编号和文件夹名查找文件对象
 * 参数为课程编号和文件名
 * 返回找到的对象
 * @param id
 * @return
 */
	public Object findObjectByCouserIdAN(int id,String name) {
		List<Folder> folderList = null;
		String sql = "select * from folder where courseId = ? and name=?";
		try {
			folderList = qr.query(sql, new BeanListHandler<Folder>(Folder.class),id,name);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(folderList.isEmpty()){
			return null;
		}else{
			return folderList.get(0);	
		}
		
	}
	public List<Object> findObjectsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Boolean modifyObject(Object o) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 根据课程号查找所有的文件夹
	 * 	 * @param id
	 * @return
	 */
	public List<Folder> findFoldersById(int id) {
		List<Folder> folderList = null;
		String sql = "select * from folder where courseId = ?";

		try {
			folderList = qr.query(sql, new BeanListHandler<Folder>(Folder.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return folderList;
	
	}
}
