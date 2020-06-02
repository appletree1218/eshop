var table = {
//	clickTr : function(obj){
//		if($(obj).css("color")=="rgb(255, 255, 255)"){
//			$(obj).css({background:"white", color:"#636363"});
//		}else{
//			$(obj).css({background:"#8B0000", color:"white"});
//		}
//	},
	
	clickAdd : function(obj){
		var param = {
			shopId : window.dialogArguments.shopId,
			businessId : obj.id
		};
		
		if(param.shopId!=null && param.shopId!="" && param.businessId!=null && param.businessId!=""){
			$.ajax({
				type:"POST",
				data:param,
				url:"ajaxShopAction_shopAddEmployee.action",
				success:function(msg){
					if(msg=="success"){
						window.close();
					}
				}
			});
		}
	}
};

