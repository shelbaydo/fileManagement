package entity;

import java.util.Date;

public class MyFile {
	private int FileId;
	public int getFileId() {
		return FileId;
	}
	public void setFileId(int fileId) {
		FileId = fileId;
	}
	private String fileName;
	private boolean isDownloadable;
	private Date uploadTime;
	private int folderId;
	private float size;
	private String location;
	private String fileType;
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isDownloadable() {
		return isDownloadable;
	}
	public void setDownloadable(boolean isDownloadable) {
		this.isDownloadable = isDownloadable;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public int getFolderId() {
		return folderId;
	}
	public void setFolderId(int folderId) {
		this.folderId = folderId;
	}
	public float getSize() {
		return size;
	}
	public void setSize(float size) {
		this.size = size;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
