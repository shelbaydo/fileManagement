package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.Note;
import entity.User;

public class NoteDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);

	public Boolean addObject(Object o) {
		Note note = (Note)o;
		String sql = "insert into note(title,content,isPublic,courseId) values(?,?,?,?)";
		int row = 0;
		try {
			row = qr .update(sql,note.getTitle(),note.getContent(),note.isPublic(),note.getCourseId());
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
	/**
	 * 根据课程号查找所有的笔记
	 * @param id
	 * @return
	 */
	public List<Note> findNotesById(int id) {
		List<Note> noteList = null;
		String sql = "select * from Note where courseId = ?";

		try {
			noteList = qr.query(sql, new BeanListHandler<Note>(Note.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noteList;
	
	}
	
	public List<Object> findObjectsById(int id) {
		return null;
	
	}

	public Boolean modifyObject(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

}
