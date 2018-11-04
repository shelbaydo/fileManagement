package entity;

public class Ffolder {
	private int ffolderId;
	public int getFfolderId() {
		return ffolderId;
	}
	public void setFfolderId(int ffolderId) {
		this.ffolderId = ffolderId;
	}
	private String name;
	private int courseId;
	private int favoriteNum;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getFavoriteNum() {
		return favoriteNum;
	}
	public void setFavoriteNum(int favoriteNum) {
		this.favoriteNum = favoriteNum;
	}
	
}
