<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>视频列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="video/css/videoList.css">
	<link rel="stylesheet" href="css/style.css">
  </head>
  
  <body>
    <div class="content">
    	<div id="nav" >
			 <div class="first">
			 	<a href="" class="logo">
			 		&#xe6fb;
			 	</a>
			 </div>
			 <div class="nav-cen">
				<ul class="nav">
					<li><a href="#" class="work-btn">Work</a><span ></span></li>
					<li><a href="#" class="services-btn">Services</a><span ></span></li>
					<li><a href="#" class="contact-btn">Contact</a><span ></span></li>
				</ul>
			</div>
			 <div class="last">
			 	<a href="index.html" class="">
			 			&#xe63c;
			 	</a>
			 </div>
			</div>
		<div class="top_content">
			<span>Mars Android开发 视频教程</span>
		</div>
		<div class="title">
			<span>Android开发视频教学第一季</span>
		</div>
		<div class="wrap model_1" id="videoData">
			<c:forEach var="vd" items="${requestScope.videoDatas }">
				<div><a href="video/videoplay.html?path=${vd.video_path }">${vd.video_name }<%-- (${vd.play_time }) --%></a></div>
			</c:forEach>
		</div>
	</div>
  </body>
</html>
