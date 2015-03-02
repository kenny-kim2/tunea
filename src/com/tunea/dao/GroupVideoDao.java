package com.tunea.dao;

import java.util.List;

import com.tunea.model.GroupVideo;

public interface GroupVideoDao {
	public List<GroupVideo> GroupVideo(String area);

	public List<GroupVideo> GroupVideo();

	public GroupVideo getgroupvideo(String code);

	public int insert(GroupVideo gv);

	public int update(GroupVideo gv);

	public int delete(GroupVideo gv);
}
