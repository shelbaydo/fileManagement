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
/**
 * 根据传入的对象创建一个实体存入数据库
 * 参数为要插入的对象
 * 插入成功返回真，否则返回假
 */
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
/**
 * 根据笔记编号查找笔记对象
 * 参数是笔记编号
 * 返回一个笔记对象
 */
	public Object findObjectById(int id) {
		List<Note> noteList = null;
		String sql = "select * from Note where NoteId = ?";
		try {
			noteList = qr.query(sql, new BeanListHandler<Note>(Note.class),id);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noteList.get(0);	
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
	/**
	 * 查找数据库中最新的四个笔记
	 * @param userId 参数为用户ID
	 * @return返回最新四个笔记的集合
	 */
	public List<Note> find4LatestNotes(int userId) {
		List<Note> noteList = null;
		String sql = "select * from note where courseId in (select courseId from course where userId=?) order by createTime desc limit 4";
		try {
			noteList = qr.query(sql, new BeanListHandler<Note>(Note.class),userId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noteList;
	}
	/**
	 * 通过笔记ID寻找课程名
	 * @param noteId
	 * @return
	 */
	public String findCourseNameOfNote(int noteId) {
		List<Course> courseList = null;
		String sql = "select * from course where courseId in (select courseId from note where noteId=?) order by createTime desc limit 4";
		try {
			courseList = qr.query(sql, new BeanListHandler<Course>(Course.class),noteId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String courseName = courseList.get(0).getName(); 
		return  courseName;
	}
}
