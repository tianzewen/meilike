$(function (){
	var csrfToken = getCsrf();
	$("input[name='_csrf']").val(csrfToken);
	UserLoginForm.action = config('ip') + 'web/index.php?r=user/login';
})
//提交用户注册表单
function loginSub(){
	var formData = new FormData(document.getElementById("UserLoginForm"));
	//console.log(formData);
	$.ajax({
      type:"post",
	  url:config('ip') + "web/index.php?r=user/login",
	  data:formData,
	  processData:false,// 告诉jQuery不要去处理发送的数据
	  contentType:false,// 告诉jQuery不要去设置Content-Type请求头
	  async:false,
      success:function(data){
		  var obj = eval ("(" + data + ")");
		  if(obj['status']){
			  setCookie(obj.user);
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