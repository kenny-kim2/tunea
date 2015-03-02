package com.tunea.dao;

import java.util.List;

import com.tunea.model.OrchNoticeRepl;

public interface OrchNoticeReplDao {
	public List<OrchNoticeRepl> getReplsLittle(String table);
	public List<OrchNoticeRepl> getReplsAll(String table);
	
	public int replSize(String table);
	
	public int insert(OrchNoticeRepl repl, String table);
	public int update(OrchNoticeRepl repl, String table);
	public int delete(String code, String table);
	
	public int report(OrchNoticeRepl repl, String userId, String table, String content);
}
