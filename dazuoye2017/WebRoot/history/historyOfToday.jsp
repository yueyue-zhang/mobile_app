<%@page import="com.zy.model.HistoryToday"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ʷ�ϵĽ���</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="history/css/historyOfToday.css">
	<link rel="stylesheet" type="text/css" href="history/css/calendar.css">
	<script type="text/javascript" charset="gbk" src="history/js/main.js"></script>	
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			var myDate=new Date();
			var year=myDate.getFullYear();
			var month=myDate.getMonth()+1;
			var date=myDate.getDate();
			var today="������"+year+"��"+month+"��"+date+"��";
			var todayStr=document.getElementById("today");
			todayStr.innerHTML=today;
		}
	</script>
  </head>
    <body onload=initial();>
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
			<div class="historyTitle">
				<img src="history/images/historyTitle.png" alt="">
			</div>
			<div class="todayDate">
				<span id="today"></span>
			</div>
			<div class="wrapContent" id="wrapContent">
			
			</div>
		<div class="calendar">
				<div id="detail">
	  				<div id="animal_year"></div>
 				</div>
  				<form name="calender_content" style="margin-top: -15px;">
                  <table class="week">
                    <tbody>
                       <tr>
                          <td class="ch">
                                  <!-- ����ͷ�� -->
                                 <table>
                                     <tbody>
                                           <tr class="day">
                                                  <td>��</td>
                                                  <td>һ</td>
                                                  <td>��</td>
                                                  <td>��</td>
                                                  <td>��</td>
                                                  <td>��</td>
                                                  <td>��</td>
                                           </tr>
                                     </tbody>
                                  </table>
                            </td>
                       </tr>
                           
                                    <!-- ͷ��END -->
                       <tr>          
                 <!-- js��̬������д������ -->
                            <script>
                            var Num; //Num���������λ��
                            for(i=0;i<6;i++) {

                                    document.write('<table id="cal-content"><tr>');
                                   
                             for(j=0;j<7;j++) {
                                Num = i*7+j;
                                document.write('<td id="SD' + Num +'" onclick="addDay(' + Num +')" ');
                        //���� ���� ������ʽ�趨
                              if(j == 0|| j == 6)
                              {
                                    document.write(' class="aorange"');
                               }else{
                                    document.write(' class="one"');
                              }
                                    document.write('title=""> </td>')
                             }

                                document.write('</tr></table></td></tr><tr><td><table class="a"><tr style="text-align:center"> ');
                           //ũ��
                           for(j=0;j<7;j++) {
                              Num = i*7+j;
                              document.write('<td id="LD' + Num +'" onclick="addDay(' + Num +')" class="bs" title=""> </td>')

                           }
                              document.write('</tr></table></td></tr>');
                           
                         }
                         </script>  
             <!-- �������� END    -->
                        </tr>
                     </table>
             <table class="footTable">
               <tbody>
                <tr>
                  <td class="sm">
                    <table class="table_head">
                      <tbody>
                      <tr>
                        <td> 
                        <!-- ѡ����ݲ˵� -->
                          <div class="year_select">
                              <span onclick="BtN('year_d')"><img src="history/images/left.png"></span>
                                <select onchange="chaCld()" name="SY">
                                  <script>
                                     for(i=1900;i<2050;i++) 
                                    document.write('<option>'+i+"��")
                                  </script>
                                </select> 
                              <span onclick="BtN('year_a')"><img src="history/images/right.png"></span> 
                          </div>
                          <!-- �ص�����˵� -->
                          <!--<div  class="home_select">
                               <span onclick="BtN('')"><img src="images/2.png" style="width:26px;height:26px"></span>
                          </div>-->

                          <!-- ѡ���·ݲ˵� -->
                              <div class="month_select">
                                  <span onclick="BtN('month_d')"><img src="history/images/left.png"></span>
                                   <select onchange="chaCld()" name="SM">
                                    <script type="text/javascript">
                                    for(i=1;i<13;i++) document.write('<option>'+i+"��")
                                    </script>
                                    </select> 
                                  <span onclick="BtN('month_a')"><img src="history/images/right.png"></span>
                              </div>
                           </td>
                       </tr>
                     </tbody>
                    </table>
                  </td>
                </tr> 
             </tbody>
           </table>
      </form>
   </div>
			</div>
	</div>
	
</body>
</html>
