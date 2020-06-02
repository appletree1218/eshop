var order = {
	delOrder : function(){
		$("a[name='del']").bind("click", function(){
			var statusId = $("input[name='statusId']").val();
			var number = $(this).attr("id");
			
			var params = {
				statusId : statusId,
				number : number
			};
			
			if(statusId==7 || statusId==8){
				if( window.confirm("确定要删除吗？") ){
					$.ajax({
						url:"ajaxOrderAction_deleteOrder.action",
						type:"POST",
						data:params,
					});
				}
			}else{
				alert("该状态不能进行删除!");
			}
		});
	},
	cancelOrder: function(){
		$("a[name='cancel']").bind("click", function(){
			var statusId = $(this).parent().siblings().find("input[name='statusId']").val();
			if(statusId==10 || statusId==7 || statusId==11){
				alert("该状态下不能取消订单!");
				return false;
			}
			
			if(statusId==8){
				alert("订单已取消!");
				return false;
			}
			
			var param = {
				number : $(this).attr("id")
			};
			
			if(window.confirm("确定取消订单吗?")){
				$.ajax({
					type:"POST",
					url:"ajaxOrderAction_cancelOrder.action",
					data:param,
					success:function(msg){
						if(msg == "success"){
							window.location.reload(true);
						}
					}
				});
			}
		});
	}
};

var init = {
	initEvent : function(){
		order.delOrder();
		order.cancelOrder();
	}
};

$().ready(function(){
	init.initEvent();
});
