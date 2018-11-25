package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Folder;
import entity.MyFile;
import entity.Note;
import entity.Page;

public class FileDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	/**
	 * 根据传入的对象创建一个实体存入数据库
	 * 参数为要插入的对象
	 * 插入成功返回真，否则返回假
	 */
	public Boolean addObject(Object o) {
		MyFile myFile = (MyFile)o;
		String sql = "insert into myfile(fileName,isDownloadable,folderId,location,size,fileType)values(?,?,?,?,?,?)";
		int row = 0;
		try {
			row = qr .update(sql,myFile.getFileName(),myFile.isDownloadable(),myFile.getFolderId(),myFile.getLocation(),myFile.getSize(),myFile.getFileType());
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
	/**
	 * 根据文件夹编号查找所有的文件
	 * @param id
	 * @return
	 */
	public List<MyFile> findFilesById(int id) {
		List<MyFile> fileList = null;
		String sql = "select * from myfile where folderId = ?";

		try {
			fileList = qr.query(sql, new BeanListHandler<MyFile>(MyFile.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileList;
	
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
	/**
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param folderId
	 * @return
	 */
	public Page<MyFile> findPageObject(int pageNum, int pageSize, int folderId) {
		// TODO Auto-generated method stub
		int totals = this.getTotalNum(folderId);//获取总记录数
		Page<MyFile> page = new Page<MyFile>(pageNum, pageSize, totals );
		
		String sql = "select * from myfile where folderId = ? LIMIT ?,?";
		
		try {
			List<MyFile> files = qr.query(sql, new BeanListHandler<MyFile>(MyFile.class),folderId,page.getStartIndex(),pageSize);
		
			page.setData(files);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;	
	}
	private int getTotalNum(int folderId) {
		String sql ="select count(1) from myfile where folderId = ?";
		Object obj =null;
		try{
			//ScalarHandler返回列表中某列的值
			obj = qr.query(sql, new ScalarHandler(),folderId);
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  Integer.parseInt( obj.toString() );
	}

}
