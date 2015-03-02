package com.tunea.dao;

import java.util.List;

import com.tunea.model.SoloVideoRepl;

public interface SoloVideoReplDao {
	public List<SoloVideoRepl> getReplsLittle(String table);
	public List<SoloVideoRepl> getReplsAll(String table);
	
	public int replSize(String table);
	
	public int insert(SoloVideoRepl repl, String table);
	public int update(SoloVideoRepl repl, String table);
	public int delete(String code, String table);
	
	public int report(SoloVideoRepl repl, String userId, String table, String content);
}
