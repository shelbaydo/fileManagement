package entity;

import java.util.Date;

public class CommentReply {
	private int commentReplyId;
	public int getCommentReplyId() {
		return commentReplyId;
	}
	public void setCommentReplyId(int commentReplyId) {
		this.commentReplyId = commentReplyId;
	}
	private String content;
	private int noteId;
	private int commentId;
	private Date replyTime;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	
}
