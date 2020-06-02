var init = {
	initEvent : function(){
		$("#update").bind("click",function(){
			$("#form").submit();
		});
		$.fckeditor("description");
	}
};

$().ready(function(){
	init.initEvent();
});