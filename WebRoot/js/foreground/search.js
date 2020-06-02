var search = {
	shopSearch:function(){
		
	},
	productSearch:function(){
		
	}
};

var check={
	checkIsLogin : function(){
		$("#shopCar").bind("click",function(){
			if($("input[type='hidden']").val()==""){
				alert("请先登陆！");
				return false;
			}else{
				window.location.href = "foreForwardAction_shopCar.action";
				return true;
			}
		});
	}
};

var init={
	initEvent:function(){
		check.checkIsLogin();
		
		$(".aStyle").bind("click",function(){
			$("form").submit();
		});
	}
};

$().ready(function(){
	init.initEvent();
});
