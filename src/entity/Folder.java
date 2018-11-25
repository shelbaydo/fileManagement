package entity;

public class Folder {
	private int foldId;
	private int userId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getFoldId() {
		return foldId;
	}
	public void setFoldId(int foldId) {
		this.foldId = foldId;
	}
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
