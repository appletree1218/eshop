var init = {
	initEvent : function(){
		skip.skipPage();
	}
};

var skip = {
	skipPage : function(){
		var key = $("#hid").val();
		
		$("#jump").bind("change",function(){
			var num = $(this).val();
			window.location.href="userAction_getUserByFuzzy?pageNum="+num+"&key="+key;
		});
	}
};

$().ready(function() {
	init.initEvent();
});