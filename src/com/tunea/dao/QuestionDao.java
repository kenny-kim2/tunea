package com.tunea.dao;

import java.util.List;

import com.tunea.model.Notice;

public interface QuestionDao {
	public Notice getNotice(String code);
	public List<Notice> getNotices(int page, String query, String field);
	public List<Notice> getNotices(int page, String query);
	public List<Notice> getNotices(int page);
	public int insert(Notice notice);
	public int update(Notice notice);
	public int delete(String code);
	public int getSize(String query, String field);
	public int getSize(String query);
	public String lastCode();
	public Notice preNotice(String curCode);
	public Notice nextNotice(String curCode);
}
