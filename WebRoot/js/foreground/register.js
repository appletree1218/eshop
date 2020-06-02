var user = {
	checkUser : function(){
		$("#userButton").bind("click", function(){
			if($("#username").val()==""){
				alert("用户名不能为空！");
			}else{
				if($("#userpassword").val()==""){
					alert("密码不能为空！");
				}else{
					$("#form_user").submit();
				}
			}
		});
	}
};

var business = {
	checkBusiness : function(){
		$("#businessButton").bind("click", function(){
			if($("#businessname").val()==""){
				alert("商家名不能为空！");
			}else{
				if($("#businesspassword").val()==""){
					alert("密码不能为空！");
				}else{
					$("#form_business").submit();
				}
			}
		});
	}
};

var init = {
	initEvent : function(){
		business.checkBusiness();
		user.checkUser();
	}
};

$().ready(function(){
	init.initEvent();
});
