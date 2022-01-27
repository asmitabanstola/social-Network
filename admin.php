<?php
session_start();
require 'config/config.php';
?>

  <!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>WELCOME TO VIRTUALLY</title>
	
	<link rel="stylesheet" type="text/css" href="assets/CSS/register_style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<script src="assets/JS/register.js"></script>
	 
</head>
<body>
	<?php
	if (isset($_POST['login_button'])) {
				$username=  $_POST['username'];
       $pass = $_POST['password'];
       $pass=md5($pass);
       $sql = "select * from admin where username='$username' and password='$pass'";
        $query=mysqli_query($con,$sql);
        if($query){
        if(mysqli_num_rows($query)>0){
          $_SESSION['username'] = $username;
          header('location:admin_dashboard.php');
        }else{
          echo "<script>alert('Username or Password is Incorrect,Please try again');</script>";
        }
       } else {
        echo "Errorrrrrr";
       }
	
	}
	?> 

<div class="wrapper">
	<div class="login_box">
		<div class="login_header">
			<h1>VIRTUALLY</h1>
			Admin Login
		</div>

		<div id="first">


			<form action="admin.php" method="POST">
			<input type="text" name="username" placeholder="Username" required>
		<br>

		<input type="password" name="password" placeholder="Password">
		<br>
		<input type="submit" name="login_button" value="Login">
		<br>
		</form>
	
		</div>

<div id="second">
	</div>
</div>
</div>
</body>
</html>