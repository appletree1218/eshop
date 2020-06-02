var init = {
	initEvent : function(){
		$("button").bind("click",function(){
			$("#form").submit();
		});
		
		$.fckeditor("description");
	}
};

var validate = {
	validateForm : function(){
		$("input[name='name']").bind("blur",function(){
			if($(this).val()==""){
				$(this).parent().next().children().css("color","red");
				$(this).parent().next().children().text("用户名不能为空！");
			}else{
				
				var param = {
					name:$(this).val()
				};
				
				$(this).parent().next().children().text("");
				
				$.ajax({
					url:"ajaxUserAction_checkIsExit.action",
					data:param,
					success:function(data){
						if(data!=null){
							$("#nameMessage").css("color","blue");
							$("#nameMessage").text(data);
						}
					}
				});
			}
		});
		
		$("input[name='identityId']").bind("blur",function(){
			if($(this).val()!=""){
				
			}
		});
	}
};

var update = {
	updateEvent: function(){
		$("#update").bind("click", function(){
			if ($("input[name='name']").val() == "") {
				alert("用户名不能为空！");
				return false;
			}
			else {
				if ($("input[name='password']").val() == "") {
					alert("密码不能为空！");
					return false;
				}
				else {
					var index = 0;
					
					$("label").each(function(){
						if ($(this).val() != "") {
							index++;
						}
					});
					
					if (index > 0) {
						return false;
					}
					else {
						$("#form").submit();
						return true;
					}
				}
			}
		});
	}
};

$().ready(function(){
	init.initEvent();
});