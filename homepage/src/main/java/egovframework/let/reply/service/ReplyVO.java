package egovframework.let.reply.service;

import java.util.Date;

public class ReplyVO {

	private String replyId;
	private String replyCn;
	private java.util.Date replyDate;
	private String replyBoardId;
	private String replyEmplyrId;

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getReplyCn() {
		return replyCn;
	}

	public void setReplyCn(String replyCn) {
		this.replyCn = replyCn;
	}

	public java.util.Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(java.util.Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyBoardId() {
		return replyBoardId;
	}

	public void setReplyBoardId(String replyBoardId) {
		this.replyBoardId = replyBoardId;
	}

	public String getReplyEmplyrId() {
		return replyEmplyrId;
	}

	public void setReplyEmplyrId(String replyEmplyrId) {
		this.replyEmplyrId = replyEmplyrId;
	}

}
