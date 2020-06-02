var quit = {
	backLogin : function(){
		$("#quit").bind("click",function(){
			if(window.confirm("确定退出？")){
				$(this).attr("href","forwardAction_quit.action");
			}
		});
	}
};

var init = {
	initEvent : function(){
		quit.backLogin();
	}	
};

$().ready(function(){
	init.initEvent();
});