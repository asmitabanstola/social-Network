
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
		 	font-family:Arial,Helvetica, sans-serif;
		 }
		body{
			background-color: none;
		}
		 form{
			position: absolute;
			top: 0;
			}

	</style>
	<body>
	<?php
	session_start();
	require 'config/config.php';
	include("includes/classes/User.php");
	include("includes/classes/Post.php");
	if (isset($_SESSION['username'])) {
	 	$userLoggedIn = $_SESSION['username'];
	 	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
	 	$user = mysqli_fetch_array($user_details_query);
	 	$id=$user['id'];
	 }
	 else{
	 	header('location:register.php');
	}
	if(isset($_GET['post_id'])){
		$post_id=$_GET['post_id'];
	}
	//rating button
	if(isset($_POST['rating_button'])){
		$rating = $_POST['rating'];
		if($rating <=5 && $rating>=0){
		$insert_user=mysqli_query($con,"INSERT INTO ratings VALUES('',$id,$post_id,$rating)");
		// $rate_post=mysqli_query($con,"UPDATE posts SET rating = CONCAT(rating,'$rating,')WHERE post_id='$post_id'");
	}
	else{
		echo'alert("Rate within range 1-5");';
	}
	}
	//check for previous rating
	$check_query=mysqli_query($con,"SELECT rating FROM ratings WHERE user_id=$id AND post_id='$post_id'");
	$num_rows=mysqli_num_rows($check_query);
	if($num_rows>0){
		$rating=implode("",mysqli_fetch_assoc($check_query));
		echo'<form action="rating.php?post_id=' .$post_id .'" method="POST">'.
		'<div class="rated_value"style="display:contents;">'. $rating .' Rating
		</div>
		</form>';
	}else{
		echo'<form action="rating.php?post_id=' .$post_id .'" method="POST">
		<input type="number" name="rating" id="rating">
		<input type="submit" class="comment_rate" name="rating_button" value="Rate">
		</div>
		</form>';
	}

?>
</body>
</html>