<?php
	require'../../config/config.php';
	session_start();
	$userLoggedIn=$_SESSION['username'];
	if(isset($_GET['post_id'])){
		$post_id=$_GET['post_id'];
			$query=mysqli_query($con,"UPDATE posts SET deleted ='yes' WHERE id='$post_id'");
			$query=mysqli_query($con,"UPDATE users SET num_posts=num_posts-1 WHERE username='$userLoggedIn'");
			$query=mysqli_query($con,"DELETE FROM posts WHERE id='$post_id'");
			 header('location:../../admin_dashboard.php');
	}
?>