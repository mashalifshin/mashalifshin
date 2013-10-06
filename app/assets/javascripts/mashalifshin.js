$(document).ready(function() {
	$(".comments_zippy").hide();
	
	$(".comment_count").on("click", function() {
		$(this).siblings(".comments_zippy").toggle();
	});
});