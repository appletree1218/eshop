// JavaScript Document
function switchTab(ProTag, ProBox) {
	for (var i = 1; i < 3; i++) {
		if ("tab" + i == ProTag) {
			$("#"+ProTag).addClass("on");
//			document.getElementById(ProTag).getElementsByTagName("a")[0].className = "on";
		} else {
			$("#tab"+i).removeClass("on");
//			document.getElementById("tab" + i).getElementsByTagName("a")[0].className = "";
		}
		if ("con" + i == ProBox) {
			document.getElementById(ProBox).style.display = "";
		} else {
			document.getElementById("con" + i).style.display = "none";
		}
	}
}

