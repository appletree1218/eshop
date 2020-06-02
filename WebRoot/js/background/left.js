var init = {
	initEvent:function(){
		$(".STYLE5").each(function(){
			$(this).find("a").bind("click",function(){
				$(".STYLE5").each(function(){
					$(this).parents("table").siblings("table:first").hide();
				});
				
				$(this).parents("tr").last().siblings().attr("height","");
				$(this).parents("tr").last().attr("height","85%");
				$(this).parents("table").siblings("table:first").show();
			});
		});
	},
};

$().ready(function(){
	init.initEvent();
});