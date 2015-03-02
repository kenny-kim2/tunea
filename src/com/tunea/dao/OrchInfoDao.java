package com.tunea.dao;

import java.util.List;

import com.tunea.model.OrchInfo;

public interface OrchInfoDao {
	public List<OrchInfo> getOrch(String area);

	public List<OrchInfo> getOrch();

	public OrchInfo getOrchDetail(String code);

	public int insert(OrchInfo orch);

	public int update(OrchInfo orch);

	public int delete(OrchInfo orch);

	public int delegate(String oldId, String newId);
}
