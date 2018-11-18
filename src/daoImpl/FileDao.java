package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.MyFile;
import entity.Note;

public class FileDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	/**
	 * ���ݴ���Ķ��󴴽�һ��ʵ��������ݿ�
	 * ����ΪҪ����Ķ���
	 * ����ɹ������棬���򷵻ؼ�
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
	 * �����ļ��б�Ų������е��ļ�
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

}
