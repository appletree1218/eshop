var shop={
	judgeShopStatus : function(){
		$("a[name='shopManage']").each(function(){
			$(this).bind("click",function(){
				var status = $("#status").val();
				
				if(status==2 || status==3){
					alert("店铺"+$("#statusName").val()+",暂不能使用!");
					
					return false;
				}
			});
		});
	},
	
	addRegTime: function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		$("input[name='regTime']").val(year + "-" + month + "-" + day);
	},
	
	deleteShopEmployee : function(){
		$("#shopEmployee").find("a").bind("click", function(){
			var param = {
				id : $(this).attr("id")
			};
			
			$.ajax({
				type:"POST",
				url:"ajaxBusinessAction_deleteShopEmployee.action",
				data:param,
				success:function(msg){
					if(msg=="success"){
						alert("删除成功!");
						location.reload(true);
					}
				}
			});
		});
	},
	
	addShopEmployee : function(){
		var param = {
			shopId : $("input[type='hidden']").val()
		};
		
		$("a[name='add']").bind("click", function(){
			if(window.showModalDialog("foreForwardAction_queryAndAdd.action",param,"dialogWidth=750px;dialogHeight=450px;dialogLeft=350px;dialogTop=120px;resizable=no") == 'ok'){
				location.reload(true);
			}
		});
	},
	
	orderDetail : function(){
		$("a[name='orderNumber']").bind("click", function(){
			var number = $(this).text();
			window.showModalDialog("foreBusinessAction_forwardDetail.action?number="+number,null,"dialogWidth=750px;dialogHeight=450px;dialogLeft=350px;dialogTop=120px;resizable=no");
		});
	},
	checkOrder : function(){
		$("button[name='confirm']").bind("click", function(){
			$.ajax({
				url:"",
				type:"POST",
				data:"",
				
			});
			if($("select[name='isAgree']").val()==1){
				
			}
		});
	}
};

var center = {
	updatePwd : function(){
		$("a[name='confirm']").bind("click", function(){
			var newPwd = $("input[name='newPwd']").val();
			var confirmPwd = $("input[name='confirmPwd']").val();
			var username = $("input[name='username']").val();
			
			if(confirmPwd!=newPwd){
				alert("两次输入的密码不一致!");
				return;
			}
			
			var params = {
				confirmPwd : confirmPwd,
				username : username
			}; 
			
			$.ajax({
				url:"ajaxBusinessAction_ajaxUpatePwd.action",
				type:"POST",
				data:params,
				success:function(msg){
					if(msg == "success"){
						alert("修改成功!");
					}
				}
			});
		});
	}
};

var product = {
	addProduct : function(){
		var param = {
			shopId : $("input[type='hidden']").val()
		};
		$("a[name='addProduct']").bind("click", function(){
			if(window.showModalDialog("foreForwardAction_addProduct.action",param,"dialogWidth=750px;dialogHeight=500px;dialogLeft=320px;dialogTop=100px;resizable=no") == 'ok'){
				location.reload(true);
			}
		});
	},
	updateProduct : function(){
		$("a[name='updateProduct']").bind("click", function(){
			var param = {
				productId : $(this).attr("id")
			};
			
			if(window.showModalDialog("productAction_updateProductUI?productId="+param.productId,param,"dialogWidth=750px;dialogHeight=500px;dialogLeft=320px;dialogTop=100px;resizable=no") == 'ok'){
				location.reload(true);
			}
		});
	},
	delProduct : function(){
		$("a[name='del']").bind("click", function(){
			var param = {
				id : $(this).attr("id")
			};
			
			$.ajax({
				url:"ajaxProductAction_ajaxFalseDelProduct.action",
				type:"POST",
				data:param,
				success:function(msg){
					if(msg == "success"){
						location.reload(true);
					}
				}
			});
		});
	}
};

var init = {
	initEvent : function(){
		shop.judgeShopStatus();
		shop.deleteShopEmployee();
		shop.addShopEmployee();
		shop.orderDetail();
		shop.checkOrder();

		product.addProduct();
		product.updateProduct();
		product.delProduct();
		
		center.updatePwd();
	}
};

$().ready(function(){
	init.initEvent();
});
