package entity;

import java.util.Date;

public class Course {
	private int userId;
	private int noteNum;
	private int ffolderNum;
	private int folderNum;
	private String name;
	private Date createTime;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
	public int getFfolderNum() {
		return ffolderNum;
	}
	public void setFfolderNum(int ffolderNum) {
		this.ffolderNum = ffolderNum;
	}
	public int getFolderNum() {
		return folderNum;
	}
	public void setFolderNum(int folderNum) {
		this.folderNum = folderNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
