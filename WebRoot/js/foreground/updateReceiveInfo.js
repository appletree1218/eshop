var check = {
	checkData : function(){
		$("#saveInfo").bind("click", function(){
			if($("input[name='receiveName']").val()==""){
				alert("收货人不能为空!");
				return false;
			}
			
			if($("select[name='province']").val()=="省份"){
				alert("请选择所属地区的省份!");
				return false;
			}
			
			if($("select[name='city']").val()=="地级市"){
				alert("请选择所属地区的地级市!");
				return false;
			}
			
			if($("select[name='county']").val()=="市、县级市"){
				alert("请选择所属地区的市、县级市!");
				return false;
			}
			
			if($("input[name='address']").val()==""){
				alert("详细地址不能为空!");
				return false;
			}
			
			if($("input[name='phone']").val()==""){
				alert("手机号不能为空!");
				return false;
			}
			
			$("input[name='username']").val(window.dialogArguments.username);
			$("form").submit();
			window.returnValue = "ok";
			window.close();
		});
	}
};

var detailInfo = {
	setDefault : function(){
		var province = $("input[name='province']").val();
		var city = $("input[name='city']").val();
		var country = $("input[name='country']").val();
		
		$("select[name='province']").find("option").each(function(){
			if($(this).val()==province){
				$(this).attr("selected","selected");
				change(1);
			}
		});
		
		$("select[name='city']").find("option").each(function(){
			if($(this).val()==city){
				$(this).attr("selected","selected");
				change(2);
			}
		});
		
		$("select[name='country']").find("option").each(function(){
			if($(this).val()==country){
				$(this).attr("selected","selected");
			}
		});
	}
};

var init = {
	initEvent : function(){
		detailInfo.setDefault();
		check.checkData();
	}
};

$().ready(function(){
	_init_area();
	init.initEvent();
});
