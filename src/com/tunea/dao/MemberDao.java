package com.tunea.dao;

import com.tunea.model.Member;

public interface MemberDao {
	public Member getMember(String uid);
	public int insert(Member member);
	public int delete(String uid);
	public int update(Member member);
	public int  checkId(String id);
	public int  checkNic(String nicname);
	
}
