package entity;

public class QuestionTag {
	private int QuestionTagId;
	private int QuestionId;
	public int getQuestionId() {
		return QuestionId;
	}
	public void setQuestionId(int questionId) {
		QuestionId = questionId;
	}
	public int getQuestionTagId() {
		return QuestionTagId;
	}
	public void setQuestionTagId(int questionTagId) {
		QuestionTagId = questionTagId;
	}
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
