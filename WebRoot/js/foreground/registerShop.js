var shop = {
	checkShop : function(){
		$("#shopButton").bind("click", function(){
			if($("input[name='name']").val()==""){
				alert("店铺名不能为空！");
			}else{
				if($("input[name='address']").val()==""){
					alert("地址不能为空！");
				}else{
					$("form").submit();
				}
			}
		});
	},
	showImage : function(){
		$("input[name='uploadImage']").each(function(){
			$(this).bind("change", function(){
				$(this).siblings("img").attr("src",window.URL.createObjectURL(this.files[0]));
			});
		});
	}
};

var init = {
	initEvent : function(){
		init.registerDate();
		shop.checkShop();
		shop.showImage();
	},
	registerDate : function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		$("input[name='regTime']").val(year+"-"+month+"-"+day);
	}
};

$().ready(function(){
	init.initEvent();
});
