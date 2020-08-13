var init = 0;
$(document).ready(function(event) {
	// event window - Task #4683
	var doc = document.documentElement;
	$(window).scroll( function() {
		var left = (window.pageXOffset || doc.scrollLeft) - (doc.clientLeft || 0);
		if(init == 0) {
			init =   1;
			left = 0;
		}
		
		var width = $(this).width();
		if(width < 1366) {
			width = 1366;
		}
		$(".header_bar").css("margin-left", -left + "px" );
		$(".header_bar").css("width", width + left + "px" );
	});
});