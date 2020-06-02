var init = {
	initEvent : function(){
		amount.changeAmount();
		del.deleteProduct();
		
		checkbox.allcheck();
		checkbox.checkIsChecked();
	}
};

var amount = {
	changeAmount : function(){
		var params = {
			repertory : $("#repertory").text()
		};
		
		var username = $("input[name='username']").val();
		
		$("button[name='increase']").each(function(){
			$(this).bind("click", function(){
				var amount = $(this).siblings("input[name='amountText']");
				
				if(parseInt(amount.val()) >= parseInt(params.repertory)){
					amount.val(params.repertory);
				}else{
					amount.val( parseInt(amount.val())+1);
				}
				
				var productId = $(this).siblings("input[name='amountText']").attr("id");
				var scId = $(this).siblings("input[name='scId']").val();
				
				var param = {
					amount : amount.val(),
					productId : productId,
					username : username,
					scId : scId
				};
				
				$.ajax({
					data:param,
					url:"ajaxShopCarAction_ajaxUpdateAmount.action",
					type:"POST",
					success:function(msg){
						if(msg == "success"){
							location.reload(true);
						}
					}
				});
			});
		});
		
		$("button[name='decrease']").each(function(){
			$(this).bind("click", function(){
				var amount = $(this).siblings("input[name='amountText']");
				
				if(amount.val()==1){
					amount.val(params.repertory);
				}else{
					amount.val(parseInt(amount.val())-1);
				}
				
				var productId = $(this).siblings("input[name='amountText']").attr("id");
				var scId = $(this).siblings("input[name='scId']").val();
				
				var param = {
					amount : amount.val(),
					productId : productId,
					username : username,
					scId : scId
				};
				
				$.ajax({
					data:param,
					url:"ajaxShopCarAction_ajaxUpdateAmount.action",
					type:"POST",
					success:function(msg){
						if(msg == "success"){
							location.reload(true);
						}
					}
				});
			});
		});
	}
};

var checkbox = {
	allcheck : function(){
		$("#allcheck").bind("click", function(){
			
			if($(this).attr("checked")=="checked"){
				$("input[name='check']").attr("checked","checked");
			}else{
				$("input[name='check']").attr("checked",false);
			}
		});
	},
	checkIsChecked : function(){
		$("button[name='pay']").bind("click", function(){
			var scId = "";

			if($("input[name='check']:checked").size()<=0){
				alert("请选择要结算的商品!");
				return false;
			}else{
				$("input[name='check']:checked").each(function(){
					if(scId!=""){
						scId += ",";
					}
					
					scId += $(this).parent().siblings().find("input[name='scId']").val();
				});
				
				var username = $("input[name='username']").val();
				username = encodeURIComponent(encodeURIComponent(username));
				
				$(this).parent("a:first").prop("href", "foreForwardAction_pay.action?scId="+scId+"&username="+username);
			}
		});
	}
};

var del = {
	deleteProduct : function(){
		$("a[name='del']").each(function(){
			$(this).bind("click", function(){
				var params = {
					username:$("input[name='username']").val(),
					productId:$(this).attr("id")
				};
				
				$.ajax({
					url:"ajaxShopCarAction_ajaxDeleteShopCar.action",
					type:"POST",
					data:params,
					success:function(msg){
						if(msg=="success"){
							window.location.reload(true);
						}
					}
				});
			});
		});
	}
};

$().ready(function(){
	init.initEvent();
});
