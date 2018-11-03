package entity;

import java.util.Date;

public class Question {
	private String content;
	private Date createTime;
	private int askerId;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getAskerId() {
		return askerId;
	}
	public void setAskerId(int askerId) {
		this.askerId = askerId;
	}
	
}
