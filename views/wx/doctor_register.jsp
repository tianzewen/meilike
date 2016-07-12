<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
  <head>
	<meta http-equiv="Content-Type" content="IE=edge,chrome=1" charset="utf-8" />
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script src="static/wxStyle/js/doctor_register.js"></script>
    <link rel="stylesheet" href="static/wxStyle/css/doctor_register.css"/>
    <title>美立刻医生注册</title>
  </head>
  <body>
  <div class="titleImg">
    <img style="height:78px;width:auto;" src="static/wxStyle/img/register0.png"/>
  </div>
  <form name="registerForm" id="registerForm" action="login_save" method="post">
	  <input type="hidden" name="DOCTORINFO_ID" id="DOCTORINFO_ID" value="${pd.DOCTORINFO_ID}"/>
	  <input type="hidden" name="D_OPENID" id="D_OPENID" value="${pd.D_OPENID}"/>
	  <div class="textRow" style="background:url(static/wxStyle/img/register1.png) no-repeat">
		<input type="text" maxlength="12" name="D_NAME" id="D_NAME" value="${pd.D_NAME}" placeholder="医生姓名"/>
	  </div>
	  <div class="textRow" style="background:url(static/wxStyle/img/register2.png) no-repeat">
		<input type="text" maxlength="64" name="D_OUTPATIENT" id="D_OUTPATIENT" value="${pd.D_OUTPATIENT}" placeholder="门诊名称"/>
	  </div>
	  <div class="textRow" style="background:url(static/wxStyle/img/register3.png) no-repeat">
		<select name="s1" onChange="redirec(document.registerForm.s1.options.selectedIndex)" class="txt-select fl" id="s1">
			<option selected>所在省份</option>
			<option value="北京">北京</option>
			<option value="上海">上海</option>
			<option value="天津">天津</option>
			<option value="广东">广东</option>
			<option value="辽宁">辽宁</option>
			<option value="河北">河北</option>
			<option value="浙江">浙江</option>
		</select>
		<select name="s2" class="txt-select fl" id="s2" onChange="changc()">
			<option value="所在城市" selected>所在城市</option>
		</select>
	  </div>
	  <div class="textRow" style="background:url(static/wxStyle/img/register5.png) no-repeat">
		<input type="text" name="D_ADDRESS" id="D_ADDRESS" value="${pd.D_ADDRESS}" placeholder="详细地址"/>
	  </div>
	  <div class="textRow" style="background:url(static/wxStyle/img/register6.png) no-repeat">
		<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="11"  onafterpaste="this.value=this.value.replace(/\D/g,'')" name="D_PHONE" id="D_PHONE" style="width:340px;" placeholder="联系电话"/>
		<input type="text" id="chnum" name="chnum" hidden="hidden"/>
		<div class="numberBtn" onclick="checkPhone()">发送验证码</div>
	  </div>
	  <div class="textRow" style="background:url(static/wxStyle/img/register7.png) no-repeat">
		<input type="text" maxlength="6" style="width:340px;" id="ckhnum" name="ckhnum" placeholder="验证码"/><span class="num" style="color:red;font-size:30px;marin-left:40px;"> 验证码错误</span>
	  </div>
	  <div class="submitBtn" onclick="save()">提交</div>
  </form>
	<script>
	//验证码提交验证
	function checkPhone(){
		var phone = document.getElementById("D_PHONE").value;
		$("#D_PHONE").css('border-color', 'black');
		if( phone.length!=11 ){
			$("html,body").animate({scrollTop:$("#D_PHONE").offset().top},100)
			$("#D_PHONE").css('border-color', 'red');
			return false;
		}
		$.ajax({
			url: "login_checkPhone",
			type: "post",
			dataType: "text",
			data: "phone="+phone,
			success: function(data) {
				var textId=$("#chnum");
				textId.val(data);
				$(".numberBtn").removeAttr('onclick');
				$(".numberBtn").css('backgroundColor', 'gray');
				$(".numberBtn").css('borderColor', 'gray');
				myInterval(60);
			},
			error: function(data) {
				//alert(data);
			}
		});
	}
    function myInterval(time)
    {
    	if(time<1){
    		$(".numberBtn").html("发送验证码");
    		$(".numberBtn").click(function () {checkPhone()});
    		return ;
    	}
		$(".numberBtn").html(time + "秒后重发");
    	time--;
    	setTimeout( "myInterval(" + time + ")", 1000 );
    }
	function checkForm(){
		if($("#D_NAME").val() =="" || $("#D_NAME").val()==undefined){
			$("html,body").animate({scrollTop:$("#D_NAME").offset().top},100)
			$("#D_NAME").css('border-color', 'red');
			return false;
		}
		if($("#D_OUTPATIENT").val() =="" || $("#D_OUTPATIENT").val()==undefined){
			$("html,body").animate({scrollTop:$("#D_OUTPATIENT").offset().top},100)
			$("#D_OUTPATIENT").css('border-color', 'red');
			return false;
		}
		if($("#s1").val() =="所在省份"){
			$("html,body").animate({scrollTop:$("#s1").offset().top},100)
			$("#s1").css('border-color', 'red');
			return false;
		}
		if($("#ckhnum").val() !=$("#chnum").val()){
			alert("验证码不正确！");
			return false;
		}
		if($("#s2").val() =="所在城市"){
			$("html,body").animate({scrollTop:$("#s2").offset().top},100)
			$("#s2").css('border-color', 'red');
			return false;
		}
		if($("#D_ADDRESS").val() =="" || $("#D_ADDRESS").val()==undefined){
			$("html,body").animate({scrollTop:$("#D_ADDRESS").offset().top},100)
			$("#D_ADDRESS").css('border-color', 'red');
			return false;
		}
		if($("#D_PHONE").val() =="" || $("#D_PHONE").val()==undefined || $("#D_PHONE").val().length != 11){
			$("html,body").animate({scrollTop:$("#D_PHONE").offset().top},100)
			$("#D_PHONE").css('border-color', 'red');
			return false;
		}
		if($("#ckhnum").val() != $("#chnum").val()){
			$("html,body").animate({scrollTop:$("#ckhnum").offset().top},100)
			$("#ckhnum").css('border-color', 'red');
			$(".num").show();
			return false;
		}
		return true;
	}
	$(".num").hide();
	//保存
	function save(){
		$("select").css('border-color', 'black');
		$("input").css('border-color', 'black');
		$(".num").hide();
		document.getElementById('D_ADDRESS').value="";
		var s1=document.getElementById('s1').value;
		var s2=document.getElementById('s2').value;
		var ad=document.getElementById('D_ADDRESS').value;
		document.getElementById('D_ADDRESS').value=s1+s2+ad;
		if(!checkForm()){
			return;
		}
		document.getElementById('registerForm').submit();
	}
	</script>
  </body>
</html>