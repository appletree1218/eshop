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
			var param = {
				name:encodeURI($(this).val())
			};
			
			$.ajax({
				url:"ajaxTypeAction_checkIsExit.action",
				data:param,
				success:function(data){
					if(data!=null){
						$("#nameMessage").css("color","blue");
					}
					
					$("#nameMessage").text(data);
				}
			});
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
				alert("产品类型名不能为空！");
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
		});
	}
};

$().ready(function(){
	init.initEvent();
});