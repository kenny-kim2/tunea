package com.tunea.model;

import java.util.Date;

public class Notice {
	private String code;
	private String Id;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getregDate() {
		return regDate;
	}
	public void setregDate(Date regDate) {
		regDate = regDate;
	}

}
