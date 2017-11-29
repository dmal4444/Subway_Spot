package com.sub.VO;

import org.springframework.web.multipart.MultipartFile;

public class AdsVO {
	private int no;
	private String title;
	private String body;
	private MultipartFile path;
	private String pw;
	private String saveName;
	private int oriNo;
	private int nowPage;
	
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getOriNo() {
		return oriNo;
	}
	public void setOriNo(int oriNo) {
		this.oriNo = oriNo;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
	public MultipartFile getPath() {
		return path;
	}
	public void setPath(MultipartFile path) {
		this.path = path;
	}

	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	

}
