<!DOCTYPE html>
<html>
<head>
	<title>
		<link rel="stylesheet" type="text/css" href="assets/CSS/style.css">
	</title>
</head>
<body>
 <?php
// session_start();
require 'config/config.php';
nclude("includes/classes/User.php");
include("includes/classes/Post.php");
if (isset($_SESSION['username'])) {
 	$userLoggedIn = $_SESSION['username'];
 	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
 	$user = mysqli_fetch_array($user_details_query);
 }
 else{
 	Location:'register.php';
}
?>
<script>
	function toggle(){
		var element=document.getElementById('comment_section');
		if(element.style.display=="block")
			element.style.display="none";
		else
			element.style.display="block";
	}
</script>
<?php
if(isset($_GET['post_id'])){
	$post_id=$_GET['post_id'];
}
$user_query=mysqli_query($con,"SELECT added_by,user_to From posts WHERE id='$post_id'");
$row=mysqli_fetch_array($user_query);
$posted_to=$row['added_by'];
if(isset($_POSt['postComment'.$post_id])){
	$post_body=$_POST['post_body'];
	$post_body=mysqli_escape_string($con,$post_body);
	$date_time_now=date("Y-m-d H:i:s");
	$insert_post=mysqli_query($con,"INSERT INTO comments VALUES('','$post_body','$userLoggedIn','$posted_to','$date_time_now','no','$post_id')");
	echo"<p> Comment Posted</p>";
}
?>
<form action="comment_frame.php?post_id=<?php echo $post_id; ?>" id="comment_form" name="postcomment<?php echo $post_id;?>" method="POST">
	<textarea name="post_body"></textarea>
	<input type="submit" name="postComment<?php echo $post_id?>" value="Post">
	</form>