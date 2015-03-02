package com.tunea.dao;

import java.sql.Date;
import java.util.List;

import com.tunea.model.Member;
import com.tunea.model.Message;

public interface MessageDao {
	
	public Message getMessage(String code);
	public List<Message> getMessages(String uid, int page, Date dateStart, Date dateEnd);
	public List<Message> getMessages(String uid, int page);
	public int insert(Message message);
	public int delete(String uid);

	
}
