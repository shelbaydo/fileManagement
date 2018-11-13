package entity;

public class Folder {
	private int foldId;
	public int getFoldId() {
		return foldId;
	}
	public void setFoldId(int foldId) {
		this.foldId = foldId;
	}
	private String name;
	private int courseId;
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
	
}
