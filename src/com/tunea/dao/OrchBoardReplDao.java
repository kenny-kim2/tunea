package com.tunea.dao;

import java.util.List;

import com.tunea.model.OrchBoardRepl;

public interface OrchBoardReplDao {
	public List<OrchBoardRepl> getReplsLittle(String table);
	public List<OrchBoardRepl> getReplsAll(String table);
	
	public int replSize(String table);
	
	public int insert(OrchBoardRepl repl, String table);
	public int update(OrchBoardRepl repl, String table);
	public int delete(String code, String table);
	
	public int report(OrchBoardRepl repl, String userId, String table, String content);
}
