var clock = {
	initEvent : function(){		
		clock.setTime();
		
		setInterval(function(){
			clock.setTime();
		},1000);
	},
	
	setTime : function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		
		$("span[class='STYLE7']").text(year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second);
	}
};

$().ready(function() {
    clock.initEvent();
});