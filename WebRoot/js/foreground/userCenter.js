var init = {
	initEvent : function(){
		update.updatePwd();
		review.publishReview();
	}	
};

var update = {
	updatePwd : function(){
		$("a[name='confirm']").bind("click", function(){
			var newPwd = $("input[name='newPwd']").val();
			var confirmPwd = $("input[name='confirmPwd']").val();
			var username = $("input[name='username']").val();
			
			if(confirmPwd!=newPwd){
				alert("两次输入的密码不一致!");
				return;
			}
			
			var params = {
				confirmPwd : confirmPwd,
				username : username
			}; 
			
			$.ajax({
				url:"ajaxUserAction_ajaxUpatePwd.action",
				type:"POST",
				data:params,
				success:function(msg){
					if(msg == "success"){
						alert("修改成功!");
					}
				}
			});
		});
	}
};

var review = {
	publishReview : function(){
		$("#review").bind("click", function(){
			if($("textarea[name='content']").val()==""){
				alert("请填写评价内容!");
				return false;
			}
			
			$("form").submit();
		});
	}
};

$().ready(function(){
	init.initEvent();
});
