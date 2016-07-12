<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
	<meta http-equiv="Content-Type" content="IE=edge,chrome=1" charset="utf-8" />
    <link rel="stylesheet" href="static/wxStyle/css/five.css"/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>美立刻病例信息</title>
  </head>
  <body>
 <h1>病例列表</h1>
  <c:choose>
		    <c:when test="${not empty varList}">
		    	<c:forEach items="${varList}" var="var" varStatus="vs">
			  <div class="submitted" style='background:url(static/wxStyle/img/register11.png) no-repeat 0 50%;background-position:right;' onclick="javascript:window.location.href='<%=basePath%>login_caseDetails?pid=${var.PATIENTINFO_ID}'">
				<p><span style="color:black;">患者编号：</span>${var.PNUM}</p><p style="width:30%;color:black;">状态</p>
				<p><span style="color:black;">患者姓名：</span>${var.PNAME}</p>
				<p style="width:30%;">
					<c:if test="${var.PSTATUS==1}">已提交</c:if>
					<c:if test="${var.PSTATUS==2}">设计中...</c:if>
					<c:if test="${var.PSTATUS==3}">已设计</c:if>
					<c:if test="${var.PSTATUS==4}">已驳回</c:if>
				</p>
				<p style="width:100%"><span style="color:black;">提交时间：</span><span class="time">${var.TJDATE}</span></p>
			  </div>
	 		   </c:forEach>
	  		</c:when>
	  </c:choose>
  </body>
</html>