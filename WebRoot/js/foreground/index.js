var check={
	checkIsLogin : function(){
		$("#shopCar").bind("click",function(){
			if($("input[type='hidden']").val()==""){
				alert("请先登陆！");
				return false;
			}
		});
	}
};

var search = {
	shopSearch:function(){
		
	},
	productSearch:function(){
		
	}
};

var catalogue = {
	hideOrShowChild : function(){
		$(".parentLi a").bind("click", function(){
			$(this).css({cursor:"pointer"});
			var childLi = $(this).parent().next(":first").children(":first");
			if(childLi.css("display")=="none"){
				childLi.css({display:"block"});
			}else {
				childLi.css({display:"none"});
			}
				
		});
	}
};

var init = {
	initEvent : function(){
		check.checkIsLogin();
		
		catalogue.hideOrShowChild();
		
		$(".aStyle").bind("click",function(){
			$("form").submit();
		});
	}
};

$().ready(function(){
	init.initEvent();
});
