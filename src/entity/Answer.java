package entity;

import java.util.Date;

public class Answer {
	private int answerId;
	public int getAnswerId() {
		return answerId;
	}
	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}
	public int getAnswerManId() {
		return answerManId;
	}
	public void setAnswerManId(int answerManId) {
		this.answerManId = answerManId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(String answerTime) {
		this.answerTime = answerTime;
	}
	
	public Boolean getIsAskerBrowse() {
		return isAskerBrowse;
	}
	public void setIsAskerBrowse(Boolean isAskerBrowse) {
		this.isAskerBrowse = isAskerBrowse;
	}
	Boolean isAskerBrowse;
	Boolean isBestAnswer;
	public Boolean getIsBestAnswer() {
		return isBestAnswer;
	}
	public void setIsBestAnswer(Boolean isBestAnswer) {
		this.isBestAnswer = isBestAnswer;
	}
	private int answerManId;
	private int questionId;
	private String content;
	private String answerTime;
}
