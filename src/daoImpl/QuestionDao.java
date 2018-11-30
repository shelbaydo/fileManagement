package daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.C3P0Utils;

import dao.Dao;
import entity.Course;
import entity.Question;

public class QuestionDao implements Dao {
	private QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource(),true);
	public Boolean addObject(Object o) {
		Question question = (Question)o;
		String title = question.getTitle();
		String content = question.getContent();
		int askerId = question.getAskerId();
		String tagContent = question.getTagContent();
		String createTime = question.getCreateTime();
		
		String sql = "insert into question(content,askerId,createTime,tagContent,title) values(?,?,?,?,?)";
		int row = 0;
		try {
			row = qr.update(sql,content,askerId,createTime,tagContent,title);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		if(row>0){
			return true;
		}else{
			return false;
		}	
	}
    //��������id����������������һ
	public void addBrowseNum(int questionId){
		String sql = "update question set browseNum=browseNum+1 where questionId=?";
		try{
			qr.update(sql,questionId);
		}catch(SQLException e){
			e.printStackTrace();
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
	//�����ȡ6������
	public List<Question> randomFindQuestion(){
		String sql = "SELECT * FROM question ORDER BY RAND() LIMIT 6 ";
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class));
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
	}
    //�����������������10������
	public List<Question> findHotestQuestion(int pageNum,int pageSize){
		String sql = "SELECT * FROM question  ORDER BY  browseNum  DESC limit ?,?";
		int pageIndex = pageNum * pageSize ;
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class),pageIndex,pageSize);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
	}
	//���������������������
	public List<Question> HotestQuestion(){
		String sql = "SELECT * FROM question  ORDER BY  browseNum  DESC";
		
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class));
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
	}
	public Object findObjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	//ͨ������ʵ���������id
    public int findIdByObject(Object o){
    	Object questionId = null;
    	Question question = (Question)o;
    	String content = question.getContent();
    	String title = question.getTitle();
    	int askerId = question.getAskerId();
    	String tagContent = question.getTagContent();
    	String createTime = question.getCreateTime();
    	String sql = "select questionId from question where content=? and askerId=? and createTime=? and tagContent=? and title=?";
    	try{
    		 questionId = qr.query(sql, new ScalarHandler(),content,askerId,createTime,tagContent,title);
    		 
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	
    	return Integer.parseInt(questionId.toString());
    }
    //������������˵�id���������Ѱ����
    public List<Question> findQuestionByAskerId(int askerId){
    	List<Question> questionList = null;
    	String sql = "select * from question where askerId=?";
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class),askerId);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
    }
    //�������·���ʱ�佫��������ҳ���
    public List<Question> ObjectByTime(){
    	
    	String sql = "SELECT * FROM question  ORDER BY  createTime  DESC ";
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class));
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
    }
  //�������·���ʱ�佫�����10�������ҳ���
    public List<Question> findObjectByTime(int pageNum,int pageSize){
    	int pageIndex = pageNum * pageSize ;
    	String sql = "SELECT * FROM question  ORDER BY  createTime  DESC limit ?,?";
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class),pageIndex,pageSize);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
    }
    //��������������к�������ַ��������⼯
    public List<Question> selectQuestionByWord(String word){
    	String sql = "SELECT * FROM question WHERE LOCATE(?,question.content,1)>0 ";
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class),word);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
    }
  //��������������к�������ַ�����10�����⼯
    public List<Question> QuestionByWord(String word,int pageNum,int pageSize){
    	int pageIndex = pageNum * pageSize ;
    	String sql = "SELECT * FROM question WHERE LOCATE(?,question.content,1)>0 limit ?,?";
    	List<Question> questionList = null;
    	try{
    		questionList = qr.query(sql, new BeanListHandler<Question>(Question.class),word,pageIndex,pageSize);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return questionList;
    }
    //ͨ������id���Ҹ�����ľ��������Ϣ
    public Question findQuestionByQuestionId(int questionId){
    	Question question = new Question();
    	String sql = "select * from question where questionId=?";
    	try{
    		question = qr.query(sql, new BeanHandler<Question>(Question.class),questionId);
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	return question;
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
