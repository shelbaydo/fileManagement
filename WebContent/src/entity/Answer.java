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
	public Date getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}
	private int answerManId;
	private int questionId;
	private String content;
	private Date answerTime;
}
