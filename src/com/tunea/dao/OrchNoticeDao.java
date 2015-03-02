package com.tunea.dao;

import java.util.List;

import com.tunea.model.OrchNotice;



public interface OrchNoticeDao {
	public List<OrchNotice> getorchn(String area);

	public List<OrchNotice> getOrchn();

	public OrchNotice getOrchDetail(String code);

	public int insert(OrchNotice orchn);

	public int update(OrchNotice orchn);

	public int delete(OrchNotice orchn);

}
