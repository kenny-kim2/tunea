package com.tunea.dao;

import java.util.List;

import com.tunea.model.GroupVideoRepl;

public interface GroupVideoReplDao {
	public List<GroupVideoRepl> getReplsLittle(String table);
	public List<GroupVideoRepl> getReplsAll(String table);
	
	public int replSize(String table);
	
	public int insert(GroupVideoRepl repl, String table);
	public int update(GroupVideoRepl repl, String table);
	public int delete(String code, String table);
	
	public int report(GroupVideoRepl repl, String userId, String table, String content);
}
