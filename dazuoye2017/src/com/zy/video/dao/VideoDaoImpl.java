package com.zy.video.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.zy.model.TVideoList;

public class VideoDaoImpl implements IDao{
	private Logger log=Logger.getLogger(VideoDaoImpl.class);
	private SqlSessionTemplate sqlSessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public Object getVideoInfo() {
		// TODO Auto-generated method stub
		log.debug("VideoDaoImpl getVideoInfo is start...");
		List<TVideoList> lists=sqlSessionTemplate.selectList("videodao.queryVideoAll");
		log.info("lists:"+lists.size());
		return lists;
	}

}
