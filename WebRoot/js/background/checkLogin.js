var init = {
	initEvent : function(){
		$("#login").bind("click", function(){
			if(check.checkIsBlank()){
				var name = $("input[name='name']").val();
				var password = $("input[name='password']").val();
				var verifyCode = $("input[name='verifyCode']").val();
				
				check.checkUAndP(name,password,verifyCode);
			}
		});
		
		$("#reset").bind("click", function(){
			reset.resetLogin();
		});
		
		$("#verifyCode").bind("click", function(){
			$(this).attr("src","randomAction?timestamp="+new Date().getTime());
		});
	}
};

var check = {
	checkIsBlank : function(){
		if($("input[name='name']").val()==""){
			alert("用户名不能为空！");
			return false;
		}
		
		if($("input[name='password']").val()==""){
			alert("密码不能为空！");
			return false;
		}
		
		if($("input[name='verifyCode']").val()==""){
			alert("验证码不能为空！");
			return false;
		}
		
		return true;
	},
	checkUAndP:function(name,password,verifyCode){
		var param={
			name:name,
			password:password,
			verifyCode: verifyCode
		};
		
		$.ajax({
			url:"ajaxAction_checkUAndP.action",
			type:"POST",
			data:param,
			success:function(data){
				if(data==""){
					$("#form").submit();
				}else{
					alert(data);
				}
			}
		});
	}
};

var reset = {
	resetLogin : function(){
		$("input[name='name']").val("");
		$("input[name='password']").val("");
		$("input[name='verifyCode']").val("");
	}
};

$().ready(function(){
	init.initEvent();
});