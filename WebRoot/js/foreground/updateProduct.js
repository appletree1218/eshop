var change = {
	changeSelect : function(){
		$("select[name='parentType']").bind("change", function(){
			$("select[name='childType']").find("option").remove();
			
			var param = {
				parentId : $(this).val()
			};
			
			$.ajax({
				type:"POST",
				url:"ajaxForwardAction_ajaxAddSelectType.action",
				data:param,
				success:function(list){
					for(var i=0;i<list.length;i++){
						var option = "<option value="+list[i].typeId+">"+list[i].name+"</option>";
						$("select[name='childType']").append(option);
					}
				}
			});
		});
	}
};

//赋值
var load = {
	defaultValue : function(){
		var typeId = $("input[name='typeId']").val();
		var parentId = $("input[name='parentId']").val();
		
		var param = {
			parentId : parentId
		};
		
		$.ajax({
			type:"POST",
			url:"ajaxForwardAction_ajaxAddSelectType.action",
			data:param,
			success:function(list){
				for(var i=0;i<list.length;i++){
					var option = "<option value="+list[i].typeId+">"+list[i].name+"</option>";
					$("select[name='childType']").append(option);
				}
			}
		});
		
		$("select[name='parentType']").find("option").each(function(){
			if( $(this).val()==parentId ){
				$(this).attr("selected", "selected");
			}
		});
		
		$("select[name='childType']").find("option").each(function(){
			if( $(this).val()==typeId ){
				$(this).attr("selected", "selected");
			}
		});
	},
	changePreview : function(){
		$("input[name='uploadImages']").each(function(){
			$(this).bind("change", function(){
				$(this).siblings("img").attr("src",window.URL.createObjectURL(this.files[0]));
			});
		});
	}
};

var init = {
	initEvent : function(){
		$("input[type='button']").bind("click", function(){
			$("form").submit();
			window.opener=null;
			window.returnValue='ok';
			window.close();
		});
		
		change.changeSelect();
		load.defaultValue();
		load.changePreview();
	}
};

$().ready(function(){
	init.initEvent();
});
