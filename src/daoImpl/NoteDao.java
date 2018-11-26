package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.Note;
import entity.Page;
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
		String sql = "insert into note(title,content,isPublic,courseId,userId) values(?,?,?,?,?)";
		int row = 0;
		try {
			row = qr .update(sql,note.getTitle(),note.getContent(),note.isPublic(),note.getCourseId(),note.getUserId());
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
	/**
	 * 获取一页的数据对象，参数是页号，和每页对象数目
	 * @param pageNum
	 * @param pageSize
	 * @return 返回一个页对象
	 */
	public Page<Note> findPageObject(int pageNum, int pageSize, int userId) {
			int totals = this.getTotalNum(userId);//获取总记录数
			Page<Note> page = new Page<Note>(pageNum, pageSize, totals );
			
			String sql = "select * from note where userId = ? LIMIT ?,?";
			
			try {
				List<Note> notes = qr.query(sql, new BeanListHandler<Note>(Note.class),userId,page.getStartIndex(),pageSize);
			
				page.setData(notes);//把查询结构封装到页面对象的data属性接收
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return page;	
	}
	/**
	 * 
	 *根据userId 获取数据库中对象总数
	 *@param userId
	 * @return
	 */
	public int getTotalNum(int userId) {
		
		String sql ="select count(1) from note where userId = ?";
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
	/**
	 * 
	 *根据userId和courseScope 获取数据库中对象总数
	 *@param userId courseScope
	 * @return 数据库记录总数
	 */
	public int getTotalNumInCourseScope(int userId,String courseScope) {
		
		String sql ="select count(1) from note where userId = ? and courseId in(select courseId from course where name=? and userId = ?)";
		Object obj =null;
		try{
			//ScalarHandler返回列表中某列的值
			obj = qr.query(sql, new ScalarHandler(),userId,courseScope,userId);
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  Integer.parseInt( obj.toString() );
	}
	/**
	 * 根据userId,课程名,页面大小和页面编号找寻一个页面对象
	 * @param pageNum
	 * @param pageSize
	 * @param courseScope
	 * @return返回一个页面对象
	 */
	public Page<Note> findPageObjectInCourseScope(int pageNum, int pageSize,
			int userId, String courseScope) {
		
		int totals = this.getTotalNumInCourseScope(userId,courseScope);//获取总记录数
		Page<Note> page = new Page<Note>(pageNum, pageSize, totals );
		
		String sql = "select * from note where userId = ? and courseId in(select courseId from course where name=? and userId = ?) LIMIT ?,?";
		
		try {
			List<Note> notes = qr.query(sql, new BeanListHandler<Note>(Note.class),userId,courseScope,userId,page.getStartIndex(),pageSize);
		
			page.setData(notes);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;	
	}
/**
 * 根据userId,课程名,,是否公开,页面大小和页面编号找寻一个页面对象
 * @param pageNum
 * @param pageSize
 * @param userId
 * @param courseScope
 * @param isPublic
 * @return
 */
	public Page<Note> findPageObjectInCourseScopeByVisibility(int pageNum,
			int pageSize, int userId, String courseScope, boolean isPublic) {
		

		int totals = this.getTotalNumInCourseScopeByVisibility(userId,courseScope,isPublic);//获取总记录数
		Page<Note> page = new Page<Note>(pageNum, pageSize, totals );
		
		String sql = "select * from note where userId = ? and isPublic = ? and courseId in(select courseId from course where name=? and userId = ?) LIMIT ?,?";
		
		try {
			List<Note> notes = qr.query(sql, new BeanListHandler<Note>(Note.class),userId,isPublic,courseScope,userId,page.getStartIndex(),pageSize);
		
			page.setData(notes);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;	
	}
	/**
	 * 根据userId和courseScope 获取数据库中对象总数
	 * @param userId
	 * @param courseScope
	 * @param isPublic
	 * @return
	 */
public int getTotalNumInCourseScopeByVisibility(int userId,
		String courseScope, boolean isPublic) {
	String sql ="select count(1) from note where userId = ? and isPublic = ? and courseId in(select courseId from course where name=? and userId = ?)";
	Object obj =null;
	try{
		//ScalarHandler返回列表中某列的值
		obj = qr.query(sql, new ScalarHandler(),userId,isPublic,courseScope,userId);
	}catch(SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return  Integer.parseInt( obj.toString() );
}

/**
 * 根据userId,是否公开，页面大小和页面编号找寻一个页面对象
 * @param pageNum
 * @param pageSize
 * @param userId
 * @param isPublic
 * @return
 */
	public Page<Note> findPageObjectByVisibility(int pageNum, int pageSize,
			int userId, boolean isPublic) {
		int totals = this.getTotalNumByVisibility(userId,isPublic);//获取总记录数
		
		Page<Note> page = new Page<Note>(pageNum, pageSize, totals );
		
		String sql = "select * from note where userId = ? and isPublic = ? LIMIT ?,?";
		
		try {
			List<Note> notes = qr.query(sql, new BeanListHandler<Note>(Note.class),userId,isPublic,page.getStartIndex(),pageSize);
		
			page.setData(notes);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;	
		
	}
	/**
	 * 根据userId和courseScope 获取数据库中对象总数
	 * @param userId
	 * @param courseScope
	 * @param isPublic
	 * @return
	 */
private int getTotalNumByVisibility(int userId, boolean isPublic) {
		String sql ="select count(1) from note where userId = ? and isPublic = ?";
		Object obj =null;
		try{
			//ScalarHandler返回列表中某列的值
			obj = qr.query(sql, new ScalarHandler(),userId,isPublic);
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  Integer.parseInt( obj.toString() );
	}

	public Page<Note> findPageObjectWithTitle(int pageNum, int pageSize, String noteTitle,int userId) {
		
		int totals = this.getTotalNumWithTitle(userId,noteTitle);//获取总记录数
		System.out.println(totals);
		Page<Note> page = new Page<Note>(pageNum, pageSize, totals );
		
		String sql = "select * from note where userId = ? and title = ? LIMIT ?,?";
		String t = "'%"+noteTitle+"%'";
		try {
			List<Note> notes = qr.query(sql, new BeanListHandler<Note>(Note.class),userId,noteTitle,page.getStartIndex(),pageSize);
		
			page.setData(notes);//把查询结构封装到页面对象的data属性接收
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;	
	}

	private int getTotalNumWithTitle(int userId, String noteTitle) {
		
		String sql ="select count(1) from note where userId = ? and title = ?";
		String t = "'%"+noteTitle+"%'";
		Object obj =null;
		try{
			//ScalarHandler返回列表中某列的值
			obj = qr.query(sql, new ScalarHandler(),userId,noteTitle);
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  Integer.parseInt( obj.toString() );
	}

	public Note findNoteByTitleAId(String noteTitle, int courseId) {
		String sql = "select * from note where title = ? and courseId = ?";
		List<Note> noteList = null;
		try {
			noteList = qr.query(sql, new BeanListHandler<Note>(Note.class),noteTitle,courseId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noteList.get(0);
	}
}
