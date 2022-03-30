<?php
 	include('../../config/config.php');
	if(isset($_GET['delete'])){
	$id=$_GET['delete'];
	$query=mysqli_query($con,"DELETE FROM users WHERE id=$id");
	}
	header('location:../../admin_dashboard_users.php');
?>