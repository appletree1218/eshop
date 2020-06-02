var init = {
	initEvent : function(){
		validate.validateForm();
		add.addEvent();
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
				$(this).parent().next().children().text("");
				
				$.ajax({
					url:"ajaxUserAction_checkIsExit.action",
					data:{
						name:encodeURI($(this).val())
					},
					success:function(data){
						if(data!=null){
							$("#nameMessage").css("color","blue");
						}
	
						$("#nameMessage").text(data);
					}
				});
			}
		});
		
		$("input[name='password']").bind("blur",function(){
			if($(this).val()==""){
				$(this).parent().next().children().css("color","red");
				$(this).parent().next().children().text("密码不能为空！");
			}else{
				$(this).parent().next().children().text("");
			}
		});
		
		$("input[name='identityId']").bind("blur",function(){
			if($(this).val()!=""){
				
			}
		});
	}
};

var add = {
	addEvent : function(){
		$("#add").bind("click",function(){
			var index = 0;
			
			$("label").each(function(){
				if( $(this).text()!="" ){
					index++;
				}
			});
			
			if($("input[name='name']").val()==""){
				alert("用户名不能为空！");
				return false;
			}else{
				if($("input[name='password']").val()==""){
					alert("密码不能为空！");
					return false;
				}else{
					if( index > 0 ){
						alert("请检查所填信息！");
						
						return false;				
					}else{
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