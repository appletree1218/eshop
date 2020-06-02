var init = {
	initEvent : function(){
//		change.changeSelect();
		change.changeProductImg();
	}
};

var change = {
	/**
	 * 暂时不用
	 */
	changeSelect : function(){
		var row = 1,col = 1;
		var src = $("#productImg").attr("src");
		var lastIndex = src.lastIndexOf("/")+1;
		//行
		$("select[name='rowNum']").bind("change", function(){
			row = $(this).val();
			num = row*row+(col-1);
			
			src = src.substring(0,lastIndex)+"forground0"+num+".png";
			$("#productImg").attr("src", src);
		});
		//列
		$("select[name='colNum']").bind("change", function(){
			col = $(this).val();
			num = row*row+(col-1);	
			
			src = src.substring(0,lastIndex)+"forground0"+num+".png";
			$("#productImg").attr("src", src);
		});
	},
	changeProductImg : function(){
		$("button[name='change']").bind("click", function(){
			row = $("select[name='rowNum']").val();
			col = $("select[name='colNum']").val();
			num = row * row + ( col - 1 );
			
			var param = {
				param : num,
				id:$(this).attr("id")
			};
			
			$.ajax({
				type:"POST",
				url:"ajaxShowAction_ajaxChangeProduct.action",
				data:param,
				success:function(msg){
					if(msg=="success"){
						alert("更换成功!");
					} 
				}
			});
		});
	}
};

$().ready(function(){
	init.initEvent();
});
