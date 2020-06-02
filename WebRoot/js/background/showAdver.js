var init = {
	initEvent : function(){
		change.changeSelect();
	}
};

var change = {
	changeSelect : function(){
		$("select").bind("change", function(){
			var src = $("#adverImg").attr("src");
			var lastIndex = src.lastIndexOf("/")+1;
			src = src.substring(0,lastIndex)+"adver0"+$(this).val()+".png";
			$("#adverImg").attr("src",src);
		});
	}
};

$().ready(function(){
	init.initEvent();
});
