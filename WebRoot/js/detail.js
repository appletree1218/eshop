var init = {
	initEvent : function(){
		check.checkIsLogin();
		slide.slideChangeImg();
		amount.changeAmount();
		shopCar.addShopCar();
		
		
		$(".aStyle").bind("click",function(){
			$("form").submit();
		});
	}
};

var slide = {
	slideChangeImg : function(){
		$(".detailImg li").each(function(){
			$(this).hover(
				function(){
					$(this).css({border: "solid 2px #8b0000"});
					var oldSrc = $("#bigImg").attr("src");
					var src = oldSrc.substring(0,oldSrc.lastIndexOf("/")+1);
					src = src + $(this).attr("id");
					$("#bigImg").attr("src", src);
				},
				function(){
					$(this).css({border: "0px"});
				}
			);
		});
	}
};

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

var amount = {
	changeAmount : function(){
		var params = {
			repertory : $("#repertory").text()
		};
		
		$("#increase").bind("click", function(){
			if(parseInt($("#amountText").val()) >= parseInt(params.repertory)){
				$("#amountText").val(params.repertory);
			}else{
				$("#amountText").val( parseInt($("#amountText").val())+1);
			}
		});
		
		$("#decrease").bind("click", function(){
			if($("#amountText").val()==1){
				$("#amountText").val(1);
			}else{
				$("#amountText").val(parseInt($("#amountText").val())-1);
			}
		});
		
		$("#amountText").bind("blur", function(){
			if( isNaN(params.repertory) ){
				return;
			}
			
			if( parseInt($(this).val()) > parseInt(params.repertory)){
				$(this).val(params.repertory);
			}
		});
	}
};

var shopCar = {
	addShopCar : function(){
		$("#addShopCar").bind("click", function(){
			var province = $("#province").val();		
			var city = $("#city").val();		
			var country = $("#country").val();		
			
			if( province=="省份" || city=="地级市"){
				alert("请选择配送地址!");
				return ;
			}
			
			var role = $("input[name='role']").val();
			if(role!="买家"){
				alert("请切换为买家进行添加!");
				return ;
			}
			
			var params = {
				productId : $("input[name='productId']").val(),
				username : $("input[name='username']").val(),
				amount : $("#amountText").val()
			};
			
			$.ajax({
				type:"POST",
				url:"ajaxShopCarAction_addShopCar.action",
				data:params,
				success:function(msg){
					if(msg=="success"){
						alert("添加成功!");
					}else{
						alert("添加失败!");
					}
				}
			});
		});
	}
};

$().ready(function(){
	init.initEvent();
});
