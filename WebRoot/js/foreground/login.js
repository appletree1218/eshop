var login = {
	checkUAndP : function(name,password,role){
		var param = {
			name:name,
			password:password,
			role:role
		};
		
		$.ajax({
			url:"ajaxForeLoginAction_checkForeUAndP.action",
			data:param,
			type:"POST",
			success:function(data){
				if(data==""){
					$("#form").submit();
				}else{
					alert(data);
				}
			}
		});
	},
	checkIsBlank:function(){
		if($("input[name='name']").val()==""){
			alert("用户名不能为空！");
			return false;
		}
		
		if($("input[name='password']").val()==""){
			alert("密码不能为空！");
			return false;
		}
		
		return true;
	}
};

var init = {
	initEvent : function(){
		$("input[type='button']").bind("click",function(){
			if(login.checkIsBlank()){
				var name = $("input[name='name']").val();
				var password = $("input[name='password']").val();
				var role = $("select[name=role]").val();
				login.checkUAndP(name,password,role);
			}
		});
	}
};

$().ready(function(){
	init.initEvent();
});
