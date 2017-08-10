package com.zy.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.zy.model.TVideoList;
import com.zy.util.HttpRequestDeviceUtils;
import com.zy.video.service.IService;

public class VideoController implements Controller{
	private Logger log=Logger.getLogger(VideoController.class);
	private IService service;
	public IService getService() {
		return service;
	}
	public void setService(IService service) {
		this.service = service;
	}
	private ModelAndView mav;
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		log.debug("VideoController handleRequest is start...");
		boolean flag = HttpRequestDeviceUtils.isMobileDevice(arg0);
		ArrayList<TVideoList> lists=(ArrayList<TVideoList>) this.service.getVideoInfo();
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		
		if(flag){
			log.info("来自手机端的请求");
			JSONObject object=new JSONObject();
			object.put("lists", lists);
			log.info(object.toString());
			pw.print(object);
			pw.flush();
			if(pw!=null){
				pw.close();
			}
		}else{
			mav=new ModelAndView();
			mav.addObject("videoDatas",lists);
			mav.setViewName("/video/videoList");
		}
		return mav;
	}

}
