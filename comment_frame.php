<?php
session_start();
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
if (isset($_SESSION['username'])) {
 	$userLoggedIn = $_SESSION['id'];
 	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
 	$user = mysqli_fetch_array($user_details_query);
 }
 else{
 	header('location:register.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>
		<link rel="stylesheet" type="text/css" href="assets/CSS/style.css">
	</title>
</head>
<body>
	<style type="text/css">
		*{
			font-size: 14px;
			font-family: Sans-serif;
		}

		.comment_form textarea {
			width: 85%;
			height: 35px;
			border-radius: 5px;
			color: #616060;
			font-size: 14px;
			margin: 3px 3px 3px 5px;
		}
		.comment_form input[type="submit"] {
			border:none;
			color: #156588;
			border-radius: 5px;
			background-color: #2c2c54;
			width: 13%;
			height: 35px;
			margin-top: 3px;
			position: absolute;
			font-family:ssans-serif;
			text-shadow: #73B6E2 0.5px 0.5px 0px;
		}
		.comment_section {
			padding: 5px 5px 5px 5px;
		}
		.comment_section img {
			margin: 3px 3px 3px 3px;
			border-radius: 50%;
		}
	</style>
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
	$user_query=mysqli_query($con,"SELECT added_by From posts WHERE id='$post_id'");
	$row=mysqli_fetch_array($user_query);
	$posted_to=$row['added_by'];
	if(isset($_POST['postComment'.$post_id])){
		$post_body=$_POST['post_body'];
		$post_body=mysqli_escape_string($con,$post_body);
		$date_time_now=date("Y-m-d H:i:s");
		$insert_post=mysqli_query($con,"INSERT INTO comments VALUES('','$post_body','$userLoggedIn','$posted_to','$date_time_now','no','$post_id')");
		echo"<p> Comment Posted!</p>";
	}
?>
<div class="comment_form">
	<form action="comment_frame.php?post_id=<?php echo $post_id; ?>"  name="postcomment<?php echo $post_id;?>" method="POST">
	<textarea name="post_body"></textarea>
	<input type="submit" name="postComment<?php echo $post_id?>" value="Post">
	</form>
</div>
<!-- loading comments-->
<?php
		$get_comments=mysqli_query($con,"SELECT * FROM comments Where post_id='$post_id' ORDER BY post_id ASC");
		$count = mysqli_num_rows($get_comments);
		if($count != 0){
			while($comment=mysqli_fetch_array($get_comments)){
				$comment_body=$comment['post_body'];
				$posted_to=$comment['posted_to'];
				$posted_by=$comment['posted_by'];
				$date_added=$comment['date_added'];
				$removed=$comment['removed'];
				$p_by=mysqli_query($con,"SELECT username FROM users WHERE id='$posted_by' ");
				$posted_by=implode("",mysqli_fetch_assoc($p_by));
				//Timeframe
							$date_time_now = date("Y-m-d H:i:s");
							$start_date = new DateTime($date_added); //Time of post
							$end_date = new DateTime($date_time_now); //Current time
							$interval = $start_date->diff($end_date); //Difference between dates 
							if($interval->y >= 1) {
								if($interval == 1)
									$time_message = $interval->y . " year ago"; //1 year ago
								else 
									$time_message = $interval->y . " years ago"; //1+ year ago
							}
							else if ($interval-> m >= 1) {
								if($interval->d == 0) {
									$days = " ago";
								}
								else if($interval->d == 1) {
									$days = $interval->d . " day ago";
								}
								else {
									$days = $interval->d . " days ago";
								}


								if($interval->m == 1) {
									$time_message = $interval->m . " month". $days;
								}
								else {
									$time_message = $interval->m . " months". $days;
								}

							}
							else if($interval->d >= 1) {
								if($interval->d == 1) {
									$time_message = "Yesterday";
								}
								else {
									$time_message = $interval->d . " days ago";
								}
							}
							else if($interval->h >= 1) {
								if($interval->h == 1) {
									$time_message = $interval->h . " hour ago";
								}
								else {
									$time_message = $interval->h . " hours ago";
								}
							}
							else if($interval->i >= 1) {
								if($interval->i == 1) {
									$time_message = $interval->i . " minute ago";
								}
								else {
									$time_message = $interval->i . " minutes ago";
								}
							}
							else {
								if($interval->s < 30) {
									$time_message = "Just now";
								}
								else {
									$time_message = $interval->s . " seconds ago";
								}
							}
							$user_obj=new User($con,$posted_by);
?>
					<div class="comment_section">
						<a href="<?php echo $posted_by;?>" target="_parent"><img src="<?php echo $user_obj->getProfilePic();?>" title="<?php echo $posted_by; ?>" style="float:left;" height="30"></a>
						<a href="<?php echo $posted_by?>" target="_parent"> <?php echo $user_obj->getFirstAndLastName(); ?> </a>
						&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $time_message . "<br>" . $comment_body; ?> 
						<hr>
			</div>
			<?php

		}
	}
	else {
		echo "<center><br><br>No Comments to Show!</center>";
	}

	?>






</body>
</html>