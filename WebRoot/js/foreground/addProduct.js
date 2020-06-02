var change = {
	changeSelect : function(){
		$("input[name='shopId']").val(window.dialogArguments.shopId);
		
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

var show = {
	showImage : function(){
		$("input[name='uploadImages']").each(function(){
			$(this).bind("change", function(){
				$(this).siblings("img").attr("src",show.getFullPath(this));
			});
		});
	},
	getFullPath : function(obj)  {
        if (obj.files) {
            return window.URL.createObjectURL(obj.files[0]);
        }
		
		return obj.value();
	}
};

var init = {
	initEvent : function(){
		change.changeSelect();
		show.showImage();
	}
};

$().ready(function(){
	init.initEvent();
});
