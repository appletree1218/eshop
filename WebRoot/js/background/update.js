var init = {
	initeEvent : function(){
		$("#form_password").bind("blur",function(){
			if($(this).val()==""){
				$("#pwd").css("color","red");
				$("#pwd").text("不能为空！");
			}else{
				$("#pwd").text("");
				update.checkPassword($("input[name='name']").val(),$(this).val());
			}
		});
		
		$("button").bind("click",function(){
			if( $("#submitPassowrd").text()==""&& $("#pwd").text()==""){
				var index = 0;
				
				$("input[type='password']").each(function(){
					if($(this).val()==""){
						alert( $(this).attr("id")+"不能为空！");
						index++;
					}
				});
				
				if(index==0){
					$("#form").submit();
				}
			}else{
				alert("请检查填写信息!");
			}
		});
		
		$("input[name='submitPassowrd']").bind("blur",function(){
			if( $(this).val()!=$("input[name='newPassowrd']").val() ){
				$("#submitPassowrd").css("color","red");
				$("#submitPassowrd").text("两次输入密码不一致！");
			}else{
				$("#submitPassowrd").text("");
			}
		});
	}
};

var update = {
	checkPassword : function(name,password){
		var param = {
			name:name,
			password:password	
		};
		
		$.ajax({
			url:"ajaxManagerAction_checkPassword.action",
			data:param,
			success:function(data){
				$("#pwd").css("color","red");
				$("#pwd").text(data);
			}
		});
	}
};

$().ready(function(){
	init.initeEvent();
});
