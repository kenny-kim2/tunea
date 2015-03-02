package com.tunea.model;

import java.sql.Date;

public class GroupVideo {
	private String code;
	private String content;
	private int hit;
	private String title;
	private String upload_url;
	private String id;
	private Date w_date;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUpload_url() {
		return upload_url;
	}
	public void setUpload_url(String upload_url) {
		this.upload_url = upload_url;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	
	

}
