var init = {
	initEvent : function(){
		$("button").bind("click",function(){
			$("#form").submit();
		});
		$("input[name='regTime']").bind("click",function(){
			return showCalendar('regTime', 'y-mm-dd');
		});
		
		$.fckeditor("description");
	}
};

$().ready(function(){
	init.initEvent();
});