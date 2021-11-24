 <?php
// session_start();
require 'config/config.php';

 //print_r($_SESSION['username']);

if (isset($_SESSION['username'])) {
 	$userLoggedIn = $_SESSION['username'];
 	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
 	$user = mysqli_fetch_array($user_details_query);
 }
 else{
 	Location:'register.php';
}
?>
<html>
<head>
		<title>WELCOME TO VIRTUALLY</title>

		
		<script src="assets/JS/jquery.min.js"></script>
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
		<script src="assets/JS/bootstrap.js"></script>

	<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

		<link rel="stylesheet" type="text/css" href="assets/CSS/bootstrap.css">

		<link rel="stylesheet" type="text/css" href="assets/CSS/style.css">

</head>
<body>
	<div class="top_bar">
		 <a class="navbar-brand" ><font face="papyrus">Virtually</font></a>
			<!-- <img src="assets/images/icon.png"> -->
	
	<nav>
		<a href="#">
			 <?php echo $user['first_name']; ?>
  	</a> 

  	<a href="#"><i class="fa fa-home fa-lg"></i>
  	</a>


  	<a href="#">
  		<i class="fa fa-bell-o fa-lg"></i>
  	</a>

  	<a href="#">
  		<i class="fa fa-envelope fa-lg"></i>
  	</a>

  	<a href="#">
  		<i class="fa fa-user fa-lg"></i>
  	</a>

  	<a href="#">
  		<i class="fa fa-wrench fa-lg"></i>
  	</a>

  	<a href="includes/handler/logout.php">
  		<i class="fa fa-sign-out fa-lg"></i>
  	</a>
  </nav>

	</div>

	<div class="wrapper">


 



