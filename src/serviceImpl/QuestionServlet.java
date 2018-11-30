package serviceImpl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import daoImpl.AnswerDao;
import daoImpl.QuestionDao;
import daoImpl.QuestionTagDao;
import daoImpl.UserDao;

import entity.Answer;
import entity.Question;
import entity.QuestionTag;
import entity.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import services.OperationService;

public class QuestionServlet extends HttpServlet implements OperationService{

	
	public Boolean add(Object o) {
		// TODO Auto-generated method stub
		return null;
	}


	public Boolean delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	public Boolean modify(Object o) {
		// TODO Auto-generated method stub
		return null;
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		
		//��request����ת����json����
		JSONObject jo = JsonParse.getParameters(request);
		//����������Ϣ����
		JSONObject returnBack = new JSONObject();
		
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		String type = jo.getString("type");
		//�������������ǩ
		if(type.equals("addQuestion")){
		
		//��ȡ��������
		String name = jo.getString("name");
		String tagString = jo.getString("tag");  //�����л�ȡ��tag�ַ���ĩβ����&
		String tag = tagString.substring(0, tagString.length()-1);
		
		String content = jo.getString("content");
		
		
		int askerId = currentUser.getUserId();
		Date createTimeDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = sdf.format(createTimeDate);
		//����Questionʵ��
		Question question = new Question();
		question.setAskerId(askerId);
		question.setContent(content);
		question.setCreateTime(createTime);
		question.setTagContent(tag);
		question.setTitle(name);
		
		//��������ӵ����ݿ���
		QuestionDao questionDao = new QuestionDao();
		questionDao.addObject(question);

		
		//����ǩ��ӵ����ݿ���
		Dao questionTagDao = new QuestionTagDao();
		int questionId = questionDao.findIdByObject(question);
		//System.out.print(questionId);
		String[] tagContent = tag.split("&");   //���ַ�������&�ָ�����
		for (int i =0 ; i < tagContent.length; i++){
			//����QuestionTagʵ��
			QuestionTag questionTag = new QuestionTag();
			questionTag.setName(tagContent[i]);
			questionTag.setQuestionId(questionId);
			//��questionTag��ӵ����ݿ���
			questionTagDao.addObject(questionTag);
		}
		    returnBack.put("questionId", questionId);
		    returnBack.put("msg", "��ӳɹ���");
		    
		}
		//�������ı�ǩ�Լ����µ�����
		else if(type.equals("findTop")){
			
			JSONArray tagArray = new JSONArray();
			QuestionTagDao questionTagDao = new QuestionTagDao();
			
			List<QuestionTag> questionTagList = null;
			
			questionTagList = questionTagDao.findTopTenTag();//��ȡ���ı�ǩ
			
			//����questionTagList����,������ѯ��������tag����tagArray������
			for(QuestionTag questionTag : questionTagList){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("tag", questionTag.getName());
				tagArray.add(jsonObject);
			}
			returnBack.put("tagArray", tagArray);
			
		}
		//�������Ļش����ݿ���
		else if(type.equals("addAnswer")){
			
			int questionId = jo.getInt("questionId");
			String content = jo.getString("content");
			Date createTimeDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String answerTime = sdf.format(createTimeDate);
			int answerManId = currentUser.getUserId();
			
			Answer answer = new Answer();
			answer.setAnswerManId(answerManId);
			answer.setAnswerTime(answerTime);
			answer.setContent(content);
			answer.setQuestionId(questionId);
			
			AnswerDao answerDao = new AnswerDao();
			answerDao.addObject(answer);
			
			returnBack.put("msg", "�ش���ӳɹ���");
		}
		//�������˸����ӵ�������������һ,���Ҳ��Ҹ�����ľ�����Ϣ,���Ҳ��Ҹ��������ش�
		else if(type.equals("addBrowseNum")){
			String  answerIdString = jo.getString("answerId");
			int questionId = Integer.parseInt(jo.get("questionId").toString());
			
			JSONArray bestAnswerArray = new JSONArray();
			JSONArray otherAnswerArray = new JSONArray();
			JSONArray randomQuestion = new JSONArray();
			List<Answer> answerList = null;
			List<Question> questionList = null;
			
			Question question = new Question();
			QuestionDao questionDao = new QuestionDao();
			AnswerDao answerDao = new AnswerDao();
			User user = new User();
			UserDao userDao = new UserDao();
			
			question = questionDao.findQuestionByQuestionId(questionId);
			//System.out.print(question.getContent());
			user = userDao.findUserById(question.getAskerId());  
			questionDao.addBrowseNum(questionId);
			answerList = answerDao.findAnswerListByQuestionId(questionId);
			
			questionList = questionDao.randomFindQuestion();
			for(Question q : questionList){
				JSONObject queObject = new JSONObject();
				queObject.put("questionTitle", q.getTitle());
				queObject.put("questionId", q.getQuestionId());
				randomQuestion.add(queObject);
			}
			
			//�����������answerId��Ϊ�գ���ת����int���ͣ����Ҹ���answer��isAnswerBrowse������Ϊ1
			if(!answerIdString.equals("")){
				int answerId = Integer.parseInt(answerIdString);
				answerDao.changeIsAskerBrowse(answerId);
				//System.out.print(answerId);
			}
			
			for(Answer answer: answerList){
				JSONObject answerObject = new JSONObject();
				User answerMan = new User();
				
				answerMan = userDao.findUserById(answer.getAnswerManId());//���ݻش���һش��������Ϣ
				if(answerMan.getPhoto() == null){
					answerMan.setPhoto("../defaultProfile/defaultProfile.jpg");
				}
					
				answerObject.put("userName", answerMan.getUsername());
				answerObject.put("userPhoto", answerMan.getPhoto());
				answerObject.put("userTag", answerMan.getSignature());
				answerObject.put("answerContent", answer.getContent());
				answerObject.put("answerTime", answer.getAnswerTime().substring(0, 19));
				answerObject.put("answerId", answer.getAnswerId());
				if(answer.getIsBestAnswer() == true){
					bestAnswerArray.add(answerObject);
				}
				else{
					otherAnswerArray.add(answerObject);
				}
				
			}
			returnBack.put("bestAnswer", bestAnswerArray);
			returnBack.put("otherAnswer", otherAnswerArray);
			returnBack.put("askerName", user.getUsername());
			returnBack.put("tag", question.getTagContent());
			returnBack.put("browseNum", question.getBrowseNum());
			returnBack.put("title", question.getTitle());
			returnBack.put("content", question.getContent());
			returnBack.put("randomQuestion",randomQuestion);
			
		}else if(type.equals("newestAnswer")){  //���һ�û�б����������Ĵ�
			JSONObject questionObject = new JSONObject();
			JSONArray questionArray = new JSONArray();
			int userId = currentUser.getUserId();
			List<Question> questionList = null;
			QuestionDao questionDao = new QuestionDao();
			questionList = questionDao.findQuestionByAskerId(userId);
			for(Question question : questionList){
				List<Answer> answerList = null;
				AnswerDao answerDao = new AnswerDao();
				answerList = answerDao.findAnswerListByQuestionId(question.getQuestionId());
				for(Answer answer : answerList){
					if(answer.getIsAskerBrowse() == false){
						questionObject.put("questionId", question.getQuestionId());
						questionObject.put("questionTitle", question.getTitle());
						questionObject.put("answerId", answer.getAnswerId());
						questionArray.add(questionObject);
					}
				}
			}
			returnBack.put("questionArray",questionArray);
		}else if(type.equals("addBestAnswer")){   //�����ɵĻش����Ϊ����ʵĻش�
			int answerId = jo.getInt("answerId");
			AnswerDao answerDao = new AnswerDao();
			answerDao.bestAnswer(answerId);
			returnBack.put("msg", "�޸ĳɹ�");
		}else if(type.equals("changeQuestion")){
			JSONArray randomQuestion = new JSONArray();
			List<Question> questionList = null;
			QuestionDao questionDao = new QuestionDao();
			questionList = questionDao.randomFindQuestion();
			for(Question q : questionList){
				JSONObject queObject = new JSONObject();
				queObject.put("questionTitle", q.getTitle());
				queObject.put("questionId", q.getQuestionId());
				randomQuestion.add(queObject);
			}
			returnBack.put("randomQuestion",randomQuestion);
			//System.out.print(randomQuestion.toString());
		}else if(type.equals("selectQuestion")){  //��������ؼ��ʲ����������
			String word = jo.getString("word");
			QuestionDao questionDao = new QuestionDao();
			AnswerDao answerDao = new AnswerDao();
			JSONArray questionArray = new JSONArray();
			List<Question> questionList = null;
			questionList = questionDao.selectQuestionByWord(word);
			//����questionList���飬������ѯ�������µ�questionʵ�����questionArray������
			for(Question question : questionList){
				int answerNum;
				JSONArray tagJsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				answerNum = answerDao.findAnswerByQuestionId(question.getQuestionId());//��ȡ������Ļش���Ŀ
				jsonObject.put("answerNum", answerNum);
				jsonObject.put("content", question.getContent());
				jsonObject.put("questionId", question.getQuestionId());
				jsonObject.put("title", question.getTitle());
				jsonObject.put("createTime", question.getCreateTime().substring(0, 19));
				//�����ݿ��д���&��tag�ַ��������ֽ⣬����json������
				String[] tagString = question.getTagContent().split("&");
				for (int i =0; i < tagString.length; i++ ){
					JSONObject tagJsonObject = new JSONObject(); 
					tagJsonObject.put("tag", tagString[i]);
					tagJsonArray.add(tagJsonObject);
				}
				jsonObject.put("tagArray", tagJsonArray);
				
				questionArray.add(jsonObject);
			}
			returnBack.put("questionArray", questionArray);
		}else if(type.equals("page")){  //��ҳ
			String table = jo.getString("table");
			int pageNum = jo.getInt("pageNum");
			
			List<Question> queList = null;
			QuestionDao questionDao = new QuestionDao();
			AnswerDao answerDao = new AnswerDao();
			JSONArray questionArray = new JSONArray();
			List<Question> questionList = null;
            if(table.equals("table1")){
				questionList = questionDao.ObjectByTime();
				queList = questionDao.findObjectByTime(pageNum, 10);
				
			}else if(table.equals("table2")){
				questionList = questionDao.HotestQuestion();
				queList = questionDao.findHotestQuestion(pageNum, 10);
			}else if(table.equals("table3")){
				String word = jo.getString("word");
				questionList = questionDao.selectQuestionByWord(word);
				queList = questionDao.QuestionByWord(word, pageNum, 10);
			}
			
			//����questionList���飬������ѯ�������µ�questionʵ�����questionArray������
			for(Question question : queList){
				int answerNum;
				JSONArray tagJsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				answerNum = answerDao.findAnswerByQuestionId(question.getQuestionId());//��ȡ������Ļش���Ŀ
				jsonObject.put("answerNum", answerNum);
				jsonObject.put("content", question.getContent());
				jsonObject.put("questionId", question.getQuestionId());
				jsonObject.put("title", question.getTitle());
				jsonObject.put("createTime", question.getCreateTime().substring(0, 19));
				//�����ݿ��д���&��tag�ַ��������ֽ⣬����json������
				String[] tagString = question.getTagContent().split("&");
				for (int i =0; i < tagString.length; i++ ){
					JSONObject tagJsonObject = new JSONObject(); 
					tagJsonObject.put("tag", tagString[i]);
					tagJsonArray.add(tagJsonObject);
				}
				jsonObject.put("tagArray", tagJsonArray);
				
				questionArray.add(jsonObject);
			}
			returnBack.put("questionArray", questionArray);
			returnBack.put("total", questionList.size());
			returnBack.put("totalPage",questionList.size()/10+1);
		}
		
		//����json�ַ�����Ϣ
	    //System.out.print(returnBack.toString());
		response.getWriter().print(returnBack.toString());
		
	}

}
