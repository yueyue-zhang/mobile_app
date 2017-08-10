package com.zy.historyToday;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.zy.model.HistoryToday;

public class HistoryTodayTmpl implements IHistory {
	private Logger log = Logger.getLogger(HistoryTodayTmpl.class);
	private ArrayList<HistoryToday> lists=new ArrayList<HistoryToday>();
	public Object queryHistoryToday() {
		// TODO Auto-generated method stub
		log.debug("HistoryTodayTmpl queryHistoryToday is start...");
		URL u;
		try {
			u = new URL(
					"http://route.showapi.com/119-42?showapi_appid=39990&date=&showapi_sign=f2e725a82b4f4af2ba83ebd9f337db6b");
			InputStream in = u.openStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			try {
				byte buf[] = new byte[1024];
				int read = 0;
				while ((read = in.read(buf)) > 0) {
					out.write(buf, 0, read);
				}
			} finally {
				if (in != null) {
					in.close();
				}
			}
			byte b[] = out.toByteArray();
			String content=new String(b, "utf-8");
			log.info(content);
			//解析content,返回的是json类型的数据
			//1.取到整体的json
			JSONObject dataObject=JSONObject.fromObject(content);
			JSONObject bodyObject=dataObject.getJSONObject("showapi_res_body");
			JSONArray listArray=bodyObject.getJSONArray("list");
			for(int i=0;i<listArray.size();i++){
				JSONObject historyObj=listArray.getJSONObject(i);
				String title=historyObj.getString("title");//事件标题
				String year=historyObj.getString("year");
				String month=historyObj.getString("month");
				String day=historyObj.getString("day");
				//String img=historyObj.getString("img");
				//log.info(img);
				HistoryToday h=new HistoryToday();
				h.setTitle(title);
				h.setYear(year);
				h.setMonth(month);
				h.setDay(day);
				lists.add(h);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lists;
	}

}
