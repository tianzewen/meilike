window.onload = function(){ 
	//获取一级菜单长度
	select1_len = document.registerForm.s1.options.length;
	select2 = new Array(select1_len);
	//把一级菜单都设为数组
	for (i=0; i<select1_len; i++)
	{ 
		select2[i] = new Array();
	}
	//定义基本选项
	select2[0][0] = new Option("所在城市", " ");

	//北京
	select2[1][0] = new Option("东城区", "东城区");
	select2[1][1] = new Option("西城区", "西城区");
	select2[1][2] = new Option("朝阳区", "朝阳区");
	select2[1][3] = new Option("海淀区", "海淀区");
	select2[1][4] = new Option("崇文区", "崇文区");
	select2[1][5] = new Option("宣武区", "宣武区");
	select2[1][6] = new Option("丰台区", "丰台区");
	select2[1][7] = new Option("石景山区", "石景山区");
	select2[1][8] = new Option("门头沟区", "门头沟区");
	select2[1][9] = new Option("通州区", "通州区");
	select2[1][10] = new Option("顺义区", "顺义区");
	select2[1][11] = new Option("昌平区", "昌平区");
	select2[1][12] = new Option("大兴区", "大兴区");
	select2[1][13] = new Option("怀柔区", "怀柔区");
	select2[1][14] = new Option("平谷区", "平谷区");

	//上海
	select2[2][0] = new Option("黄浦区", "黄浦区");
	select2[2][1] = new Option("卢湾区", "卢湾区");
	select2[2][2] = new Option("徐汇区", "徐汇区");
	select2[2][3] = new Option("长宁区", "长宁区");
	select2[2][4] = new Option("静安区", "静安区");
	select2[2][5] = new Option("普陀区", "普陀区");

	//天津
	select2[3][0] = new Option("和平区", "和平区");
	select2[3][1] = new Option("河东区", "河东区");
	select2[3][2] = new Option("河西区", "河西区");
	select2[3][3] = new Option("南开区", "南开区");
	select2[3][4] = new Option("河北区", "河北区");
	select2[3][5] = new Option("红桥区", "红桥区 ");
	select2[3][6] = new Option("滨海新区", "滨海新区");
	select2[3][7] = new Option("东丽区", "东丽区");
	select2[3][8] = new Option("西青区", "西青区");

	//广东
	select2[4][0] = new Option("广州市", "广州市");
	select2[4][1] = new Option("深圳市", "深圳市");
	select2[4][2] = new Option("东莞市", "东莞市");

	//辽宁
	select2[5][0] = new Option("沈阳市", "沈阳市");
	select2[5][1] = new Option("大连市", "大连市");

	//河北
	select2[6][0] = new Option("石家庄市", "石家庄市");
	select2[6][1] = new Option("保定市", "保定市");

	//浙江
	select2[7][0] = new Option("杭州市", "杭州市");
	select2[7][1] = new Option("温州市", "温州市");
}

//联动函数
function redirec(x){
	delAllItems( document.registerForm.s2);
	var temp = document.registerForm.s2;
	for (i=0;i<select2[x].length;i++)
	{ 
			temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);
	}
	temp.options[0].selected=true;
	$("#p1").val($("#s1").find("option:selected").text());
	$("#p2").val($("#s2").find("option:selected").text());
}

function changc(){
	$("#p1").val($("#s1").find("option:selected").text());
	$("#p2").val($("#s2").find("option:selected").text());
}

function delAllItems(child){
 for(var i=child.options.length-1; i>=0; i--)
 {
   child.options[i] = null;
  }
}

//选择图片后验证
function setImagePreview(inputid, imgid) {
  var docObj = document.getElementById(inputid);
  var imgObjPreview=document.getElementById(imgid);
  if(docObj.files &&docObj.files[0]){
    //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
    //imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	var file = docObj.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = function(e){
		//imgObjPreview.src = this.result;
		var img = new Image();
		img.src = this.result;
		img.onload = function(){
			var canvas = document.getElementById("canvas");
			if(img.width > 800){
				img.height *= 800/img.width;
				img.width = 800;
			} else if(img.height > 600){
				img.width *= 600/img.height;
				img.height = 600;
			}
			var ctx = canvas.getContext("2d");
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			canvas.width = img.width;
			canvas.height = img.height;
			ctx.drawImage(img, 0, 0, img.width, img.height);
			//imgObjPreview.src = canvas.toDataURL();
			docObj.outerHTML = docObj.outerHTML;
			document.getElementById(inputid + "Code").value = canvas.toDataURL();
			imgObjPreview.src = canvas.toDataURL();//window.URL.createObjectURL(docObj.files[0]);
		};
	}
  }
}

function show_Win(path){
	$('.background').show();
	//$('.background').height( $(document.body).outerHeight(true) + 'px');
	$("#win_img").attr("src", path);
}
function checkSubmitMobil(number) {
	if (!number.match(/^(((13[0-9]{1})|159|153|151)+\d{8})$/)) {
		return false; 
	} 
	return true; 
} 