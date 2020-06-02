var init = {
	initEvent : function(){
		$("#update").bind("click", function() {
			return update.checkData();
		});
		
		$("#delete").bind("click", function() {
			return del.checkData();
		});
		
		common.allCheck1();
		common.allCheck2();
		common.allCheckCasecade();
		
		skip.skipPage();
	}
};

var del = {
	deleteConfirm : function() {
		return window.confirm("确定删除？");
	},
	deleteValidate : function() {
		var address = "";
		var index = 0;
		var del_href = "";
		
		$("input[name='checkbox']").each(
				function() {
					if ($(this).attr("checked") == "checked") {
						address = address+ $(this).parent().parent().next("td:first").text() + ",";
						index++;
					}
				});

		if (index == 0) {
			alert("请先选择要删除的数据！");
			return false;
		} else {
			var addresses = address.split(",");

			for (var i = 0; i < addresses.length-1; i++) {
				del_href = del_href + "businessId"+i+"=" +addresses[i];
				
				if(i != addresses.length-2){
					del_href += "&";
				}
			}

			if (del.deleteConfirm()) {
				$("#delete").attr("href", "businessAction_deleteBusiness?"+del_href);

				return true;
			} else {
				return false;
			}
		}
	},
	checkData : function() {
		if ($("#totalData").text() == 0) {
			alert("没有数据，不能修改！");
			return false;
		} else {
			return del.deleteValidate();
		}
	}
};

var update = {
	updateValidate : function() {
		var index = 0;

		$("input[name='checkbox']").each(function() {
			if ($(this).attr("checked") == "checked") {
				index++;
			}
		});

		if (index == 0) {
			alert("请选择要修改的数据！");
			return false;
		} else if (index > 1) {
			alert("请选择一条数据进行修改！");
			return false;
		} else{
			var id = $("input[name='checkbox']:checked").parent().parent().next("td:first").text();
			$("#update").attr("href","businessAction_updateUI?businessId="+id);

			return true;
		}
	},
	checkData : function() {
		if ($("#totalData").text() == 0) {
			alert("没有数据，不能修改！");
			return false;
		} else {
			return update.updateValidate();
		}
	}
};

var skip = {
	skipPage : function(){
		$("#jump").bind("change",function(){
			var num = $(this).val();
			window.location.href="businessAction_getBusinessList?pageNum="+num;
		});
	}
};

var common = {
	// 全选复选框
	allCheck1 : function() {
		$("#checkbox1").bind("click", function() {
			if ($(this).attr("checked") == "checked") {
				$("input[name='checkbox']").attr("checked", true);
				$("#checkbox2").attr("checked", true);
			} else {
				$("input[name='checkbox']").attr("checked", false);
				$("#checkbox2").attr("checked", false);
			}
		});
	},
	allCheck2 : function() {
		$("#checkbox2").bind("click", function() {
			if ($(this).attr("checked") == "checked") {
				$("input[name='checkbox']").attr("checked", true);
				$("#checkbox1").attr("checked", true);
			} else {
				$("input[name='checkbox']").attr("checked", false);
				$("#checkbox1").attr("checked", false);
			}
		});
	},
	allCheckCasecade:function(){
		$("input[name='checkbox']").each(function(){
			$(this).bind("click",function(){
				if($("input[name='checkbox']:checked").size()==$("input[name='checkbox']").size()){
					$("#checkbox1").attr("checked", true);
					$("#checkbox2").attr("checked", true);
				}else{
					$("#checkbox1").attr("checked", false);
					$("#checkbox2").attr("checked", false);
				}
			});
		});
	}
};

$().ready(function() {
	init.initEvent();
});