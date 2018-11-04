package entity;

public class QuestionTag {
	private int QuestionTagId;
	public int getQuestionTagId() {
		return QuestionTagId;
	}
	public void setQuestionTagId(int questionTagId) {
		QuestionTagId = questionTagId;
	}
	private String name;
	private int refNum;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRefNum() {
		return refNum;
	}
	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}
	
}
