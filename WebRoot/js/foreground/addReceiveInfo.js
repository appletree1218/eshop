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

var init = {
	initEvent : function(){
		check.checkData();
	}
};

$().ready(function(){
	init.initEvent();
});
