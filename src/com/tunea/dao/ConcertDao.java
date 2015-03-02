package com.tunea.dao;

import java.sql.Date;
import java.util.List;

import com.tunea.model.Concert;

public interface ConcertDao {
	
	public Concert getConcert(String code);
	public List<Concert> getConcert(int page, String query, String field, Date fromDate, Date toDate);
	public List<Concert> getConcert(int page, String query, String field);
	public List<Concert> getConcert(int page, String query);
	public List<Concert> getConcert(int page);
	
	public int insert(Concert concert);
	/*public int insertImg(Images images);*/
	public int delete(String code);
	public int update(Concert concert);
	
	public int getSize(String query,String field);
	public int getSize(String query);

}
