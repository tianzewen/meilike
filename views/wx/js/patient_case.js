$(function (){
	var csrfToken = getCsrf();
	$("input[name='_csrf']").val(csrfToken);
	
	$(".redp").hide();
	$("#bk").hide();
	$("#success").hide();
	
	addPatientCaseForm.action = config('ip') + 'web/index.php?r=patient/addpatient';
})
function checkForm(){
	if($("#PNAME").val() =="" || $("#PNAME").val()==undefined){
		$("html,body").animate({scrollTop:$("#PNAME").offset().top},100)
		$("#PNAMEROW").css('border-color', 'red');
		return false;
	}
	if($("#PAGE").val() =="" || $("#PAGE").val()==undefined){
		$("html,body").animate({scrollTop:$("#PAGE").offset().top},100)
		$("#PAGEROW").css('border-color', 'red');
		return false;
	}
	if($("#PHONE").val() =="" || $("#PHONE").val()==undefined || $("#PHONE").val().length != 11){
		$("html,body").animate({scrollTop:$("#PHONE").offset().top},100)
		$("#PHONEROW").css('border-color', 'red');
		return false;
	}
	if($("#oneCode").val()=="" || $("#oneCode").val()==undefined 
	|| $("#twoCode").val()=="" || $("#twoCode").val()==undefined
	|| $("#threeCode").val()=="" || $("#threeCode").val()==undefined
	|| $("#fourCode").val()=="" || $("#fourCode").val()==undefined
	|| $("#fiveCode").val()=="" || $("#fiveCode").val()==undefined)
	{
		$("html,body").animate({scrollTop:$("#orow").offset().top},100)
		$("#orow").fadeIn();
		return false;
	}
	if($("#sixCode").val()=="" || $("#sixCode").val()==undefined 
	|| $("#sevenCode").val()=="" || $("#sevenCode").val()==undefined
	|| $("#eightCode").val()=="" || $("#eightCode").val()==undefined)
	{
		$("html,body").animate({scrollTop:$("#facerow").offset().top},100)
		$("#facerow").fadeIn();
		return false;
	}
	if($("#nineCode").val()=="" || $("#nineCode").val()==undefined)
	{
		$("html,body").animate({scrollTop:$("#wtrow").offset().top},100)
		$("#wtrow").fadeIn();
		return false;
	}
	if($("#PNUM").val() =="" || $("#PNUM").val()==undefined){
		$("html,body").animate({scrollTop:$("#PNUMROW").offset().top},100)
		$("#PNUMROW").css('border-color', 'red');
		return false;
	}
}
function save(){
	var formData = new FormData(document.getElementById("addPatientCaseForm"));
	$(".textRow").css('border-color', '#F3F3F3');
	$(".redp").hide();
	if(checkForm()){
		return;
	}
	$.ajax({
		type:"post",
		url:config('ip') + "web/index.php?r=patient/addpatient",
		data:formData,
		processData:false,// 告诉jQuery不要去处理发送的数据
		contentType:false,// 告诉jQuery不要去设置Content-Type请求头
		async:true,
		beforeSend:function(){
			$("#addPatientCaseForm").hide();
			$("#bk").show();
		},
		success:function(data){
			var obj = eval ("(" + data + ")");
			if(obj['status']){
				$("#bk").hide();
				$("#success").show();
				alert("注册成功，生成本地cookie");
				window.location.href=config('ip') + "views/wx/patient_case.html";
			} else {
				//删除对象中的元素
				delete obj.status;
				for(var key in obj){
				alert(obj[key]);
				}
			}
		},
		error:function(error){
			alert("提交表单失败");
		}
	});
}