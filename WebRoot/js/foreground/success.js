$().ready(function(){
	var i = 3;
	
	setInterval(function(){
		skipIndex();
	},1000);
	
	function skipIndex(){
		if( i==0 ){
			window.location.href = "index.jsp";
		}
		
		$("#num").text(i);
		
		i--;
	}
});
