<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
	<title>病例详情</title>
	<meta http-equiv="Content-Type" content="IE=edge,chrome=1" charset="utf-8" />
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script src="static/wxStyle/js/doctor_register.js"></script>
    <link rel="stylesheet" href="static/wxStyle/css/five.css"/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  </head>
  <body>
  <%
  		Map<String, String> map=new HashMap<String,String>();
  		map = (Map<String, String>)request.getAttribute("map");
  %>
			<div class="background" onclick="$('.background').hide()">
				<div class="imageDiv">
				<span><img id="win_img" style="max-width:100%;max-height:100%;"/></span>
				</div>
			</div>
	  <h1>病例详情</h1>
	  <div class="textRow" style="height:45px;overflow:hidden;">
	  <c:if test="${pd.PSTATUS==1}">
	  	<input style="background:url(static/wxStyle/img/c_status.png) no-repeat 0 12px" readonly name="PSTATUS" type="text" placeholder="已提交" />
	  </c:if>
	  <c:if test="${pd.PSTATUS==2}">
	  	<input style="background:url(static/wxStyle/img/c_status.png) no-repeat 0 12px" readonly name="PSTATUS" type="text" placeholder="设计中" />
	  </c:if>
	  <c:if test="${pd.PSTATUS==3}">
	  	<input style="background:url(static/wxStyle/img/c_status.png) no-repeat 0 12px" readonly name="PSTATUS" type="text" placeholder="已设计" />
	  </c:if>
	  <c:if test="${pd.PSTATUS==4}">
	  	<input style="background:url(static/wxStyle/img/c_status.png) no-repeat 0 12px" readonly name="PSTATUS" type="text" placeholder="已驳回" />
	  </c:if>
		<span>病例状态</span>
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_name.png) no-repeat 0 12px" readonly name="PNAME" id="PNAME" type="text" placeholder="${pd.PNAME}" />
		<span>患者姓名</span>
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_age.png) no-repeat 0 12px" readonly name="PAGE" id="PAGE" type="text" placeholder="${pd.PAGE}" />
		<span>患者年龄</span>
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_phone.png) no-repeat 0 12px" readonly name="PHONE" type="text" placeholder="${pd.PHONE}" />
		<span>患者电话</span>
	  </div>
	  <div class="textRow" style="border:none;height:45px;overflow:hidden;">
	  <c:if test="${pd.PSEX==1}">
	  	<input style="background:url(static/wxStyle/img/c_sex.png) no-repeat 0 12px;" readonly name="PSEX" id="PSEX" type="text" placeholder="男" />
	  </c:if>
		 <c:if test="${pd.PSEX==2}">
	  	<input style="background:url(static/wxStyle/img/c_sex.png) no-repeat 0 12px;" readonly name="PSEX" id="PSEX" type="text" placeholder="女" />
	  </c:if>
		<span>患者性别</span>
	  </div>
	  <div class="textRow imgRow">
		<h2>患者情况照片</h2>
		<h3>口内像：</h3>
		<div class="textRow imgDiv">
			<div class="imgText">
				<img id="one_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl1") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl1") %>"/>
				<p>正面咬合</p>
			</div>
			<div class="imgText">
				<img id="two_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl2") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl2") %>"/>
				<p>左侧咬合</p>
			</div>
			<div class="imgText">
				<img id="three_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl3") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl3") %>"/>
				<p>右侧咬合</p>
			</div>
			<div class="imgText">
				<img id="four_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl4") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl4") %>"/>
				<p>上牙列</p>
			</div>
			<div class="imgText">
				<img id="five_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl5") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl5") %>"/>
				<p>下牙列</p>
			</div>
		</div>
	  </div>
	  <div class="textRow imgRow" style="border-top:none;">
		<h3>面像：</h3>
		<div class="textRow imgDiv">
			<div class="imgText">
				<img id="six_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl6") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl6") %>"/>
				<p>正面微笑</p>
			</div>
			<div class="imgText">
				<img id="seven_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl7") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl7") %>"/>
				<p>左侧位</p>
			</div>
			<div class="imgText">
				<img id="eight_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl8") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl8") %>"/>
				<p>右侧位</p>
			</div>
		</div>
	  </div>
	  <div class="textRow imgRow" style="border-top:none;">
		<h3>委托加工单照片：</h3>
		<div class="textRow imgDiv">
			<div class="imgText"  style="width:23%">
				<img id="nine_img" onclick="show_Win('static/wxStyle/uploadImgs/<%=map.get("purl9") %>')" src="static/wxStyle/uploadImgs/<%=map.get("purl9") %>"/>
				<p>委托加工单</p>
			</div>
		</div>
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input name="PNUM" type="text" readonly placeholder="${pd.PNUM}" />
		<span style="padding-left:5%;">委托加工单编号</span>
	  </div>
	  <div class="textRow imgRow" style="border-top:none;">
		<textarea placeholder="备注说明" readonly name="PBASE" id="PBASE">备注说明：${pd.PBASE}</textarea>
	  </div>
	  <c:if test="${pd.PSTATUS==3}">
	   <div class="textRow imgRow" style="border-top:none;">
		<h3>美立刻医生正畸方案：</h3>
		<div class="textRow imgDiv" style="height:0;padding-bottom:19%;">
			<img style="float:left;width:19%;"  src="static/wxStyle/img/fileimg.png"/>
			<div style="float:left;margin-left:20px;height:0;padding-bottom:19%;">
				<h4 style="font-weight:200;">矫治设计方案</h4>
				<h4 style="font-weight:200;color:#888888">（20K）</h4>
			</div>
			<a type="text" readonly style="position:relative;top:15px;left:20px;color:white;background-color:#22c35c;width:53px;margin-top:30px;padding:10px;border-radius:5px;" onclick='javascript:window.location.href="<%=basePath%>login_dload?pid=${pd.PATIENTINFO_ID}"'>查看</a>
		</div>
	  </div>
	  <div class="textRow imgRow" style="border-top:none;">
		<textarea placeholder="医生说明" readonly name="DBASE" id="DBASE">医生说明：${pd.DBASE}</textarea>
	  </div>
	  </c:if>
  </body>
</html>