package com.tunea.dao;

import java.util.List;

import com.tunea.model.Concert;
import com.tunea.model.GroupVideo;
import com.tunea.model.Notice;
import com.tunea.model.OrchInfo;

public interface MainDao {
	public List<GroupVideo> getMainVideos();
	
	public Concert getMainConcert();
	public List<Concert> getMainConcerts();
	
	public OrchInfo getMainOrchInfo();
	
	public List<Notice> getNewNotices();
	public List<Notice> getPupNotices();	
}
