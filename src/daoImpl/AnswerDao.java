package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Answer;

public class AnswerDao implements Dao{
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	public Boolean addObject(Object o) {
		Answer answer = (Answer)o;
		int questionId = answer.getQuestionId();
		String content = answer.getContent();
		String answerTime = answer.getAnswerTime();
		int answerManId = answer.getAnswerManId();
		
		String sql = "insert into answer(questionId,content,answerTime,answerManId) values(?,?,?,?)";
		int row = 0;
		try{
			qr.update(sql,questionId,content,answerTime,answerManId);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
    //根据问题id查找有几个回答
	public int findAnswerByQuestionId(int questionId){
		List<Answer> answerList = null;
		String sql = "select * from answer where questionId=?";
		try{
			answerList = qr.query(sql, new BeanListHandler<Answer>(Answer.class),questionId);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return answerList.size();
	}
	public List<Answer> findAnswerListByQuestionId(int questionId){
		List<Answer> answerList = null;
		String sql = "select * from answer where questionId=?";
		try{
			answerList = qr.query(sql, new BeanListHandler<Answer>(Answer.class),questionId);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return answerList;
	}
	
	public Boolean deleteObjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	//根据answerId将该answer的isAskerBrowse参数变为1
    public void changeIsAskerBrowse(int answerId){
    	String sql = "UPDATE answer SET isAskerBrowse=1 WHERE answerId = ?";
    	try{
    		qr.update(sql,answerId);
    	}catch(SQLException e){
			e.printStackTrace();
		}
    }
	public List<Object> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
    //根据回答的id将该回答设置为最合适的回答
	public void bestAnswer(int answerId){
		String sql = "UPDATE answer SET isBestAnswer=1 WHERE answerId = ?";
		try{
    		qr.update(sql,answerId);
    	}catch(SQLException e){
			e.printStackTrace();
		}
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
