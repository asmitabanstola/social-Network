<?php
	require'../../config/config.php';
	session_start();
	$userLoggedId=$_SESSION['id'];
	if(isset($_GET['post_id']))
		$post_id=$_GET['post_id'];
	if(isset($_POST['result'])){
		if($_POST['result']=='true')
			$q=mysqli_query($con,"SELECT added_by From posts WHERE id=$post_id");
			$added_by=implode("",mysqli_fetch_assoc($q));
			$query=mysqli_query($con,"INSERT INTO reports VALUES ('',$userLoggedId,$post_id,$added_by,'Inappropriate')");
	}
?>