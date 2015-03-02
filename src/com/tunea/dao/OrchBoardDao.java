package com.tunea.dao;

import java.util.List;

import com.tunea.model.OrchBoard;



public interface OrchBoardDao {
	public List<OrchBoard> getorchb(String area);

	public List<OrchBoard> getOrchb();

	public OrchBoard getOrchbDetail(String code);

	public int insert(OrchBoard orchb);

	public int update(OrchBoard orchb);

	public int delete(OrchBoard orchb);

}
