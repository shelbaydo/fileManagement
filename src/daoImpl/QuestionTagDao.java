package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.QuestionTag;

public class QuestionTagDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	public Boolean addObject(Object o) {
		QuestionTag questionTag = (QuestionTag)o;
		String name = questionTag.getName();
		int questionId = questionTag.getQuestionId();
		
		String sql = "insert into questionTag(name,QuestionId) values(?,?)";
		
		int row = 0;
		try{
			row = qr.update(sql,name,questionId);
		}catch(SQLException e){
			e.printStackTrace();
		}
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
    //查询标签名字出现次数最多的前10个标签
	public List<QuestionTag> findTopTenTag(){
		
		List<QuestionTag> topTenTag = null;
		String sql = "select name from questiontag group by name order by count(*) desc limit 10";
		try{
			topTenTag = qr.query(sql, new BeanListHandler<QuestionTag>(QuestionTag.class));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return topTenTag;
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
