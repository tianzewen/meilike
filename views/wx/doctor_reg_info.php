<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
  <head>
	<title>美立刻医生信息</title>
	<meta http-equiv="Content-Type" content="IE=edge,chrome=1" charset="utf-8" />
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script src="static/wxStyle/js/doctor_register.js"></script>
    <link rel="stylesheet" href="static/wxStyle/css/five.css"/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  </head>
  <body>
	  <h1>医生信息</h1>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_name.png) no-repeat 0 12px" name="PNAME" id="PNAME" type="text" placeholder="${pd.D_NAME}" />
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_age.png) no-repeat 0 12px" name="PAGE" id="PAGE" type="text" placeholder="${pd.D_OUTPATIENT}" />
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_ad.png) no-repeat 0 12px" name="PHONE" id="PHONE" type="text" placeholder="${pd.D_ADDRESS}" />
	  </div>
	  <div class="textRow" style="height:45px;overflow:hidden;">
		<input style="background:url(static/wxStyle/img/c_phone.png) no-repeat 0 12px" name="PHONE" id="PHONE" type="text" placeholder="${pd.D_PHONE}" />
	  </div>
  </body>
</html>