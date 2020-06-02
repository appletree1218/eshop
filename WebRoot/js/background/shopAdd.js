var init = {
	initEvent : function(){
		validate.validateForm();
		add.addEvent();
		
		$("input[name='regTime']").bind("click",function(){
			return showCalendar('regTime', 'y-mm-dd');
		});
		
		$.fckeditor("description");
	},
};

var validate = {
	validateForm : function(){
		$("input[name='name']").bind("blur",function(){
			var param = {
				name:encodeURI($(this).val())
			};
			
			if($(this).val()==""){
				$("#nameMessage").css("color","red");
				$("#nameMessage").text("店铺名不能为空！");
			}else{
				$("#nameMessage").text("");
				
				$.ajax({
					url:"ajaxShopAction_checkIsExit.action",
					data:param,
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
			if($(this).val()==""){
				
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
				alert("店铺名不能为空！");
				return false;
			}else if($("select[name='statusId']").val()==""){
				alert("请选择状态！");
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