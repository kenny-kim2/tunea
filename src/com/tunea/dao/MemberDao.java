package com.tunea.dao;

import java.util.List;

import com.tunea.model.Member;

public interface MemberDao {
	public Member getMember(String uid);
	public int insert(Member member);
	public int delete(String uid);
	public int update(Member member);
	public List<Member>  getMembers();
	
	
}
