$(function (){
	var csrfToken = getCsrf();
	$("input[name='_csrf']").val(csrfToken);
	RegisterForm.action = config('ip') + 'web/index.php?r=user/register';
})
//提交用户注册表单
function registerSub(){
	var formData = new FormData(document.getElementById("RegisterForm"));
	//console.log(formData);
	$.ajax({
      type:"post",
	  url:config('ip') + "web/index.php?r=user/register",
	  data:formData,
	  processData:false,// 告诉jQuery不要去处理发送的数据
	  contentType:false,// 告诉jQuery不要去设置Content-Type请求头
	  async:false,
      success:function(data){
		  var obj = eval ("(" + data + ")");
		  if(obj['status']){
			  alert("注册成功，应该跳转到登录界面，but，那页面还没有，所以来提交病例吧");
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