package com.zy.video.service;

import org.apache.log4j.Logger;

import com.zy.video.dao.IDao;

public class VideoServiceImpl implements IService{
	private Logger log=Logger.getLogger(VideoServiceImpl.class);
	private IDao dao;
	public IDao getDao() {
		return dao;
	}
	public void setDao(IDao dao) {
		this.dao = dao;
	}
	public Object getVideoInfo() {
		// TODO Auto-generated method stub
		log.debug("VideoServiceImpl getVideoInfo is start...");
		return this.dao.getVideoInfo();
	}

}
