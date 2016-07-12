<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
	<title>提交成功</title>
	<meta http-equiv="Content-Type" content="IE=edge,chrome=1" charset="utf-8" />
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script src="static/wxStyle/js/doctor_register.js"></script>
    <link rel="stylesheet" href="static/wxStyle/css/five.css"/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  </head>
  <script type="text/javascript">
  		$(window).unload(function(){
  			window.close();
		});
  </script>
  <body>
  	<img style="width:100%" src="static/wxStyle/img/success.jpg"/>
  </body>
</html>
