package com.zy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.zy.historyToday.IHistory;
import com.zy.model.HistoryToday;
import com.zy.util.HttpRequestDeviceUtils;

public class HistoryController implements Controller{
	private Logger log=Logger.getLogger(HistoryController.class);
	private IHistory history;
	private ModelAndView mav;
	public IHistory getHistory() {
		return history;
	}
	public void setHistory(IHistory history) {
		this.history = history;
	}
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		log.debug("HistoryController handleRequest is start...");
		boolean flag = HttpRequestDeviceUtils.isMobileDevice(arg0);
		ArrayList<HistoryToday> lists=(ArrayList<HistoryToday>) this.history.queryHistoryToday();
		if(flag){
			log.info("来自手机端的请求");
		}else{
			log.info("来自网页端的请求");
			mav=new ModelAndView();
			mav.addObject("historyDatas",lists);
			mav.setViewName("/history/historyOfToday");
		}
		return mav;
	}
	
}
