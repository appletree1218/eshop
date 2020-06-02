var init = {
	initEvent : function(){
		style.addAddress();
		style.buttonStyle();
		style.info();
		style.edit();
		style.del();
		style.pay();
		
		scoll.initEvent();
	}
};

var style = {
	data : {
		receiveInfoId : ""
	},
	
	addAddress : function(){
		$("#addAddress").hover(
			function(){
				$(this).css({cursor:"pointer"});
			}
		);
		
		$("#addAddress").bind("click", function(){
			var param = {
				username : $("input[name='username']").val()
			};
			
			if(window.showModalDialog("receiveInfoAction_addUI.action", param , "dialogWidth=650px;dialogHeight=330px;dialogLeft=330px;dialogTop=120px;resizable=no")=="ok"){
				window.location.reload(true);
			}
		});
	},
	
	buttonStyle : function(){
		$("#rightButton").hover(
			function(){
				$(this).css({cursor:"pointer"});
			}
		);
		
		$("#leftButton").hover(
			function(){
				$(this).css({cursor:"pointer"});
			}
		);
	},
	info : function(){
		$("ul[class='info']").find("li").each(function(){
			$(this).click(function(){
				$(this).css({border:"solid 2px #8B0000"});
				$(this).css({cursor: "pointer"});
				$(this).children("div:first").css({display: "none"});
				$(this).siblings().css({border: "solid 1px #DEDEDE"});
				$(this).attr("id","checked");
				$(this).siblings().attr("id","");
				
				style.data.receiveInfoId = $(this).find("input[name='receiveId']").val();
			});
			
			$(this).hover(
				function(){
					if($(this).attr("id") != "checked"){
						$(this).css({border: "solid 2px #8B0000"});
						$(this).css({cursor: "pointer"});
						$(this).children("div").css({display: "block"});
					}
				},
				function(){
					if($(this).attr("id") != "checked"){
						$(this).css({border: "solid 1px #DEDEDE"});
						$(this).children("div:first").css({display: "none"});
					}
				}
			);
		});
	},
	edit : function(){
		$("a[name='edit']").bind("click", function(){
			var param = {
				username : $("input[name='username']").val(),
			};
			
			if(window.showModalDialog("receiveInfoAction_updateUI?receiveId="+$(this).attr("id"), param , "dialogWidth=650px;dialogHeight=330px;dialogLeft=330px;dialogTop=120px;resizable=no")=="ok"){
				window.location.reload(true);
			}
		});
	},
	del : function(){
		$("a[name='del']").bind("click", function(){
			var id = {
				receiveId : $(this).attr("id")
			};
			$.ajax({
				url:"ajaxReceiveInfoAction_delete.action",
				data:id,
				type:"POST",
				success:function(msg){
					if(msg=="success"){
						window.location.reload(true);
					}
				}
			});
		});
	},
	pay : function(){
		$("#payBtn").bind("click", function(){
			var str = "";
			
			if(style.data.receiveInfoId == ""){
				alert("请选择收货地址!");
				return false;
			}
			
			$("input[name='scId']").each(function(){
				if(str!=""){
					str += ",";
				}
				
				str += $(this).val();
			});
			
			var param = {
				scIds : str,
				username : $("input[name='username']").val(),
				receiveId : style.data.receiveInfoId
			};
			
			$.ajax({
				url:"ajaxOrderAction_submitOrder.action",
				data:param,
				type:"POST",
				success:function(msg){
					if(msg=="success"){
						alert("提交成功!");
					}
				}
			});
		});
	}
};

var scoll = {
	initEvent : function(){
		scoll.leftScoll();
		scoll.rightScoll();
	},
	initData : {
		width : 0,//容器宽度
		imageNum : 0,//图片数量
		startIndex : 1,//图片开始索引
		endIndex : 4 //图片结束索引
	},
	leftScoll : function(){
		$("#leftButton").hover(
			function(){
				$(this).css({cursor:"pointer"});	
			}
		);
		
		$("#leftButton").bind("click", function(){
			scoll.initData.width = $(".info").width();
			scoll.initData.imageNum = $(".info li").length;
			
			if (!$("#leftButton").is(":animated")) {
				if (scoll.initData.endIndex < scoll.initData.imageNum) {
					$(".info").animate({left: "-=222px"}, "normal");
					scoll.initData.startIndex++;
					scoll.initData.endIndex = scoll.initData.startIndex + 3;
				}
			}
		});
	},
	rightScoll : function(){
		scoll.initData.width = $("#receiveInfo").width();
		scoll.initData.imageNum = $("#receiveInfo li").length;
		
		$("#rightButton").hover(
			function(){
				$(this).css({cursor:"pointer"});	
			}
		);
		
		$("#rightButton").bind("click", function(){
			if( !$("#rightButton").is(":animated") ){
				if(scoll.initData.startIndex > 1 && scoll.initData.endIndex <= scoll.initData.imageNum){
					$(".info").animate({left:"+=222px"},"normal");
					scoll.initData.endIndex--;
					scoll.initData.startIndex = scoll.initData.endIndex - 3;
				}
			}
		});
	}
};

$().ready(function(){
	init.initEvent();
});
