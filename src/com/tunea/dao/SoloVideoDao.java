package com.tunea.dao;

import java.util.List;

import com.tunea.model.SoloVideo;

public interface SoloVideoDao {
	public List<SoloVideo> SoloVideo(String area);

	public List<SoloVideo> SoloVideo();

	public SoloVideo getsolovideo(String code);

	public int insert(SoloVideo sv);

	public int update(SoloVideo sv);

	public int delete(SoloVideo sv);

}
