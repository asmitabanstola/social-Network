$(document).ready(function(){
	//button for profile post
	$('#submit_profile_post').click(function(){
		$.ajax({
			type:"POST",
			url:"includes/handler/ajax_submit_profile_post.php",
			data:$('form.profile_post').serialize(),
			success: function(msg){
				$("#post_form").modal('hide');
				location.reload();
			},
			error:function(){
				alert('Failure');
			}
		});
	});
});
function getUser(value, user) {
	$.post("includes/handler/ajax_friend_search.php", {query:value, userLoggedIn:user}, function(data) {
		$(".results").html(data);
	});
}